<?php
require_once('includes/config.php');
require_once('includes/classes/class.template_engine.php');
require_once('includes/classes/class.country.php');
require_once('includes/functions/func.global.php');
require_once('includes/functions/func.users.php');
require_once('includes/functions/func.sqlquery.php');
if(isset($_GET['lang'])) {
    if ($_GET['lang'] != ""){
        change_user_lang($_GET['lang']);
    }
}

require_once('includes/lang/lang_'.$config['lang'].'.php');
require_once('includes/seo-url.php');
sec_session_start();
$mysqli = db_connect($config);


if(!isset($_GET['sort']))
    $sort = "id";
elseif($_GET['sort'] == "title")
    $sort = "product_name";
elseif($_GET['sort'] == "price")
    $sort = "price";
elseif($_GET['sort'] == "date")
    $sort = "created_at";
else
    $sort = "id";

$limit = isset($_GET['limit']) ? $_GET['limit'] : 20;
$filter = isset($_GET['filter']) ? $_GET['filter'] : "";
$sorting = isset($_GET['sort']) ? $_GET['sort'] : "Newest";
$budget = isset($_GET['budget']) ? $_GET['budget'] : "";
$keywords = isset($_GET['keywords']) ? str_replace("-"," ",$_GET['keywords']) : "";

$category = "";
$subcat = "";

if(isset($_GET['subcat']) && !empty($_GET['subcat'])){

    if(is_numeric($_GET['subcat'])){
        if(check_sub_category_exists($_GET['subcat'])){
            $subcat = $_GET['subcat'];
        }
    }else{
        $subcat = get_subcategory_id_by_slug($config,$_GET['subcat']);
    }
}elseif(isset($_GET['cat']) && !empty($_GET['cat'])){
    if(is_numeric($_GET['cat'])){
        if(check_category_exists($_GET['cat'])){
            $category = $_GET['cat'];
        }
    }else{
        $category = get_category_id_by_slug($config,$_GET['cat']);
    }
}

if($subcat != ''){
    $custom_fields = get_customFields_by_catid($config,$mysqli,'',$subcat,false);
}else if($category != ''){
    $custom_fields = get_customFields_by_catid($config,$mysqli,$category,'',false);
}else{
    $custom_fields = get_customFields_by_catid($config,$mysqli,'','',false);
}

$custom = array();
if(isset($_GET['custom']) && !empty($_GET['custom'])){
    $custom = $_GET['custom'];
}


if(isset($_GET['city']) && !empty($_GET['city'])){
    $city = $_GET['city'];
}else{
    $city = "";
}


$total = 0;

$where = '';
$order_by_keyword = '';
if(isset($_GET['keywords']) && !empty($_GET['keywords'])){
    $where.= "AND (p.product_name LIKE '%$keywords%' or p.tag LIKE '%$keywords%') ";
    $order_by_keyword = "(CASE
    WHEN p.product_name = '$keywords' THEN 1
    WHEN p.product_name LIKE '$keywords%' THEN 2
    WHEN p.product_name LIKE '%$keywords%' THEN 3
    WHEN p.tag = '$keywords' THEN 4
    WHEN p.tag LIKE '$keywords%' THEN 5
    WHEN p.tag LIKE '%$keywords%' THEN 6
    ELSE 7
  END),";
}

if(isset($category) && !empty($category)){
    $where.= "AND (p.category = '$category') ";
}

if(isset($_GET['subcat']) && !empty($_GET['subcat'])){
    $where.= "AND (p.sub_category = '$subcat') ";
}


if (isset($_GET['range1']) && $_GET['range1'] != '') {
    $range1 = str_replace('.', '', $_GET['range1']);
    $range2 = str_replace('.', '', $_GET['range2']);
    $where.= ' AND (p.price BETWEEN '.$range1.' AND '.$range2.')';
} else {
    $range1 = "";
    $range2 = "";
}

if(isset($_GET['city']) && !empty($_GET['city']))
{
    $where.= "AND (p.city = '".$_GET['city']."') ";
}
elseif(isset($_GET['location']) && !empty($_GET['location']))
{
    $placetype = $_GET['placetype'];
    $placeid = $_GET['placeid'];

    if($placetype == "country"){
        $where.= "AND (p.country = '$placeid') ";
    }elseif($placetype == "state"){
        $where.= "AND (p.state = '$placeid') ";
    }else{
        $where.= "AND (p.city = '$placeid') ";
    }
}
else{
    $country_code = check_user_country($config);
    $where.= "AND (p.country = '$country_code') ";
}

