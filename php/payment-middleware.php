<?php
require_once('includes/config.php');
require_once('includes/classes/class.template_engine.php');
require_once('includes/classes/class.country.php');
require_once('includes/functions/func.global.php');
require_once('includes/functions/func.users.php');
require_once('includes/functions/func.sqlquery.php');
require_once('includes/lang/lang_'.$config['lang'].'.php');
require_once("includes/lib/curl/curl.php");
require_once("includes/lib/curl/CurlResponse.php");
require_once('includes/seo-url.php');
$mysqli = db_connect($config);
sec_session_start();

if(!checkloggedin($config)){
    error($lang['PAGE-NOT-FOUND'], __LINE__, __FILE__, 1);
    exit();
}

if(isset($_GET['order_id'])){
    $product_id = $_GET['order_id'];
    
    $link = "ad/".$product_id;
        
    $query = "SELECT status  FROM `ad_payment` WHERE status = '1' AND product_id=".$product_id;
    $result = $mysqli->query($query);
    if(mysqli_num_rows($result) > 0){
        unset($_SESSION['quickad']);
        $page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/payment_success.tpl');
        $page->SetParameter ('OVERALL_HEADER', create_header($lang['UPGRADES']));
        $page->SetParameter ('LINK', $link);
        $page->SetParameter ('OVERALL_FOOTER', create_footer());
        $page->CreatePageEcho();
    }else{
        
        $sql2 = "SELECT screen_shot FROM `".$config['db']['pre']."product` WHERE `id` = '" . $product_id . "' AND `user_id` = '" . $_SESSION['user']['id'] . "' LIMIT 1";

        if ($result = $mysqli->query($sql2)) {
            $row = mysqli_fetch_assoc($result);

            $uploaddir =  "storage/products/";
            $screen_sm = explode(',',$row['screen_shot']);
            foreach ($screen_sm as $value){
                $value = trim($value);
                //Delete Image From Storage ----
                $filename1 = $uploaddir.$value;
                if(file_exists($filename1)){
                    $filename1 = $uploaddir.$value;
                    $filename2 = $uploaddir."small_".$value;
                    unlink($filename1);
                    unlink($filename2);
                }
            }

            $sql = "DELETE FROM `".$config['db']['pre']."product` WHERE `id` = '" . $product_id . "' AND `user_id` = '" . $_SESSION['user']['id'] . "' LIMIT 1";
            mysqli_query($mysqli,$sql);
            
            $sq3 = "DELETE FROM `ad_payment` WHERE `product_id`=".$product_id;
            mysqli_query($mysqli,$sql3);
            unset($_SESSION['quickad']);
            $page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/payment_canceled.tpl');
            $page->SetParameter ('OVERALL_HEADER', create_header($lang['UPGRADES']));
            $page->SetParameter ('OVERALL_FOOTER', create_footer());
            $page->CreatePageEcho();  
        }else{
            $page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/payment_canceled.tpl');
            $page->SetParameter ('OVERALL_HEADER', create_header($lang['UPGRADES']));
            $page->SetParameter ('OVERALL_FOOTER', create_footer());
            $page->CreatePageEcho();  
        }
        
    }    

}else{
    error($lang['INVALID-PAYMENT_PROCESS'], __LINE__, __FILE__, 1);
    exit();
}



?>
