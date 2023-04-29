<?php
require_once('../includes/config.php');
require_once('../includes/functions/func.admin.php');
require_once('../includes/functions/func.sqlquery.php');
require_once('../includes/functions/func.users.php');
require_once('../includes/lang/lang_'.$config['lang'].'.php');
$mysqli = db_connect($config);
admin_session_start();
checkloggedadmin($config);


if(isset($_POST['action']) && $_POST['action'] !=''){
    if($_POST['action'] == 'add-promotion'){
        
        $category_id = (int)$_POST['category_id'];
         
        $form_field_data = json_encode($_POST['promote'], true);
         
        $sql_query = "SELECT * FROM `ad_promote` WHERE category_id=".$category_id;
         
        $query_result = $mysqli->query($sql_query);
        
        if($query_result->num_rows > 0){
             
            $sql_update_query = "UPDATE `ad_promote` SET data='$form_field_data' WHERE category_id=".$category_id;
            
            $mysqli->query($sql_update_query);
            
            header('Content-Type: application/json');
            
            echo json_encode(array('status' => '1'));
            
        }else{
             
            $sql_insert = "INSERT INTO `ad_promote` (category_id,data) VALUES('$category_id', '$form_field_data')"; 
            
            $mysqli->query($sql_insert);
            
            header('Content-Type: application/json');
            
            echo json_encode(array('status' => '1'));
        }
         
    }
}