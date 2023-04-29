<?php
require_once('includes/config.php');
require_once('includes/functions/func.global.php');
if(isset($_POST['order_id'])){
    @$conn=new mysqli($config['db']['host'],$config['db']['user'],$config['db']['pass'],$config['db']['name']);
    if($conn){
        $merchant_id          = $_POST['merchant_id'];
        $order_id             = $_POST['order_id'];
        $payhere_amount       = $_POST['payhere_amount'];
        $payhere_currency     = $_POST['payhere_currency'];
        $status_code          = $_POST['status_code'];
        $md5sig               = $_POST['md5sig'];
        $access_token         = $_POST['custom_1'];
        $merchant_secret = '3600d44446ec4ba1107fda047ff7dabd'; 
        $local_md5sig = strtoupper (md5 ( $merchant_id . $order_id . $payhere_amount . $payhere_currency . $status_code . strtoupper(md5($merchant_secret)) ) );
        
        if (($local_md5sig === $md5sig) AND ($status_code == 2) ){
                $query = "UPDATE ad_payment SET status = '1'  WHERE product_id = ".validate_input($_POST['order_id']);
                $q=$conn->query($query);
                exit;
        }else{
         header("Location: /payment-canceled");
         die(); 
        }
    }
}else{
   header("Location: /payment-canceled");
   die(); 
}
