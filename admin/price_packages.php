<?php
require_once('../includes/config.php');
require_once('../includes/functions/func.admin.php');
require_once('../includes/functions/func.sqlquery.php');
require_once('../includes/functions/func.users.php');
require_once('../includes/lang/lang_'.$config['lang'].'.php');
$mysqli = db_connect($config);
admin_session_start();
checkloggedadmin($config);
?>
<?php 
    if(isset($_POST['action'])){
        if($_POST['action'] == 'add-type'){
            if($_POST['typename'] == ''){
                exit(json_encode(['status'=>0,'msg'=>'Invalid name, please type name']));
            }
            if($_POST['color'] == ''){
                exit(json_encode(['status'=>0,'msg'=>'Invalid color, please type name']));
            }
            $sort=0;
            if($_POST['sort'] && $_POST['sort'] !=''){
                $sort=$_POST['sort'];
            }
            if(isset($_POST['update_id']) && $_POST['update_id'] !=''){
                $sql="UPDATE `".$config['db']['pre']."packages_types` SET name='".$_POST['typename']."',color='".$_POST['color']."',sort='".$sort."' WHERE id=".$_POST['update_id'];
            }else{
                $sql="INSERT INTO `".$config['db']['pre']."packages_types` (pid,name,color,sort) VALUES('".$_POST['pak_id']."',
                '".$_POST['typename']."',
                '".$_POST['color']."',
                '".$sort."'
                )";
            }
           
            if($mysqli->query($sql)){
                exit(json_encode(['status'=>1]));
            }else{
                exit(json_encode(['status'=>0,'msg'=>'Unable to insert data, please try again later']));
            }
        }elseif($_POST['action'] == 'add-package'){
            if($_POST['name'] == ''){
                exit(json_encode(['status'=>0,'msg'=>'Invalid name, please type name']));
            }
            if($_POST['description'] == ''){
                exit(json_encode(['status'=>0,'msg'=>'Invalid description, please description']));
            }
            $image='';
            if(!isset($_FILES['file']) && !isset($_POST['update_id'])){
                exit(json_encode(['status'=>0,'msg'=>'Invalid image, please select image']));
            }else{
                $filename = $_FILES['file']['name'];
                $location = "../storage/packages/".$filename;
                $imageFileType = pathinfo($location,PATHINFO_EXTENSION);
                $imageFileType = strtolower($imageFileType);
                $newfilename=md5($filename.time()).'.'.$imageFileType;
                $valid_extensions = array("jpg","jpeg","png");
                if(in_array(strtolower($imageFileType), $valid_extensions)) {
                    /* Upload file */
                    if(move_uploaded_file($_FILES['file']['tmp_name'],"../storage/packages/".$newfilename)){
                        $image = "storage/packages/".$newfilename;
                    }
                }else{
                    if(!$_POST['update_id'] && $_POST['update_id'] == ''){
                        exit(json_encode(['status'=>0,'msg'=>'Invalid image, image type not valid for upload']));
                    }
                   
                }
            }
            $sort=0;
            if($_POST['sort'] && $_POST['sort'] !=''){
                $sort=$_POST['sort'];
            }
            if($image ==''){
                $q="";
            }else{
                $q=",image='".$image."'";
            }
            if(isset($_POST['update_id']) && $_POST['update_id'] !=''){
                $sql="UPDATE `".$config['db']['pre']."packages` SET name='".$_POST['name']."',description='".$_POST['description']."',sort='".$sort."'".$q." WHERE id=".$_POST['update_id'];
            }else{
                $sql="INSERT INTO `".$config['db']['pre']."packages` (name,description,sort,image) VALUES('".$_POST['name']."',
                '".$_POST['description']."',
                '".$sort."',
                '".$image."'
                )";
            }
           
            if($mysqli->query($sql)){
                exit(json_encode(['status'=>1]));
            }else{
                exit(json_encode(['status'=>0,'msg'=>'Unable to insert data, please try again later']));
            }
            exit(json_encode(['status'=>1]));
        }elseif($_POST['action'] == 'delete-package'){
            $sql="DELETE FROM `".$config['db']['pre']."packages` WHERE id=".$_POST['id'];
            if($mysqli->query($sql)){
                $mysqli->query("DELETE FROM `".$config['db']['pre']."packages_types` WHERE pid=".$_POST['id']);
                $mysqli->query("DELETE FROM `".$config['db']['pre']."packages_price` WHERE pid=".$_POST['id']);
                exit(json_encode(['status'=>1]));
            }else{
                exit(json_encode(['status'=>0,'msg'=>'Unable to delete data, please try again later']));
            }
        }elseif($_POST['action'] == 'delete-type'){
            $sql="DELETE FROM `".$config['db']['pre']."packages_types` WHERE id=".$_POST['id'];
            if($mysqli->query($sql)){
                $mysqli->query("DELETE FROM `".$config['db']['pre']."packages_price` WHERE tid=".$_POST['id']);
                exit(json_encode(['status'=>1]));
            }else{
                exit(json_encode(['status'=>0,'msg'=>'Unable to delete data, please try again later']));
            }
        }elseif($_POST['action'] =='get-package'){
            $sql="SELECT * FROM `".$config['db']['pre']."packages` WHERE id=".$_POST['id'];
            $result = $mysqli->query($sql);
            $p=[];
            if($result->num_rows > 0){
                while ($row = mysqli_fetch_assoc($result)) {
                    $p=$row;
                }
            }
            if(empty($p)){
                exit(json_encode(['status'=>0,'msg'=>'Unable to get data, please try again later']));
            }else{
                exit(json_encode(['status'=>1,'data'=>$p]));
            }
        }elseif($_POST['action'] =='get-type'){
            $sql="SELECT * FROM `".$config['db']['pre']."packages_types` WHERE id=".$_POST['id'];
            $result = $mysqli->query($sql);
            $p=[];
            if($result->num_rows > 0){
                while ($row = mysqli_fetch_assoc($result)) {
                    $p=$row;
                }
            }
            if(empty($p)){
                exit(json_encode(['status'=>0,'msg'=>'Unable to get data, please try again later']));
            }else{
                exit(json_encode(['status'=>1,'data'=>$p]));
            }
        }
    }
