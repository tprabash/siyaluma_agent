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

$sql5 = "INSERT INTO ad_payment SET 
product_id = '77',
package  = 'siripala',
amount   = '200',
user_id   = '3'
";
mysqli_query($con, $sql5) OR error(mysqli_error($con));

$merchant_id          = $_POST['merchant_id'];
$order_id             = $_POST['order_id'];
$payhere_amount       = $_POST['payhere_amount'];
$payhere_currency     = $_POST['payhere_currency'];
$status_code          = $_POST['status_code'];
$md5sig               = $_POST['md5sig'];
$access_token         = $_POST['custom_1'];

$merchant_secret = '4OXGXRYRJqc4ZDt8I6l0T54eU2YGq3LTq4p72LT1eRgl'; 

$local_md5sig = strtoupper (md5 ( $merchant_id . $order_id . $payhere_amount . $payhere_currency . $status_code . strtoupper(md5($merchant_secret)) ) );

if (($local_md5sig === $md5sig) AND ($status_code == 2) ){
         $query = "UPDATE ad_payment SET status = '1'  WHERE product_id = ".$_POST['order_id'];
         
         mysqli_query($con, $query) OR error(mysqli_error($con));
}else{
    
    error($lang['INVALID-PAYMENT_PROCESS'], __LINE__, __FILE__, 1);
    exit();
}


?>