if(isset($_GET['custom'])) {

    $whr_count = 0;
    $custom_where = "";
    foreach ($_GET['custom'] as $key => $value) {
        if (empty($value)) {
            unset($_GET['custom'][$key]);
        }
        if (!empty($_GET['custom'])) {
            // custom value is not empty.
            $cond = "";
            if (is_array($value)) {
                $cond = "(";
                $cond_count = 0;
                foreach ($value as $val) {
                    if ($cond_count == 0) {
                        $cond .= " find_in_set('$val',c.field_data) <> 0 ";
                    } else {
                        $cond .= " or find_in_set('$val',c.field_data) <> 0 ";
                    }
                    $cond_count++;
                }
                $cond .= ")";
                $case = $cond;
            }
            else {
                $case = "CASE
    WHEN (c.field_type = 'text-field' or c.field_type = 'textarea') THEN c.field_data LIKE '%$value%'
    ELSE c.field_data = '$value'
  END";
            }

            if ($key != "" && $value != "") {

                if ($whr_count == 0) {
                    $custom_where .= " AND ( ( c.field_id = '$key' and $case )";
                } else {
                    $custom_where .= " OR ( c.field_id = '$key' and $case )";
                }
                $whr_count++;
            }
        }

    }
    if($custom_where != "")
        $where .= $custom_where.")";

    if (!empty($_GET['custom'])) {
        $sql = "SELECT DISTINCT p.*
FROM `".$config['db']['pre']."product` AS p
JOIN `".$config['db']['pre']."custom_data` AS c ON c.product_id = p.id
 WHERE status = 'active' AND hide = 0 ";
    }else{
        $sql = "SELECT DISTINCT p.*
FROM `".$config['db']['pre']."product` AS p
 WHERE p.status = 'active' AND hide = 0 ";
    }

    $totalWithoutFilter = mysqli_num_rows(mysqli_query($mysqli, "$sql $where"));
}
else{
    $totalWithoutFilter = mysqli_num_rows(mysqli_query($mysqli, "SELECT 1 FROM ".$config['db']['pre']."product as p where status = 'active' $where"));
}




if(isset($_GET['filter'])){
    if($_GET['filter'] == 'free')
    {
        $where.= "AND (p.urgent='0' AND p.featured='0' AND p.highlight='0') ";
    }
    elseif($_GET['filter'] == 'featured')
    {
        $where.= "AND (p.featured='1') ";
    }
    elseif($_GET['filter'] == 'urgent')
    {
        $where.= "AND (p.urgent='1') ";
    }
    elseif($_GET['filter'] == 'highlight')
    {
        $where.= "AND (p.highlight='1') ";
    }
}



$order_by = "
      (CASE
        WHEN g.top_search_result = 'yes' and p.featured = '1' and p.urgent = '1' and p.highlight = '1' THEN 1
        WHEN g.top_search_result = 'yes' and p.urgent = '1' and p.featured = '1' THEN 2
        WHEN g.top_search_result = 'yes' and p.urgent = '1' and p.highlight = '1' THEN 3
        WHEN g.top_search_result = 'yes' and p.featured = '1' and p.highlight = '1' THEN 4
        WHEN g.top_search_result = 'yes' and p.urgent = '1' THEN 5
        WHEN g.top_search_result = 'yes' and p.featured = '1' THEN 6
        WHEN g.top_search_result = 'yes' and p.highlight = '1' THEN 7
        WHEN g.top_search_result = 'yes' THEN 8
        WHEN p.featured = '1' and p.urgent = '1' and p.highlight = '1' THEN 9
        WHEN p.urgent = '1' and p.featured = '1' THEN 10
        WHEN p.urgent = '1' and p.highlight = '1' THEN 11
        WHEN p.featured = '1' and p.highlight = '1' THEN 12
        WHEN p.urgent = '1' THEN 13
        WHEN p.featured = '1' THEN 14
        WHEN p.highlight = '1' THEN 15
        ELSE 16
      END),".$order_by_keyword." $sort $order";

if(isset($_GET['custom']))
{
    if (!empty($_GET['custom'])) {
        $sql = "SELECT DISTINCT p.*
FROM `".$config['db']['pre']."product` AS p
JOIN `".$config['db']['pre']."custom_data` AS c ON c.product_id = p.id
 WHERE status = 'active' ";
    }else{
        $sql = "SELECT DISTINCT p.*
FROM `".$config['db']['pre']."product` AS p
 WHERE p.status = 'active' ";
    }

    $query =  $sql . " $where ORDER BY $sort $order LIMIT ".($page_number-1)*$limit.",$limit";

    $total = mysqli_num_rows(mysqli_query($mysqli, "$sql $where"));
    $featuredAds = mysqli_num_rows(mysqli_query($mysqli, "$sql and (p.featured='1') $where"));
    $urgentAds = mysqli_num_rows(mysqli_query($mysqli, "$sql and (p.urgent='1') $where"));

}
else{
    $total = mysqli_num_rows(mysqli_query($mysqli, "SELECT 1 FROM ".$config['db']['pre']."product as p where status = 'active' $where"));
    $featuredAds = mysqli_num_rows(mysqli_query($mysqli, "SELECT 1 FROM ".$config['db']['pre']."product as p where status = 'active' and featured='1' $where"));
    $urgentAds = mysqli_num_rows(mysqli_query($mysqli, "SELECT 1 FROM ".$config['db']['pre']."product as p where status = 'active' and urgent='1' $where"));


    $query = "SELECT p.*,u.group_id,g.top_search_result FROM `".$config['db']['pre']."product` as p
    INNER JOIN `".$config['db']['pre']."user` as u ON u.id = p.user_id
    INNER JOIN `".$config['db']['pre']."usergroups` as g ON g.group_id = u.group_id
     where p.status = 'active' $where ORDER BY $order_by LIMIT ".($page_number-1)*$limit.",$limit";

}