?>
<?php
include("header.php");

$query = "SELECT * FROM `".$config['db']['pre']."packages` ORDER by sort ASC";
$result = $mysqli->query($query);
$o=[];
if($result->num_rows > 0){
    while ($row = mysqli_fetch_assoc($result)) {
        $sql_types="SELECT * FROM `".$config['db']['pre']."packages_types` WHERE pid=".$row['id'];
        $type_result=$mysqli->query($sql_types);
        $row['types']=[];
        if($type_result->num_rows > 0){
            while ($val = mysqli_fetch_assoc($type_result)) {
                $row['types'][]=$val;
            }
        }
        $o[]=$row;
    } 
}
?>

<!-- Page JS Plugins CSS -->
<link rel="stylesheet" href="assets/js/plugins/datatables/jquery.dataTables.min.css" />
<main class="app-layout-content">

    <!-- Page Content -->
    <div class="container-fluid p-y-md">
        <!-- Partial Table -->
        <div class="card">
            <div class="card-header">
                <h4>All Price Packages</h4>
                <div class="pull-right">
                    <a href="#!" class="btn btn-success waves-effect waves-light m-r-10 btn_add_new_package">Add new package</a>
                    <a href="price_categories.php" class="btn btn-warning waves-effect waves-light m-r-10">Manage price</a>
                </div>
                
            </div>
            <div class="card-body">
                <div class="container">
                    <div class="row">
                        <?php
                            if(count($o) > 0){
                                foreach($o as $i){
                                    ?>
                                        <div class="col-12 col-md-4">
                                            <div class="card shadow">
                                                <div class="card-header" style="background: #eee;">
                                                    <?php echo $i['name'] ?> - <?php echo $i['sort']; ?> 
                                                </div>
                                                <div class="card-body">
                                                    <p><?php echo $i['description'];?></p>
                                                    <img src="../<?php echo $i['image'];?>" style="width:100%"/>
                                                </div>
                                                <div class="card-headers" style="padding:5px;border-top:1px solid #ddd">
                                                    Price Types 
                                                </div>
                                                <div class="card-body">
                                                    <a href="#!" class="btn btn-sm btn-success btn-add-types btn-block" data-name="<?php echo $i['name'] ?>" data-id="<?php echo $i['id']; ?>">Add new type</a>
                                                    <ul style="border-top: 1px solid #ddd;margin-top:5px">
                                                    <?php 
                                                        if(isset($i['types']) && count($i['types']) > 0){
                                                            foreach($i['types'] as $r){
                                                                ?>
                                                                    <li>
                                                                        <span class="badge badge-<?php echo $r['color']; ?>"><?php echo $r['name'] ?></span> <a href='#!' class="btn btn-sm btn-warning btn-edit-type" data-id="<?php echo $r['id']; ?>">Edit</a>
                                                                        | <a href='#!' class="btn btn-sm btn-danger btn-delete-type" data-id="<?php echo $r['id']; ?>">Delete</a>
                                                                    </li>
                                                                <?php
                                                            }
                                                        }
                                                    ?>
                                                    </ul>
                                                </div>
                                                <div class="card-footer" style="background: #eee;padding:8px">
                                                    <a href="#!" class="btn btn-sm btn-warning btn-edit-package" data-id="<?php echo $i['id']; ?>">Edit</a> | <a href="#!" class="btn btn-sm btn-danger btn-delete-package" data-id="<?php echo $i['id']; ?>">Delete</a>
                                                </div>
                                            </div>
                                        </div>
                                    <?php
                                }
                            }
                        ?>
                    </div>
                </div>
            </div>
        </div>
    </div>
