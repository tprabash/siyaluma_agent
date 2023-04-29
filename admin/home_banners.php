<?php
require_once('../includes/config.php');
require_once('../includes/functions/func.admin.php');
require_once('../includes/functions/func.sqlquery.php');
require_once('../includes/lang/lang_'.$config['lang'].'.php');
$mysqli = db_connect($config);
admin_session_start();
checkloggedadmin($config);

include("header.php");
if(isset($_POST['file_upload'])){
    $target_dir = "../storage/home_banners";
    $upload=true;
    if(isset($_FILES['file_1'])){
        $target_file = $target_dir . basename($_FILES["file_1"]["name"]);
        $check = getimagesize($_FILES["file_1"]["tmp_name"]);
          if($check !== false) {
              $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
              $new_file=md5($target_file.time()).'.'.$imageFileType;
              $target_file=$target_dir.'/'.$new_file; 
                if($imageFileType == "jpg" || $imageFileType == "png" || $imageFileType == "jpeg" || $imageFileType == "gif" ) {
                    if (move_uploaded_file($_FILES["file_1"]["tmp_name"], $target_file)) {
                        $query_f1 = "SELECT * FROM `".$config['db']['pre']."homebanners` WHERE kambo='1' ORDER by date ASC";
                        $result_f1 = $mysqli->query($query_f1);
                        while ($row = mysqli_fetch_assoc($result_f1)) {
                            $query = "DELETE FROM  `".$config['db']['pre']."homebanners` WHERE id='".$row['id']."'";
                            $result = $mysqli->query($query);
                            @unlink($row['path']);
                        }
                        $link=isset($_POST['link_1']) ? $_POST['link_1'] : '';
                        $query = "INSERT INTO `".$config['db']['pre']."homebanners` (`url`,`path`,`kambo`,`date`) VALUES('".$_POST['link_1']."','".$target_file."','1','".time()."')";
                        $result = $mysqli->query($query);
                    }
                }
          }
    }
    if(isset($_FILES['file_2'])){
        $target_file = $target_dir . basename($_FILES["file_2"]["name"]);
        $check = getimagesize($_FILES["file_2"]["tmp_name"]);
          if($check !== false) {
              $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
              $new_file=md5($target_file.time()).'.'.$imageFileType;
              $target_file=$target_dir.'/'.$new_file;
                if($imageFileType == "jpg" || $imageFileType == "png" || $imageFileType == "jpeg" || $imageFileType == "gif" ) {
                    if (move_uploaded_file($_FILES["file_2"]["tmp_name"], $target_file)) {
                        $query_f1 = "SELECT * FROM `".$config['db']['pre']."homebanners` WHERE kambo='2' ORDER by date ASC";
                        $result_f1 = $mysqli->query($query_f1);
                        while ($row = mysqli_fetch_assoc($result_f1)) {
                            $query = "DELETE FROM  `".$config['db']['pre']."homebanners` WHERE id='".$row['id']."'";
                            $result = $mysqli->query($query);
                            @unlink($row['path']);
                        }
                        $link=isset($_POST['link_2']) ? $_POST['link_2'] : '';
                        $query = "INSERT INTO `".$config['db']['pre']."homebanners` (`url`,`path`,`kambo`,`date`) VALUES('".$link."','".$target_file."','2','".time()."')";
                        $result = $mysqli->query($query);
                    }
                }
          }
    }
    if(isset($_FILES['file_3'])){
        $target_file = $target_dir . basename($_FILES["file_3"]["name"]);
        $check = getimagesize($_FILES["file_3"]["tmp_name"]);
          if($check !== false) {
              $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
              $new_file=md5($target_file.time()).'.'.$imageFileType;
              $target_file=$target_dir.'/'.$new_file;
                if($imageFileType == "jpg" || $imageFileType == "png" || $imageFileType == "jpeg" || $imageFileType == "gif" ) {
                    if (move_uploaded_file($_FILES["file_3"]["tmp_name"], $target_file)) {
                        $query_f1 = "SELECT * FROM `".$config['db']['pre']."homebanners` WHERE kambo='3' ORDER by date ASC";
                        $result_f1 = $mysqli->query($query_f1);
                        while ($row = mysqli_fetch_assoc($result_f1)) {
                            $query = "DELETE FROM  `".$config['db']['pre']."homebanners` WHERE id='".$row['id']."'";
                            $result = $mysqli->query($query);
                            @unlink($row['path']);
                        }
                        $link=isset($_POST['link_3']) ? $_POST['link_3'] : '';
                        $query = "INSERT INTO `".$config['db']['pre']."homebanners` (`url`,`path`,`kambo`,`date`) VALUES('".$link."','".$target_file."','3','".time()."')";
                        $result = $mysqli->query($query);
                    }
                }
          }
    }
    if(isset($_FILES['file_4'])){
        $target_file = $target_dir . basename($_FILES["file_4"]["name"]);
        $check = getimagesize($_FILES["file_4"]["tmp_name"]);
          if($check !== false) {
              $imageFileType = strtolower(pathinfo($target_file,PATHINFO_EXTENSION));
              $new_file=md5($target_file.time()).'.'.$imageFileType;
              $target_file=$target_dir.'/'.$new_file;
                if($imageFileType == "jpg" || $imageFileType == "png" || $imageFileType == "jpeg" || $imageFileType == "gif" ) {
                    if (move_uploaded_file($_FILES["file_4"]["tmp_name"], $target_file)) {
                        $query_f1 = "SELECT * FROM `".$config['db']['pre']."homebanners` WHERE kambo='4' ORDER by date ASC";
                        $result_f1 = $mysqli->query($query_f1);
                        while ($row = mysqli_fetch_assoc($result_f1)) {
                            $query = "DELETE FROM  `".$config['db']['pre']."homebanners` WHERE id='".$row['id']."'";
                            $result = $mysqli->query($query);
                            @unlink($row['path']);
                        }
                        $link=isset($_POST['link_4']) ? $_POST['link_4'] : '';
                        $query = "INSERT INTO `".$config['db']['pre']."homebanners` (`url`,`path`,`kambo`,`date`) VALUES('".$link."','".$target_file."','4','".time()."')";
                        $result = $mysqli->query($query);
                    }
                }
          }
    }
}
$query = "SELECT * FROM `".$config['db']['pre']."homebanners` ORDER by date ASC";
$result = $mysqli->query($query);
$banner_1='';
$banner_link1='';
$banner_link2='';
$banner_link3='';
$banner_link4='';
$banner_2='';
$banner_3='';
$banner_4='';
while ($row = mysqli_fetch_assoc($result)) {
    if($row['kambo'] == 1){
        $banner_1=$row['path'];
        $banner_link1=$row['url'];
    }elseif($row['kambo'] == 2){
        $banner_2=$row['path'];
        $banner_link2=$row['url'];
    }elseif($row['kambo'] == 3){
        $banner_3=$row['path'];
        $banner_link3=$row['url'];
    }elseif($row['kambo'] == 4){
        $banner_4=$row['path'];
        $banner_link4=$row['url'];
    }
}
?>
<!-- Page JS Plugins CSS -->

