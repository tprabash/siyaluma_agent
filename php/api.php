<?php
require_once('../includes/config.php');
require_once('../includes/classes/class.country.php');
require_once('../includes/functions/func.global.php');
require_once('../includes/functions/func.users.php');
require_once('../includes/functions/func.sqlquery.php');
$mysqli = db_connect($config);
if(isset($_POST['id'])){
      
      $product_id = $_POST['id'];
      
      $category_id = $_POST['category_id'];
       
      $ret_val = array();
      
      $sql = "SELECT ad_product.product_name, ad_product.ad_network_link,  ad_catagory_main.cat_name, ad_catagory_sub.sub_cat_name FROM ad_product
      LEFT JOIN ad_catagory_main ON ad_catagory_main.cat_id = ad_product.category  
      LEFT JOIN ad_catagory_sub  ON ad_catagory_sub.sub_cat_id = ad_product.sub_category
      WHERE  ad_product.id = '" . $product_id . "' LIMIT 1";
      
      $result = $mysqli->query($sql);
       if (mysqli_num_rows($result) > 0) {
           while ($row = mysqli_fetch_array($result)){
                $ret_val[] = $row;
           }
               
               
       }
       
       if(isset($category_id)){
       
           $sql_query = "SELECT * FROM `ad_promote` WHERE category_id=".$category_id;
             
           $query_result =  $mysqli->query($sql_query);
           
           $category_row = mysqli_fetch_array($query_result);
           
           $form_field_data = json_decode($category_row['data']);  
       }else{
           $form_field_data = "";
       }
       

       
      header('Access-Control-Allow-Origin: *');
      header('Access-Control-Allow-Methods: GET, POST, OPTIONS, DELETE, PUT');
      header("Access-Control-Allow-Headers: X-Requested-With, Content-Type");
      header( "Content-type: application/json" );
       
      echo json_encode(array('data' => $ret_val, 'price' => $form_field_data));
}

if(isset($_POST['promote_ad'])){
    
     $is_valid = true;
     
    $product_id = $_POST['product_id'];
    
    $ad_title = $_POST['ad_title'];
    
    $ad_category = $_POST['category_main'];
    
    $payment_method = $_POST['payment_method'];
    
    $payment_date = $_POST['payment_date'];
    
    $payment_time = $_POST['payment_time'];
    
    $ref_number  = empty($_POST['refnumber']) ?  "NULL" : $_POST['refnumber'];
    
    $network_link = empty($_POST['network_link']) ? "NULL" : $_POST['network_link'];
    
    if($_POST['is_top_ad'] > 0){
      if(!isset($_POST['top_ad_days'])){
         $is_valid = false;
      }
    }
    
    if($_POST['is_bump_ad'] > 0){
      if(!isset($_POST['bump_ad_days'])){
         $is_valid = false;
      }
    }
    
    if($_POST['is_top_ad'] > 0){
      if(!isset($_POST['top_ad_days'])){
         $is_valid = false;
      }
    }
    
    if($_POST['is_urgent_ad'] > 0){
      if(!isset($_POST['urgent_ad_days'])){
         $is_valid = false;
      }
    }

    
    if($_POST['is_spotlight_ad'] > 0){
      if(!isset($_POST['spotlight_ad_days'])){
         $is_valid = false;
      }
    }
        
    
    if($is_valid){
         $is_top_ad = $_POST['is_top_ad'];
    
         $top_ad_days = $_POST['top_ad_days'];
    
         $is_bump_ad = $_POST['is_bump_ad'];
   
         $bump_ad_days = $_POST['bump_ad_days'];

         $is_urgent_ad = $_POST['is_urgent_ad'];
   
         $urgent_ad_days = $_POST['urgent_ad_days'];

         $is_spotlight_ad = $_POST['is_spotlight_ad'];
   
         $spotlight_ad_days = $_POST['spotlight_ad_days'];         
         
         $query = "INSERT INTO " . $config['db']['pre'] . "highlight SET
                    product_id = '".$product_id."',
                    ad_title = '".validate_input($ad_title)."',
                    ad_category  = '".validate_input($ad_category)."',
                    is_top_ad = '".$is_top_ad."',
                    top_ad_days = '".$top_ad_days."',
                    is_bump_ad  = '".$is_bump_ad ."',
                    bump_ad_days  = '".$bump_ad_days ."',
                    is_urgent_ad   = '".$is_urgent_ad ."',
                    urgent_ad_days  = '".$urgent_ad_days ."',
                    is_spotlight_ad   = '".$is_spotlight_ad."',
                    spotlight_ad_days  = '".$spotlight_ad_days."',
                    payment_method = '".validate_input($payment_method)."',
                    payment_date = '". $payment_date."',
                    payment_time = '" . $payment_time . "',
                    ref_number = '" . $ref_number . "',
                    network_link = '" . $network_link . "'";
                    $mysqli->query($query) OR error(mysqli_error($mysqli));
                    
    		$response = array('message' => "success");
    		header('Access-Control-Allow-Origin: *');
            header('Access-Control-Allow-Methods: GET, POST, OPTIONS, DELETE, PUT');
            header("Access-Control-Allow-Headers: X-Requested-With, Content-Type");
    		header( "Content-type: application/json" );
            echo json_encode($response);        
    }else{
        $response = array('message' => "error");
        header('Access-Control-Allow-Origin: *');
        header('Access-Control-Allow-Methods: GET, POST, OPTIONS, DELETE, PUT');
        header("Access-Control-Allow-Headers: X-Requested-With, Content-Type");
		header( "Content-type: application/json" );
        echo json_encode($response); 
    }

                
}


