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


$page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/deals.tpl');
$page->SetParameter ('OVERALL_HEADER', create_header($lang['MY-ADS']));

$page->SetParameter('COPYRIGHT_TEXT', get_option($config,"copyright_text"));
$page->SetParameter ('OVERALL_FOOTER', create_footer());
$page->CreatePageEcho();

?>