$selected = "";
if(isset($_GET['cat']) && !empty($_GET['cat'])){
    $selected = $_GET['cat'];
}

$GetCategory = get_maincategory($config,$selected);
$cat_dropdown = get_categories_dropdown($config,$lang);
$cat_mobile = get_categories_dropdown_mobile($config,$lang);
$maincatname = get_maincat_by_id($config,$category);
$maincatname = $maincatname['cat_name'];
$mainCategory = isset($category) ? $maincatname : "";
$subcatname = get_subcat_by_id($config,$subcat);
$subcatname = $subcatname['sub_cat_name'];
$subCategory = isset($subcat) ? $subcatname : "";

if(isset($match['params']['country'])) {
    if ($match['params']['country'] != ""){
        change_user_country($config,$match['params']['country']);
    }
}
$sortname = check_user_country($config);

if($latlong = get_lat_long_of_country($config,$sortname)){
    $mapLat     =  $latlong['lat'];
    $mapLong    =  $latlong['lng'];
}else{
    $mapLat     =  get_option($config,"home_map_latitude");
    $mapLong    =  get_option($config,"home_map_longitude");
}
//Loop for Premium Ads and (featured = 1 or urgent = 1 or highlight = 1)
//echo "<pre>";
$item = get_items($config,"","active",true,1,5,"id",true,true,"DESC");
$item2 = get_items($config,"","active",false,1,5,"id",true);
//echo "</pre>";
$category = get_maincategory($config,$mysqli);
$cat_dropdown = get_categories_dropdown($config,$lang);

$query = "SELECT * FROM ".$config['db']['pre']."catagory_main ORDER by cat_order ASC";
$query_result = mysqli_query($mysqli,$query);
while ($info = mysqli_fetch_array($query_result)){
    if($config['lang_code'] != 'en' && $config['userlangsel'] == '1'){
        $maincat = get_category_translation("main",$info['cat_id']);
        $info['cat_name'] = $maincat['title'];
        $info['slug'] = $maincat['slug'];
    }
    $cat[$info['cat_id']]['icon'] = $info['icon'];
    $cat[$info['cat_id']]['picture'] = $info['picture'];
    $cat[$info['cat_id']]['main_title'] = $info['cat_name'];
    $cat[$info['cat_id']]['main_id'] = $info['cat_id'];

    $cat[$info['cat_id']]['catlink'] = $config['site_url'].'category/'.$info['slug'];

    $totalAdsMaincat = get_items_count($config,false,"active",false,null,$info['cat_id'],true);
    $cat[$info['cat_id']]['main_ads_count'] = $totalAdsMaincat;
    $count = 1;
    $query1 = "SELECT * FROM ".$config['db']['pre']."catagory_sub WHERE `main_cat_id` = '".$info['cat_id']."' LIMIT 4";
    $query_result1 = mysqli_query($mysqli,$query1);
    while ($info1 = mysqli_fetch_array($query_result1))
    {
        $totalads = get_items_count($config,false,"active",false,$info1['sub_cat_id'],null,true);

        if($config['lang_code'] != 'en' && $config['userlangsel'] == '1'){
            $subcat = get_category_translation("sub",$info1['sub_cat_id']);
            $info1['sub_cat_name'] = $subcat['title'];
            $info1['slug'] = $subcat['slug'];
        }
        $subcatlink = $config['site_url'].'category/'.$info['slug'].'/'.$info1['slug'];

        if($count == 1)
            $cat[$info['cat_id']]['sub_title'] = '<li><a href="'.$subcatlink.'" title="'.$info1['sub_cat_name'].'">'.$info1['sub_cat_name'].'</a></li>';
        else
            $cat[$info['cat_id']]['sub_title'] .= '<li><a href="'.$subcatlink.'" title="'.$info1['sub_cat_name'].'">'.$info1['sub_cat_name'].'</a></li>';

        if($count == 4)
            $cat[$info['cat_id']]['sub_title'] .= '<li><a href="'.$link['SITEMAP'].'" style="color: #6f6f6f;text-decoration: underline;">'.$lang['VIEW-MORE'].'...</a>('.$totalAdsMaincat.')</li>';
        $count++;
    }
}
// Output to template

