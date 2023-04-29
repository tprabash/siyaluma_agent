<?php
require_once('includes/config.php');
require_once('includes/classes/class.template_engine.php');
require_once('includes/classes/class.country.php');
require_once('includes/functions/func.global.php');
require_once('includes/functions/func.users.php');
require_once('includes/functions/func.sqlquery.php');
require_once('includes/lang/lang_'.$config['lang'].'.php');
require_once('includes/seo-url.php');

$mysqli = db_connect($config);
sec_session_start();


if(!isset($_GET['page']))
    $page_number = 1;
else{
    $page_number = $_GET['page'];
}

if(!isset($_GET['order']))
    $order = "DESC";
else{
    if($_GET['order'] == ""){
        $order = "DESC";
    }else{
        $order = $_GET['order'];
    }
}


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

$count = 0;


//Loop for list view
$item = array();
$result = $mysqli->query($query);
if (mysqli_num_rows($result) > 0) {
    // output data of each row
    while($info = mysqli_fetch_assoc($result)) {
        $item[$info['id']]['id'] = $info['id'];
        $item[$info['id']]['featured'] = $info['featured'];
        $item[$info['id']]['urgent'] = $info['urgent'];
        $item[$info['id']]['highlight'] = $info['highlight'];
        $item[$info['id']]['product_name'] = $info['product_name'];
        $item[$info['id']]['description'] = $info['description'];
        $item[$info['id']]['category'] = $info['category'];
        $item[$info['id']]['price'] = $info['price'];
        $item[$info['id']]['phone'] = $info['phone'];
        $item[$info['id']]['address'] = strlimiter($info['location'],20);
        $cityname = get_cityName_by_id($config,$info['city']);
        $item[$info['id']]['location'] = $cityname;
        $item[$info['id']]['city'] = $cityname;
        $item[$info['id']]['state'] = get_stateName_by_id($config,$info['state']);
        $item[$info['id']]['country'] = get_countryName_by_id($config,$info['country']);
        $item[$info['id']]['latlong'] = $info['latlong'];

        $item[$info['id']]['tag'] = $info['tag'];
        $item[$info['id']]['status'] = $info['status'];
        $item[$info['id']]['view'] = $info['view'];
        //$item[$info['id']]['created_at'] = timeAgo($info['created_at']);
        $item[$info['id']]['created_at'] = convertDateTime(strtotime($info['created_at']));
        $item[$info['id']]['updated_at'] = date('d M Y', $info['updated_at']);

        $item[$info['id']]['cat_id'] = $info['category'];
        $item[$info['id']]['sub_cat_id'] = $info['sub_category'];
        $get_main = get_maincat_by_id($config,$info['category']);
        $get_sub = get_subcat_by_id($config,$info['sub_category']);
        $item[$info['id']]['category'] = $get_main['cat_name'];
        $item[$info['id']]['sub_category'] = $get_sub['sub_cat_name'];

        $item[$info['id']]['favorite'] = check_product_favorite($config,$info['id']);

        $picture     =   explode(',' ,$info['screen_shot']);
        $item[$info['id']]['pic_count'] = count($picture);
        if($picture[0] != ""){
            $item[$info['id']]['picture'] = $picture[0];
        }else{
            $item[$info['id']]['picture'] = "default.png";
        }

        $price = price_format($info['price'],$info['country']);
        $item[$info['id']]['price'] = $price;

        if($info['tag'] != ''){
            $item[$info['id']]['showtag'] = "1";
            $tag = explode(',', $info['tag']);
            $tag2 = array();
            foreach ($tag as $val)
            {
                //REMOVE SPACE FROM $VALUE ----
                $val = preg_replace("/[\s_]/","-", trim($val));
                $tag2[] = '<li><a href="'.$config['site_url'].'/listing?keywords='.$val.'">'.$val.'</a> </li>';
            }
            $item[$info['id']]['tag'] = implode('  ', $tag2);
        }else{
            $item[$info['id']]['tag'] = "";
            $item[$info['id']]['showtag'] = "0";
        }



        $user = "SELECT username FROM ".$config['db']['pre']."user where id='".$info['user_id']."'";
        $userresult = mysqli_query($mysqli, $user);
        $userinfo = mysqli_fetch_assoc($userresult);

        $item[$info['id']]['username'] = $userinfo['username'];


        if(check_user_upgrades($mysqli,$info['user_id']))
        {
            $sub_info = get_user_membership_detail($mysqli,$info['user_id']);
            $item[$info['id']]['sub_title'] = $sub_info['sub_title'];
            $item[$info['id']]['sub_image'] = $sub_info['sub_image'];
        }else{
            $item[$info['id']]['sub_title'] = '';
            $item[$info['id']]['sub_image'] = '';
        }

        $item[$info['id']]['highlight_bg'] = ($info['highlight'] == 1)? "highlight-premium-ad" : "";

        $author_url = create_slug($userinfo['username']);

        $item[$info['id']]['author_link'] = $config['site_url'].'profile/'.$author_url;

        $pro_url = create_slug($info['product_name']);

        $item[$info['id']]['link'] = $config['site_url'].'ad/' . $info['id'] . '/'.$pro_url;

        $item[$info['id']]['catlink'] = $config['site_url'].'category/'.$get_main['slug'];

        $item[$info['id']]['subcatlink'] = $config['site_url'].'category/'.$get_main['slug'].'/'.$get_sub['slug'];

        $city = create_slug($item[$info['id']]['city']);
        $item[$info['id']]['citylink'] = $config['site_url'].'city/'.$info['city'].'/'.$city;

    }
}else{
    //echo "0 results";
}

