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
    $_GET['page'] = 1;

$limit = 6;

if(checkloggedin($config)) {
    $ses_userdata = get_user_data($config,$_SESSION['user']['username']);
    $author_image = $ses_userdata['image'];

    $items = get_items($config,$_SESSION['user']['id'],"pending",false,$_GET['page'],$limit);
    $total_item = get_items_count($config,$_SESSION['user']['id'],"pending");
    $pagging = pagenav($total_item,$_GET['page'],$limit,$link['PENDINGADS']);

    // Output to template
    $page = new HtmlTemplate ('templates/' . $config['tpl_name'] . '/ad-pending-approval.tpl');
    $page->SetParameter ('RESUBMITADS', resubmited_ads_count($config,$_SESSION['user']['id']));
    $page->SetParameter ('HIDDENADS', hidden_ads_count($config,$_SESSION['user']['id']));
    $page->SetParameter ('OVERALL_HEADER', create_header($lang['PENDING-ADS']));
    $page->SetParameter ('PENDINGADS', pending_ads_count($config,$_SESSION['user']['id']));
    $page->SetParameter ('FAVORITEADS', favorite_ads_count($config,$_SESSION['user']['id']));
    $page->SetParameter ('MYADS', myads_count($config,$_SESSION['user']['id']));
    $page->SetLoop ('ITEM', $items);
    $page->SetLoop ('PAGES', $pagging);
    $page->SetParameter ('TOTALITEM', $total_item);
    $page->SetParameter ('AUTHORUNAME', ucfirst($ses_userdata['username']));
    $page->SetParameter ('AUTHORNAME', ucfirst($ses_userdata['name']));
    $page->SetParameter ('AUTHORIMG', $author_image);
    $page->SetLoop ('HTMLPAGE', get_html_pages($config));
    $page->SetParameter('COPYRIGHT_TEXT', get_option($config,"copyright_text"));
    $page->SetParameter ('OVERALL_FOOTER', create_footer());
    $page->CreatePageEcho();
}
else{
    error($lang['PAGE-NOT-FOUND'], __LINE__, __FILE__, 1);
    exit();
}
?>