if($config['home_page'] == "home-map"){
    $page = new HtmlTemplate ('templates/'.$config['tpl_name'].'/home-map.tpl');
}
else{
    $page = new HtmlTemplate ('templates/'.$config['tpl_name'].'/index.tpl');
}
$cat_mobile = get_categories_dropdown_mobile($config,$lang);
    $country_code = check_user_country($config);
    $countryName = get_countryName_by_sortname($config,$country_code);
    $home_location=[];
    $query_mc = "SELECT asciiname, code FROM ".$config['db']['pre']."subadmin1 where code like '%".$country_code."%' ORDER BY asciiname";
    $query_result_mc = @mysqli_query($mysqli,$query_mc);
    while ($r = @mysqli_fetch_array($query_result_mc)){
        $home_location[]=['name'=> $r['asciiname'],'c'=>$config['site_url'].'listing?placetype=state&placeid='.$r['code'].'&location='.$r['asciiname'].'%2C+Region'];
    }
    
    
$query = "SELECT * FROM `".$config['db']['pre']."homebanners` ORDER by date ASC";
$result = $mysqli->query($query);
$banners=[];
while ($row = mysqli_fetch_assoc($result)) {
    $banners[]=$row;
}

$plocation = $_GET['location']; 
$page->SetParameter ('PLOCATION', $plocation);
$page->SetParameter ('CAT_MOBILE',$cat_mobile);
$page->SetParameter ('OVERALL_HEADER', create_header());
$page->SetLoop ('ITEM', $item);
$page->SetLoop ('HOME_BANNERS', $banners);
$page->SetLoop ('ITEM2', $item2);
$page->SetLoop ('CATEGORY',$category);
$page->SetParameter ('CAT_DROPDOWN',$cat_dropdown);
$page->SetLoop('HOME_LOOP_CITIES',$home_location);
$page->SetLoop ('CAT',$cat);
/*Advertisement Fetching*/
$advertise_top = get_advertise($config,"top");
$advertise_bottom = get_advertise($config,"bottom");
$advertise_left = get_advertise($config,"left_sidebar");
$advertise_right = get_advertise($config,"right_sidebar");

$page->SetParameter('TOP_ADSCODE', $advertise_top['tpl']);
$page->SetParameter('TOP_ADSTATUS', $advertise_top['status']);
$page->SetParameter('BOTTOM_ADSCODE', $advertise_bottom['tpl']);
$page->SetParameter('BOTTOM_ADSTATUS', $advertise_bottom['status']);
$page->SetParameter('LEFT_ADSCODE', $advertise_left['tpl']);
$page->SetParameter('LEFT_ADSTATUS', $advertise_left['status']);
$page->SetParameter('RIGHT_ADSCODE', $advertise_right['tpl']);
$page->SetParameter('RIGHT_ADSTATUS', $advertise_right['status']);

if($advertise_left['status'] == 1 && $advertise_right['status'] == 1){
    $category_column = "col-md-8";
}else if($advertise_left['status'] == 0 && $advertise_right['status'] == 1){
    $category_column = "col-md-10";
}else if($advertise_left['status'] == 1 && $advertise_right['status'] == 0){
    $category_column = "col-md-10";
}else{
    $category_column = "col-md-12";
}
$ptype = $_GET['placetype'];
$pid = $_GET['placeid'];  
$page->SetParameter('CATEGORY_COLUMN', $category_column);
/*Advertisement Fetching*/
$page->SetParameter('BANNER_IMAGE', $config['home_banner']);
$page->SetParameter('LATITUDE', $mapLat);
$page->SetParameter('LONGITUDE', $mapLong);
$page->SetParameter('MAP_COLOR', $config['map_color']);
$page->SetParameter('ZOOM', $config['home_map_zoom']);
$page->SetParameter('DEFAULT_COUNTRY', get_countryName_by_sortname($config,$sortname));
$page->SetParameter('SPECIFIC_COUNTRY', $sortname);
$page->SetParameter ('MAINCAT', $category);
$page->SetParameter ('SUBCAT', $subcat);
$page->SetParameter ('LIMIT', $limit);
$page->SetParameter ('FILTER', $filter);
$page->SetParameter ('SORT', $sorting);
$page->SetParameter ('ORDER', $order);
$page->SetParameter ('PTYPE', $ptype);
$page->SetParameter ('PID', $pid);
$page->SetParameter ('OVERALL_FOOTER', create_footer());
$page->CreatePageEcho();
?>