if(isset($_POST['status'])){
    $is_valid = true;
    
    if(isset($_POST['status'])){
        $status = $_POST['status'];
    }else{
        $is_valid = false;
    }
    
    if(isset($_POST['action_id'])){
       $id = $_POST['action_id'];    
    }else{
       $is_valid = false;
    }
    
    if($is_valid == true){
    $query = "UPDATE " . $config['db']['pre'] . "highlight SET is_active = '" . $status . "', payment_time = NOW()
                     WHERE highlight_id = '".validate_input($id)."'";
                     
    $mysqli->query($query) OR error(mysqli_error($mysqli));
    
    $res = array("message" => "success");
    header('Access-Control-Allow-Origin: *');
    header('Access-Control-Allow-Methods: GET, POST, OPTIONS, DELETE, PUT');
    header("Access-Control-Allow-Headers: X-Requested-With, Content-Type");
	header("Content-type: application/json");
	
    echo json_encode($res);        
    
    }else{
        $res = array("message" => "error");
        header('Access-Control-Allow-Origin: *');
        header('Access-Control-Allow-Methods: GET, POST, OPTIONS, DELETE, PUT');
        header("Access-Control-Allow-Headers: X-Requested-With, Content-Type");
	    header("Content-type: application/json");
	
        echo json_encode($res);   
    }
    

}

if(isset($_POST['hiddenDelete'])){
    
   if($_POST['hiddenDelete'] === "3185"){
       exit('0'); 
    }
    
    $id = $_POST['hiddenDelete'];
    
    $sql2 = "SELECT screen_shot FROM `".$config['db']['pre']."product` WHERE `id` = '" . $id . "'  LIMIT 1";

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

            $sql = "DELETE FROM `".$config['db']['pre']."product` WHERE `id` = '" . $id . "' LIMIT 1";
            mysqli_query($mysqli,$sql);
            header('Access-Control-Allow-Origin: *');
            header('Access-Control-Allow-Methods: GET, POST, OPTIONS, DELETE, PUT');
            header("Access-Control-Allow-Headers: X-Requested-With, Content-Type");
            header("Content-type: application/json");
            $res = array("message" => "success");
            echo json_encode($res);               
            
        }

}


if(isset($_POST['post_reports'])){
    
     $ret_val = array();
     
     $sql = "SELECT id,created_at FROM ad_product WHERE MONTH(created_at) = MONTH(CURRENT_DATE()) AND YEAR(created_at) = YEAR(CURRENT_DATE())";
     
      $result = mysqli_query(db_connect($config), $sql);
       if (mysqli_num_rows($result) > 0) {
           while ($row = mysqli_fetch_array($result)){
                $ret_val[] = $row;
           }
               
               
       }
       header('Access-Control-Allow-Origin: *');
       header('Access-Control-Allow-Methods: GET, POST, OPTIONS, DELETE, PUT');
       header("Access-Control-Allow-Headers: X-Requested-With, Content-Type");
       header( "Content-type: application/json" );
       echo json_encode($ret_val);
}





