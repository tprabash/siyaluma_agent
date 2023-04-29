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


if(isset($_GET['token'])){
    $access_token = $_GET['token'];
    
    $ad_id      = $_SESSION['quickad'][$access_token]['ad_id'];
    $amount     = $_SESSION['quickad'][$access_token]['amount'];
    $items      = $_SESSION['quickad'][$access_token]['items'];
    $package    = $_SESSION['quickad'][$access_token]['package'];
        
        
    $userdata = get_user_data($config,$_SESSION['user']['username']);
    $email    = $userdata['email'];
    $name     = $userdata['name'];
    $phone    = $userdata['phone'];
    $address  = $userdata['address'];
        
    $page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/payment_option.tpl');
    $page->SetParameter ('OVERALL_HEADER', create_header($lang['UPGRADES']));
    $page->SetParameter ('ORDER_TITLE', $items);
    $page->SetParameter ('AMOUNT', $amount);
    $page->SetParameter ('EMAIL', $email);
    $page->SetParameter ('NAME', $name);
    $page->SetParameter ('PHONE', $phone);
    $page->SetParameter ('ADDRESS', $address);
    $page->SetParameter ('PACKAGE', $package);
    $page->SetParameter ('TOKEN', $access_token);
    $page->SetParameter ('ORDER_ID', $ad_id);
    $page->SetParameter ('OVERALL_FOOTER', create_footer());
    $page->CreatePageEcho();
}else{
    error($lang['INVALID-PAYMENT_PROCESS'], __LINE__, __FILE__, 1);
    exit();
}



?>