//Again make loop for grid view
$item2 = array();
$item2 = $item;


$selected = "";
if(isset($_GET['cat']) && !empty($_GET['cat'])){
    $selected = $_GET['cat'];
}
// Check Settings For quotes
$GetCategory = get_maincategory($config,$selected);
$cat_dropdown = get_categories_dropdown($config,$lang);

$maincatname = get_maincat_by_id($config,$category);
$maincatname = $maincatname['cat_name'];
$mainCategory = isset($category) ? $maincatname : "";
$subcatname = get_subcat_by_id($config,$subcat);
$subcatname = $subcatname['sub_cat_name'];
$subCategory = isset($subcat) ? $subcatname : "";

if(isset($category) && !empty($category)){
    $Pagetitle = $mainCategory;
}
elseif(isset($subcat) && !empty($subcat)){
    $Pagetitle = $subCategory;
}
elseif(!empty($keywords)){
    $Pagetitle = ucfirst($keywords);
}
else{
    $Pagetitle = $lang['ADS-LISTINGS'];
}

if(!empty($_GET['location'])){
    $locTitle        =   explode(',' ,$_GET['location']);
    $locTitle     =   $locTitle[0];
    $Pagetitle .= " ".$locTitle;
}
else{
    $sortname = check_user_country($config);
    $countryName = get_countryName_by_sortname($config,$sortname);
    $Pagetitle .= " ".$countryName;
}

if(isset($_GET['city']) && !empty($_GET['city']))
{
    $cityName = get_cityName_by_id($config,$_GET['city']);
    $Pagetitle = $lang['ADS-LISTINGS']." ".$lang['IN']." ".$cityName;
}

/*Testing location*/
$location_list = array();
if(isset($_GET['placeid']) && !empty($_GET['placeid'])){
    
    $query= "SELECT ad_cities.name,ad_cities.id FROM ad_subadmin1 INNER JOIN ad_cities ON ad_subadmin1.code = ad_cities.subadmin1_code WHERE ad_subadmin1.code = '".$_GET['placeid']."'";
    $result = $mysqli->query($query);
    while($row = mysqli_fetch_assoc($result)) {
       $location_list[] = $row;
    }
    
    $locationvisible = "1";
}else{
    $locationvisible = "0";
}




// $html = "";
// $current_url = $_SERVER[REQUEST_URI];

// $query = "SELECT * FROM ad_catagory_main ORDER BY cat_order";

