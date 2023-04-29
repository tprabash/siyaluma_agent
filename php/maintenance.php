<?php
require_once('includes/config.php');
require_once('includes/classes/class.template_engine.php');
require_once('includes/classes/class.country.php');
require_once('includes/functions/func.global.php');
require_once('includes/functions/func.users.php');
require_once('includes/functions/func.sqlquery.php');
require_once('includes/lang/lang_'.$config['lang'].'.php');
require_once('includes/seo-url.php');



$Pagetitle = "Maintenance";

$page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/maintenance.tpl');
$page->SetParameter ('OVERALL_HEADER', create_header($Pagetitle));
$page->SetParameter ('PAGETITLE', $Pagetitle);
$page->SetParameter ('OVERALL_FOOTER', create_footer());
$page->CreatePageEcho();
?>