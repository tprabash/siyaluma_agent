<?php
require_once('../includes/config.php');
require_once('../includes/functions/func.admin.php');
require_once('../includes/functions/func.sqlquery.php');
require_once('../includes/functions/func.users.php');
require_once('../includes/lang/lang_'.$config['lang'].'.php');
$mysqli = db_connect($config);
admin_session_start();
checkloggedadmin($config);



 $query = "SELECT * FROM ".$config['db']['pre']."product WHERE id=22 LIMIT 1";
    
 $result = mysqli_query($mysqli, $query);
    
 if (mysqli_num_rows($result) > 0) {
     $info = mysqli_fetch_assoc($result);
     $item_id = $info['id'];
  }
  
$item_custom = array();
$item_custom_textarea = array();
$item_checkbox = array();
$query = "SELECT * FROM `".$config['db']['pre']."old_custom_data` where product_id = '".$item_id."'";
$query_result = mysqli_query($mysqli, $query);

while($customdata = mysqli_fetch_array($query_result)){
    $field_id = $customdata['field_id'];
    $field_type = $customdata['field_type'];
    $field_data = $customdata['field_data'];
    $custom_fields_title = get_customField_title_by_id($config,$field_id);
    
    if($field_type == 'checkboxes'){
      $checkbox_value = explode(',', $field_data);
      $checkbox_value2 = array();
        foreach ($checkbox_value as $val){
                $val = get_customOption_by_id(trim($val));
                $checkbox_value2[] = '<div class="col-md-4 col-sm-4"><div style="line-height: 30px;"><i class="fa fa-check"></i> '.$val.'</div></div>';
        }
        if($custom_fields_title != ""){
          $item_checkbox[$field_id]['title'] = $custom_fields_title;
          $item_checkbox[$field_id]['value'] = implode('  ', $checkbox_value2);
        }

        }elseif($field_type == 'textarea') {
            $item_custom_textarea[$field_id]['title'] = $custom_fields_title;
            $item_custom_textarea[$field_id]['value'] = stripslashes($field_data);
        }else{
            if($field_type == 'radio-buttons' or  $field_type == 'drop-down') {
                $custom_fields_data = get_customOption_by_id($field_data);
            }else{
                $custom_fields_data = stripslashes($field_data);
            }
        $item_custom[$field_id]['title'] = $custom_fields_title;
        $item_custom[$field_id]['value'] = $custom_fields_data;
        }
}

foreach($item_custom as $value)
{
    echo '<li>
                <div class="inner clearfix">
                    <span class="label">'.$value['title'].'</span>
                    <span class="desc">'.$value['value'].'</span>
                </div>
            </li>';
}