<main class="app-layout-content">

    <!-- Page Content -->
    <div class="container-fluid p-y-md">
        <!-- Partial Table -->
        <div class="card">
            <div class="card-header">
                <h4>Home Page Banners</h4>
            </div>
            <div class="card-block">
                <form method="POST" enctype="multipart/form-data">
                    <input type="hidden" name="file_upload" value="1"/>
                    <div class="form-group">
                        <hr />
                        <label>Banner 1</label>
                        <input type="file" name="file_1"/>
                        <?php 
                            if(isset($banner_1) && $banner_1 !=''){
                                echo '<hr /><img src="'.$banner_1.'" style="width:100px;max-height:200px"/>';
                            }
                            
                        ?>
                        <input type="text" style="margin-top:10px" placeholder="Banner Link" class="form-control" value="<?php if(isset($banner_link1)) echo $banner_link1;?>" name="link_1"/>
                    </div>
                    <div class="form-group">
                        <hr />
                        <label>Banner 2</label>
                        <input type="file" name="file_2"/>
                        <?php 
                            if(isset($banner_2) && $banner_2 !=''){
                                echo '<hr /><img src="'.$banner_2.'" style="width:100px;max-height:200px"/>';
                            }
                             
                        ?>
                         <input type="text" style="margin-top:10px" placeholder="Banner Link" class="form-control" value="<?php if(isset($banner_link2)) echo $banner_link2;?>" name="link_2"/>
                    </div>
                    <div class="form-group">
                        <hr />
                        <label>Banner 3</label>
                        <input type="file" name="file_3"/>
                        <?php 
                            if(isset($banner_3) && $banner_3 !=''){
                                echo '<hr /><img src="'.$banner_3.'" style="width:100px;max-height:200px"/>';
                                echo '<p><a href="'.$banner_link3.'">'.$banner_link3.'</a></p>';
                            }
                            
                        ?>
                         <input type="text" style="margin-top:10px" placeholder="Banner Link" class="form-control" value="<?php if(isset($banner_link3)) echo $banner_link3;?>" name="link_3"/>
                    </div>
                    <div class="form-group">
                        <hr />
                        <label>Banner 4</label>
                        <input type="file" name="file_4"/>
                        <?php 
                            if(isset($banner_4) && $banner_4 !=''){
                                echo '<hr /><img src="'.$banner_4.'" style="width:100px;max-height:200px"/>';
                                echo '<p><a href="'.$banner_link4.'">'.$banner_link4.'</a></p>';
                            }
                             
                        ?>
                         <input type="text" style="margin-top:10px" placeholder="Banner Link" class="form-control" value="<?php if(isset($banner_link4)) echo $banner_link4;?>" name="link_4"/>
                    </div>
                    <hr />
                    <button type="submit" class="btn btn-success">Update</button>
                </form>
            </div>
        </div>
    </div>
</main>
<?php include("footer.php"); ?>
</body>

</html>