// $result = $mysqli->query($query);
// if (mysqli_num_rows($result) > 0) {
//     $html .=  "<div class=\"sidebar\">";
//     while($catagory_main = mysqli_fetch_assoc($result)) {
//         $cat_id =  $catagory_main["cat_id"];
//         $icon  =  $catagory_main["icon"];
//          $totalAdsMaincat = get_items_count($config,false,"active",false,null,$catagory_main['cat_id'],true);
//          $html .= "<ul class=\"cat_list\"><i class=\"$icon\"></i> <a data-toggle=\"collapse\" data-target=\"#$cat_id"."_list\" aria-expanded=\"true\" href=\"#\"  id=\"togg\" data-url=\"$current_url\">" . $catagory_main['cat_name'] . "(".$totalAdsMaincat.")". " <i class=\"fa fa-angle-right\"></i></a>";
//          $query2 = "SELECT * FROM ad_catagory_sub WHERE main_cat_id = '".$cat_id."' ORDER BY  cat_order";  
//          $subcat_result = $mysqli->query($query2);
//          $html .= "<ul id=\"$cat_id"."_list\" class=\"collapse\" aria-expanded=\"true\">";  
//          while ($cat = mysqli_fetch_assoc($subcat_result)) {
//             $totalads = get_items_count($config,false,"active",false,$cat['sub_cat_id'],null,true); 
//             $html .= "<li><a href=\"https://www.siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=".$cat['sub_cat_id']."&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=\">" . $cat['sub_cat_name'] ."(".$totalads.")". "</a></li>"; 
//          }
//          $html .= "</ul>"; 
//         $html .= "</ul>";  
//     }
//     $html .= "</div>";
// }else{
//     echo "0 results";
// }





