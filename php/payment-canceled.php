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

$page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/payment_canceled.tpl');
$page->SetParameter ('OVERALL_HEADER', create_header($lang['UPGRADES']));
$page->SetParameter ('OVERALL_FOOTER', create_footer());
$page->CreatePageEcho();  




?>