</main>

    


<?php include("footer.php"); ?>

<div class="modal fade" id="add_new_price_package_model" tabindex="-1" role="dialog" aria-labelledby="add_new_price_package_model" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add new price packages</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
            </div>
            <div class="modal-body">
                <div class="alert alert-danger" style="display:none" id="p_a_"></div>
                <div class="form-group">
                    <label>Package Name</label>
                    <input type="text" name="name" id="p_name" class="form-control">
                </div>
                <div class="form-group">
                    <label>Description</label>
                    <textarea name="description" id="description" cols="30" rows="4" class="form-control"></textarea>
                </div>
                <div class="form-group">
                    <label>Image File</label>
                    <input type="file" name="file" id="file">
                </div>
                <div class="form-group">
                    <label>Sort</label>
                    <input type="text" name="sort" id="sort" class="form-control">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" id="save_button_add_package" class="btn btn-primary">Save</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="edit_new_price_package_model" tabindex="-1" role="dialog" aria-labelledby="edit_new_price_package_model" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit price packages</h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
            </div>
            <input type="hidden" name="edit_pack" id="edit_pack">
            <div class="modal-body">
                <div class="alert alert-danger" style="display:none" id="p_e_"></div>
                <div class="form-group">
                    <label>Package Name</label>
                    <input type="text" name="name" id="pe_name" class="form-control">
                </div>
                <div class="form-group">
                    <label>Description</label>
                    <textarea name="description" id="pe_description" cols="30" rows="4" class="form-control"></textarea>
                </div>
                <div class="form-group">
                    <label>New Image File</label>
                    <input type="file" name="pe_file" id="pe_file">
                </div>
                <div class="form-group">
                    <label>Sort</label>
                    <input type="text" name="sort" id="pe_sort" class="form-control">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" id="save_button_edit_package" class="btn btn-primary">Save</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="add_new_type_modal" tabindex="-1" role="dialog" aria-labelledby="add_new_type_modal" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Add new price type for <span id="package_name"></span> </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
            </div>
            <div class="modal-body">
                <input type="hidden" name="pak_id" id="pack_id">
                <div class="alert alert-danger" id="tp_a_" style="display: none;"></div>
                <div class="form-group">
                    <label>Type Name</label>
                    <input type="text" name="typename" id="typename" class="form-control">
                </div>
                <div class="form-group">
                    <label>Color</label>
                    <select name="color" id="color" class="form-control">
                        <option value="primary">Primary</option>
                        <option value="success">Success</option>
                        <option value="danger">Danger</option>
                        <option value="info">Info</option>
                        <option value="warning">Warning</option>
                        <option value="white">White</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Sort</label>
                    <input type="text" name="tsort" id="tsort" class="form-control">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" id="save_button_add_type" class="btn btn-primary">Add</button>
            </div>
        </div>
    </div>
</div>

