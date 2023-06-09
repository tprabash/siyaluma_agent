<?php
require_once('../../includes/config.php');
require_once('../../includes/functions/func.admin.php');
require_once('../../includes/functions/func.sqlquery.php');

$mysqli = db_connect($config);
admin_session_start();
checkloggedadmin($config);

if(isset($_GET['code'])){
    $code = $_GET['code'];
    $pieces = explode(".", $code);
    $code_count = count($pieces);
    if($code_count == 3){
        $country = $pieces[0];
        $subadmin1 = $pieces[1];
        $subadmin2 = $pieces[2];
        $code = $country.".".$subadmin1;
    }


    $sql = "SELECT * FROM `".$config['db']['pre']."subadmin2` where code = '".$_GET['code']."' LIMIT 1";
    $info = mysqli_fetch_array(mysqli_query($mysqli,$sql));
}else{
    exit('Error: 404 Page not found');
}
?>
<header class="slidePanel-header overlay">
    <div class="overlay-panel overlay-background vertical-align">
        <div class="service-heading">
            <h2>Edit District - <?php echo $info['name'];?></h2>
        </div>
        <div class="slidePanel-actions">
            <div class="btn-group-flat">
                <button type="button" class="btn btn-floating btn-warning btn-sm waves-effect waves-float waves-light margin-right-10" id="post_sidePanel_data"><i class="icon ion-android-done" aria-hidden="true"></i></button>
                <button type="button" class="btn btn-pure btn-inverse slidePanel-close icon ion-android-close font-size-20" aria-hidden="true"></button>
            </div>
        </div>
    </div>
</header>
<div class="slidePanel-inner">
    <div class="panel-body">
        <!-- /.row -->
        <div class="row">
            <div class="col-sm-12">

                <div class="white-box">
                    <div id="post_error"></div>
                    <form name="form2"  class="form form-horizontal" method="post" data-ajax-action="editDistrict" id="sidePanel_form">
                        <div class="form-body">
                            <input type="hidden" name="code" value="<?php echo $_GET['code']?>">
                            <!-- text input -->
                            <div class="form-group">
                                <label class="col-sm-4 control-label">Local Name</label>
                                <div class="col-sm-6">
                                    <input type="text" name="name" value="<?php echo $info['name'];?>" placeholder="Local Name" class="form-control" required>
                                </div>
                            </div>

                            <!-- text input -->
                            <div class="form-group">
                                <label class="col-sm-4 control-label">Name</label>
                                <div class="col-sm-6">
                                    <input type="text" name="asciiname" value="<?php echo $info['asciiname'];?>" placeholder="Enter the name (In English)" class="form-control" required>
                                </div>
                            </div>

                            <!-- text input -->
                            <div class="form-group">
                                <label class="col-sm-4 control-label">Active</label>
                                <div class="col-sm-6">
                                    <div class="checkbox checkbox-success">
                                        <input type="hidden" name="active" value="0">
                                        <input type="checkbox" name="active" id="active" value="1" <?php echo ($info['active'] == 1)? "checked" : ""?>>
                                        <label for="active"></label>
                                    </div>
                                </div>

                            </div>
                            <input type="hidden" name="submit">

                        </div>

                    </form>
                </div>
            </div>
        </div>
        <!-- /.row -->
    </div>
</div>