if(strstr($_SERVER['REQUEST_URI'], "/category")){
    $slug = explode("/", $_SERVER['REQUEST_URI']);
    $html = "";
    $query = "SELECT * FROM ad_catagory_main WHERE slug='".$slug[2]."'";
    $result = $mysqli->query($query);
    $html .=  "<div class=\"sidebar\">";
    while($catagory_main = mysqli_fetch_array($result)){
        $totalAdsMaincat = get_items_count($config,false,"active",false,null,$catagory_main['cat_id'],true);
        $icon  =  $catagory_main["icon"];
        $html .= "<ul class=\"cat_list\">";
        $activeClass = ($slug[2] == $catagory_main['slug'])? "active-cat" : "";
        $html .= "<a href=\"https://www.siyaluma.lk/listing\"><i class=\"fa fa-arrow-left\"></i> &nbsp All Categories</a><br>";
        $html .= "<i class=\"$icon\"></i> &nbsp<a class=\"$activeClass\"  href=\"https://www.siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=".$catagory_main['cat_id']."&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=\"  id=\"togg\">" . $catagory_main['cat_name'] . "(".$totalAdsMaincat.")". " <i class=\"fa fa-angle-right\"></i></a>";
        $html .= "</ul>";          
        $query2 = "SELECT * FROM ad_catagory_sub WHERE main_cat_id = '".$catagory_main['cat_id']."' ORDER BY  cat_order";  
        $subcat_result = $mysqli->query($query2);
        $html .= "<ul id=\"$cat_id"."_list\" class=\"collapsed in\" aria-expanded=\"true\">";  
        while ($cat = mysqli_fetch_assoc($subcat_result)) {
               $totalads = get_items_count($config,false,"active",false,$cat['sub_cat_id'],null,true); 
               $html .= "<li><a href=\"https://www.siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=".$cat['sub_cat_id']."&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=\">" . $cat['sub_cat_name'] ."(".$totalads.")". "</a></li>"; 
        }
        $html .= "</ul>"; 
        $html .= "</ul>"; 
    }
      $html .= "</div>";
   
}else if(isset($_GET["cat"]) && !empty($_GET["cat"])){
    $html = "";
    $cat_id = $_GET["cat"];
    $query = "SELECT * FROM ad_catagory_main WHERE cat_id='".$cat_id."'";
    $result = $mysqli->query($query);
    $html .=  "<div class=\"sidebar\">";
    while($catagory_main = mysqli_fetch_array($result)){
        $totalAdsMaincat = get_items_count($config,false,"active",false,null,$catagory_main['cat_id'],true);
        $icon  =  $catagory_main["icon"];
        $html .= "<ul class=\"cat_list\">";
        $activeClass = ($cat_id == $catagory_main['cat_id'])? "active-cat" : "";
        $html .= "<a href=\"https://www.siyaluma.lk/listing\"><i class=\"fa fa-arrow-left\"></i> &nbsp All Categories</a><br>";
        $html .= "<i class=\"$icon\"></i> &nbsp<a class=\"$activeClass\"  href=\"https://www.siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=".$catagory_main['cat_id']."&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=\"  id=\"togg\">" . $catagory_main['cat_name'] . "(".$totalAdsMaincat.")". " <i class=\"fa fa-angle-right\"></i></a>";
        $html .= "</ul>";          
        $query2 = "SELECT * FROM ad_catagory_sub WHERE main_cat_id = '".$cat_id."' ORDER BY  cat_order";  
        $subcat_result = $mysqli->query($query2);
        $html .= "<ul id=\"$cat_id"."_list\" class=\"collapsed in\" aria-expanded=\"true\">";  
        while ($cat = mysqli_fetch_assoc($subcat_result)) {
               $totalads = get_items_count($config,false,"active",false,$cat['sub_cat_id'],null,true); 
               $html .= "<li><a href=\"https://www.siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=".$cat['sub_cat_id']."&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=\">" . $cat['sub_cat_name'] ."(".$totalads.")". "</a></li>"; 
        }
        $html .= "</ul>"; 
        $html .= "</ul>"; 
    }
    $html .= "</div>";
}else if(isset($_GET["subcat"]) && !empty($_GET["subcat"])){
    $html = "";
    $sub_cat_id = $_GET["subcat"];
    $query = "SELECT * FROM ad_catagory_sub WHERE  sub_cat_id='".$sub_cat_id."'";
    $result = $mysqli->query($query);
     while($ad_catagory_sub = mysqli_fetch_array($result)){
          $cat_id = $ad_catagory_sub["main_cat_id"];
          $query2 = "SELECT * FROM ad_catagory_main WHERE cat_id='".$ad_catagory_sub["main_cat_id"]."'";
          $result2 = $mysqli->query($query2);
          $html .=  "<div class=\"sidebar\">";
          while($catagory_main = mysqli_fetch_array($result2)){
                $totalAdsMaincat = get_items_count($config,false,"active",false,null,$catagory_main['cat_id'],true);
                $icon  =  $catagory_main["icon"];
                $html .= "<ul class=\"cat_list\">";
                $html .= "<a href=\"https://www.siyaluma.lk/listing\"><i class=\"fa fa-arrow-left\"></i> &nbsp All Categories</a><br>";
                $html .= "<i class=\"$icon\"></i> &nbsp<a  href=\"https://www.siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=".$catagory_main['cat_id']."&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=\"  id=\"togg\">" . $catagory_main['cat_name'] . "(".$totalAdsMaincat.")". " <i class=\"fa fa-angle-right\"></i></a>";
                $html .= "</ul>";   
                $query3 = "SELECT * FROM ad_catagory_sub WHERE main_cat_id = '".$cat_id."' ORDER BY  cat_order";  
                $subcat_result = $mysqli->query($query3);
                $html .= "<ul id=\"$cat_id"."_list\" class=\"collapsed in\" aria-expanded=\"true\">";  
                while ($cat = mysqli_fetch_assoc($subcat_result)) {
                       $totalads = get_items_count($config,false,"active",false,$cat['sub_cat_id'],null,true); 
                       $activeClass = ($sub_cat_id == $cat['sub_cat_id'])? "active-cat" : "";
                       $html .= "<li><a  class=\"$activeClass\" href=\"https://www.siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=".$cat['sub_cat_id']."&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=\">" . $cat['sub_cat_name'] ."(".$totalads.")". "</a></li>"; 
                }
                $html .= "</ul>"; 
                $html .= "</ul>"; 
          }
           $html .= "</div>";
     }
    
}else{
        $html = "";
        $query = "SELECT * FROM ad_catagory_main ORDER BY cat_order";
        $result = $mysqli->query($query);
        if (mysqli_num_rows($result) > 0) {
            $html .=  "<div class=\"sidebar\">";
            while($catagory_main = mysqli_fetch_assoc($result)) {
                $cat_id =  $catagory_main["cat_id"];
                $icon  =  $catagory_main["icon"];
                 $totalAdsMaincat = get_items_count($config,false,"active",false,null,$catagory_main['cat_id'],true);
                 $html .= "<ul class=\"cat_list\"><i class=\"$icon\"></i> &nbsp";
                 $html .= "<a  href=\"https://www.siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=".$catagory_main['cat_id']."&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=\"  id=\"togg\">" . $catagory_main['cat_name'] . "(".$totalAdsMaincat.")". " <i class=\"fa fa-angle-right\"></i></a>";
                 $html .= "</ul>";  
            }
            $html .= "</div>";
        }        

}