<div class="modal fade" id="edit_new_type_modal" tabindex="-1" role="dialog" aria-labelledby="edit_new_type_modal" aria-hidden="true">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <h5 class="modal-title">Edit type </h5>
                    <button type="button" class="close" data-dismiss="modal" aria-label="Close">
                        <span aria-hidden="true">&times;</span>
                    </button>
            </div>
            <div class="modal-body">
                <input type="hidden" name="te_pak_id" id="te_pack_id">
                <div class="alert alert-danger" id="tp_e_" style="display: none;"></div>
                <div class="form-group">
                    <label>Type Name</label>
                    <input type="text" name="et_typename" id="et_typename" class="form-control">
                </div>
                <div class="form-group">
                    <label>Color</label>
                    <select name="et_color" id="et_color" class="form-control">
                        <option value="primary">Primary</option>
                        <option value="success">Success</option>
                        <option value="danger">Danger</option>
                        <option value="info">Info</option>
                        <option value="warning">Warning</option>
                        <option value="white">White</option>
                    </select>
                </div>
                <div class="form-group">
                    <label>Sort</label>
                    <input type="text" name="te_tsort" id="te_tsort" class="form-control">
                </div>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                <button type="button" id="save_button_edit_type" class="btn btn-primary">Save</button>
            </div>
        </div>
    </div>
</div>

<script>
    $(document).on('click','.btn-delete-type',function(){
        //delete-package
        let did=$(this).attr('data-id');
        let tt=$(this);
        if(confirm('Are you sure to delete this type? data will be lost')){
            $.ajax({
            url: '',
            type: 'post',
            data: {
                action:'delete-type',
                id:did
            },
            dataType:'json',
            beforeSend:function(){
                tt.toggleClass('disabled');
            },
            success: function(response){
                tt.toggleClass('disabled');
                if(response.status == 1){
                    alert('Success!');
                    location.reload();
                }else{
                    alert('Error!');
                }
            },error:function(err){
                tt.toggleClass('disabled');
                console.log(err);
                alert('Error!');
            }
        });
        }
    });
    $(document).on('click','.btn-delete-package',function(){
        //delete-package
        let did=$(this).attr('data-id');
        let tt=$(this);
        if(confirm('Are you sure to delete this package? data will be lost')){
            $.ajax({
            url: '',
            type: 'post',
            data: {
                action:'delete-package',
                id:did
            },
            dataType:'json',
            beforeSend:function(){
                tt.toggleClass('disabled');
            },
            success: function(response){
                tt.toggleClass('disabled');
                if(response.status == 1){
                    alert('Success!');
                    location.reload();
                }else{
                    alert('Error!');
                }
            },error:function(err){
                tt.toggleClass('disabled');
                console.log(err);
                alert('Error!');
            }
        });
        }
    });
    $(document).on("click",'#save_button_edit_package',function(){
        var formd=new FormData;
        formd.append('action','add-package');
        formd.append('name',$("#pe_name").val());
        formd.append('update_id',$("#edit_pack").val());
        formd.append('description',$("#pe_description").val());
        formd.append('file',$("#pe_file")[0].files[0]);
        formd.append('sort',$("#pe_sort").val());
        $.ajax({
            url: '',
            type: 'post',
            data: formd,
            dataType:'json',
            contentType: false,
            processData: false,
            beforeSend:function(){
                $("#p_e_").html('');
                $("#p_e_").hide();
            },
            success: function(response){
                if(response.status == 1){
                    $("#edit_new_price_package_model").modal('hide');
                    alert('Success!');
                    location.reload();
                }else{
                    $("#p_e_").html('');
                    $("#p_e_").html(response.msg);
                    $("#p_e_").show();
                }
            },error:function(err){
                console.log(err);
                alert('Error!');
            }
        });
    });
    $(document).on('click','#save_button_edit_type',function(){
        var formd=new FormData();
        formd.append('action','add-type');
        formd.append('update_id',$("#te_pack_id").val());
        formd.append('typename',$("#et_typename").val());
        formd.append('color',$("#et_color").val());
        formd.append('sort',$("#te_tsort").val());
        $.ajax({
            url: '',
            type: 'post',
            data: formd,
            dataType:'json',
            contentType: false,
            processData: false,
            beforeSend:function(){
                $("#tp_e_").html('');
                $("#tp_e_").hide();
            },
            success: function(response){
                if(response.status == 1){
                    $("#edit_new_type_modal").modal('hide');
                    alert('Success!');
                    location.reload();
                }else{
                    $("#tp_a_").html('');
                    $("#tp_a_").html(response.msg);
                    $("#tp_a_").show();
                }
            },error:function(err){
                console.log(err);
                alert('Error!');
            }
        });
    });
    $(document).on('click','.btn_add_new_package',function(){
        let $r_=$(this);
        $("#add_new_price_package_model").modal('show');
    });
    $(document).on('click','.btn-add-types',function(){
        let $rr_=$(this);
        $("#package_name").text($rr_.attr('data-name'));
        $("#pack_id").val($rr_.attr('data-id'));
        $("#add_new_type_modal").modal('show');
    });
    $(document).on('click','.btn-edit-type',function(){
        var eid=$(this).attr('data-id');
        $.ajax({
            url: '',
            type: 'post',
            data: {
                action:'get-type',
                id:eid
            },
            dataType:'json',
            beforeSend:function(){
                $("#tp_e_").html('');
                $("#tp_e_").hide();
            },
            success: function(response){
                if(response.status == 1){
                    $("#te_pack_id").val(response.data.id);
                    $("#et_color").val(response.data.color);
                    $("#te_tsort").val(response.data.sort);
                    $("#et_typename").val(response.data.name);
                    $("#edit_new_type_modal").modal('show');
                }else{
                    $("#tp_e_").html('');
                    $("#tp_e_").html(response.msg);
                    $("#tp_e_").show();
                }
            },error:function(err){
                console.log(err);
                alert('Error!');
            }
        });
    });
    $(document).on('click','.btn-edit-package',function(){
        var eid=$(this).attr('data-id');
        $.ajax({
            url: '',
            type: 'post',
            data: {
                action:'get-package',
                id:eid
            },
            dataType:'json',
            beforeSend:function(){
                $("#p_e_").html('');
                $("#p_e_").hide();
            },
            success: function(response){
                if(response.status == 1){
                    $("#edit_pack").val(response.data.id);
                    $("#pe_name").val(response.data.name);
                    $("#pe_description").val(response.data.description);
                    $("#pe_sort").val(response.data.sort);
                    $("#edit_new_price_package_model").modal('show');
                }else{
                    $("#p_e_").html('');
                    $("#p_e_").html(response.msg);
                    $("#p_e_").show();
                }
            },error:function(err){
                console.log(err);
                alert('Error!');
            }
        });
    });
    $(document).on("click",'#save_button_add_type',function(){
        var formd=new FormData();
        formd.append('action','add-type');
        formd.append('pak_id',$("#pack_id").val());
        formd.append('typename',$("#typename").val());
        formd.append('color',$("#color").val());
        formd.append('sort',$("#tsort").val());
        $.ajax({
            url: '',
            type: 'post',
            data: formd,
            dataType:'json',
            contentType: false,
            processData: false,
            beforeSend:function(){
                $("#p_a_").html('');
                $("#p_a_").hide();
            },
            success: function(response){
                if(response.status == 1){
                    $("#add_new_price_package_model").modal('hide');
                    alert('Success!');
                    location.reload();
                }else{
                    $("#tp_a_").html('');
                    $("#tp_a_").html(response.msg);
                    $("#tp_a_").show();
                }
            },error:function(err){
                console.log(err);
                alert('Error!');
            }
        });
    });
    $(document).on("click",'#save_button_add_package',function(){
        var formd=new FormData;
        formd.append('action','add-package');
        formd.append('name',$("#p_name").val());
        formd.append('description',$("#description").val());
        formd.append('file',$("#file")[0].files[0]);
        formd.append('sort',$("#sort").val());
        $.ajax({
            url: '',
            type: 'post',
            data: formd,
            dataType:'json',
            contentType: false,
            processData: false,
            beforeSend:function(){
                $("#p_a_").html('');
                $("#p_a_").hide();
            },
            success: function(response){
                if(response.status == 1){
                    $("#add_new_price_package_model").modal('hide');
                    alert('Success!');
                    location.reload();
                }else{
                    $("#p_a_").html('');
                    $("#p_a_").html(response.msg);
                    $("#p_a_").show();
                }
            },error:function(err){
                console.log(err);
                alert('Error!');
            }
        });
    });
    $(function()
    {
        // Init page helpers (Table Tools helper)
        App.initHelpers('table-tools');

        // Init page helpers (BS Notify Plugin)
        App.initHelpers('notify');
    });
</script>
</body>

</html>