/*End of testing*/

// Output to template
$page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/ad-listing.tpl');
$page->SetParameter ('OVERALL_HEADER', create_header($Pagetitle));
$page->SetParameter ('PAGETITLE', $Pagetitle);
$page->SetLoop ('ITEM', $item);
$page->SetLoop ('ITEM2', $item2);
$page->SetLoop ('CATEGORY',$GetCategory);
$page->SetLoop ('SUBLOCATION', $location_list);
$page->SetParameter ('LOCATION_VISIBILITY', $locationvisible);
$page->SetParameter ('CATEGORY_SIDE', $html);
$page->SetParameter ('CAT_DROPDOWN',$cat_dropdown);
$page->SetParameter ('SERKEY', $keywords);
$page->SetParameter ('MAINCAT', $category);
$page->SetParameter ('SUBCAT', $subcat);
$page->SetParameter ('MAINCATEGORY', $mainCategory);
$page->SetParameter ('SUBCATEGORY', $subCategory);
$page->SetParameter ('BUDGET', $budget);
$page->SetParameter ('KEYWORDS', $keywords);
$page->SetParameter ('RANGE1', $range1);
$page->SetParameter ('RANGE2', $range2);
$page->SetParameter ('ADSFOUND', $total);
$page->SetParameter ('TOTALADSFOUND', $totalWithoutFilter);
$page->SetParameter ('FEATUREDFOUND', $featuredAds);
$page->SetParameter ('URGENTFOUND', $urgentAds);
$page->SetParameter ('LIMIT', $limit);
$page->SetParameter ('FILTER', $filter);
$page->SetParameter ('SORT', $sorting);
$page->SetParameter ('ORDER', $order);
if(isset($_SESSION['user']['id']))
{
    $page->SetParameter('USER_ID',$_SESSION['user']['id']);
    $page->SetParameter('LOGGED_IN', 1);
}
else
{
    $page->SetParameter('USER_ID','');
    $page->SetParameter('LOGGED_IN', 0);
}

if(isset($category) && !empty($category)) {
    $SubCatList = get_subcat_of_maincat($config, $category, true);
    $page->SetLoop ('SUBCATLIST',$SubCatList);
}else{
    $page->SetLoop ('SUBCATLIST',"");
}

$Pagelink = "";
if(count($_GET) >= 1){
    $get = http_build_query($_GET);
    $Pagelink .= "?".$get;

    $page->SetLoop ('PAGES', pagenav($total,$page_number,$limit,$link['LISTING'].$Pagelink,1));
    //$page->SetLoop ('PAGES', pagenav($total,$page_number,$limit));
}else{
    $page->SetLoop ('PAGES', pagenav($total,$page_number,$limit,$link['LISTING']));
    //$page->SetLoop ('PAGES', pagenav($total,$page_number,$limit));
}
$page->SetLoop ('CUSTOMFIELDS',$custom_fields);
$page->SetParameter ('SHOWCUSTOMFIELD', (count($custom_fields) > 0) ? 1 : 0);
$page->SetParameter ('CATEGORY', "Ads Listing");
$page->SetParameter ('OVERALL_FOOTER', create_footer());
$page->CreatePageEcho();
?>