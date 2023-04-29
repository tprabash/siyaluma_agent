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
    if($_POST['action'] == 'delete-range'){
        $id=$_POST['id'];
        $q="DELETE FROM `".$config['db']['pre']."packages_price` WHERE id=".$id;
        if($mysqli->query($q)){
            exit(json_encode(['status'=>1]));
        }
        exit(json_encode(['status'=>0]));

    }elseif($_POST['action'] == 'add-range'){
        $id=$_POST['id'];
        $ui=$_POST['uid'];
        $uid_arr=explode('-',$ui);
        if(isset($uid_arr[0])){
            $typeid=$uid_arr[0];
            $cat=$uid_arr[1];
            $pack=$uid_arr[2];

            $sql="INSERT INTO `".$config['db']['pre']."packages_price` (pid,tid,price,start_from,end_from,cid,is_main) VALUES(
                '".$pack."',
                '".$typeid."',
                '".$_POST['price']."',
                '".$_POST['start']."',
                '".$_POST['end']."',
                '".$cat."',
                '1'
            )";
            if($mysqli->query($sql)){
                exit(json_encode(['status'=>1]));
            }
            exit(json_encode(['status'=>0]));
        }
        
        exit(json_encode(['status'=>0]));
    }elseif($_POST['action'] == 'save-price'){
        $ar=$_POST['pak'];
        if(!empty($ar)){
            foreach ($ar as $k => $v) {
                $id=$v['id'];
                $cat=$v['cat'];
                $val=$v['value'];
                $type=$v['type'];
                $pak=$v['pak'];
                if(isset($id) && $id != ''){
                    $sql="UPDATE `".$config['db']['pre']."packages_price` SET price='".$val."' WHERE id=".$id;
                    $upda=$mysqli->query($sql);
                }else{
                    $sql="INSERT INTO `".$config['db']['pre']."packages_price` (pid,tid,price,start_from,end_from,cid,is_main) VALUES(
                        '".$pak."',
                        '".$type."',
                        '".$val."',
                        '0',
                        '0',
                        '".$cat."',
                        '1'
                    )";
                    $inst=$mysqli->query($sql);
                }
            }
            exit(json_encode(['status'=>1]));
        }
        exit(json_encode(['status'=>0]));
    }elseif($_POST['action'] == 'delete-range-sub'){
        $id=$_POST['id'];
        $q="DELETE FROM `".$config['db']['pre']."packages_price` WHERE id=".$id;
        if($mysqli->query($q)){
            exit(json_encode(['status'=>1]));
        }
        exit(json_encode(['status'=>0]));

    }elseif($_POST['action'] == 'add-range-sub'){
        $id=$_POST['id'];
        $ui=$_POST['uid'];
        $uid_arr=explode('-',$ui);
        if(isset($uid_arr[0])){
            $typeid=$uid_arr[0];
            $cat=$uid_arr[1];
            $pack=$uid_arr[2];

            $sql="INSERT INTO `".$config['db']['pre']."packages_price` (pid,tid,price,start_from,end_from,cid,is_main) VALUES(
                '".$pack."',
                '".$typeid."',
                '".$_POST['price']."',
                '".$_POST['start']."',
                '".$_POST['end']."',
                '".$cat."',
                '0'
            )";
            if($mysqli->query($sql)){
                exit(json_encode(['status'=>1]));
            }
            exit(json_encode(['status'=>0]));
        }
        
        exit(json_encode(['status'=>0]));
    }elseif($_POST['action'] == 'save-price-sub'){
        $ar=$_POST['pak'];
        if(!empty($ar)){
            foreach ($ar as $k => $v) {
                $id=$v['id'];
                $cat=$v['cat'];
                $val=$v['value'];
                $type=$v['type'];
                $pak=$v['pak'];
                if(isset($id) && $id != ''){
                    $sql="UPDATE `".$config['db']['pre']."packages_price` SET price='".$val."' WHERE id=".$id;
                    $upda=$mysqli->query($sql);
                }else{
                    $sql="INSERT INTO `".$config['db']['pre']."packages_price` (pid,tid,price,start_from,end_from,cid,is_main) VALUES(
                        '".$pak."',
                        '".$type."',
                        '".$val."',
                        '0',
                        '0',
                        '".$cat."',
                        '0'
                    )";
                    $inst=$mysqli->query($sql);
                }
            }
            exit(json_encode(['status'=>1]));
        }
        exit(json_encode(['status'=>0]));
    }
}

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

<link href="js/plugins/jqueryui/jquery-ui.min.css" rel="stylesheet">
<link rel="stylesheet" href="assets/css/price_category.css">
<style>
    .mt-1{
        margin-top:5px;
    }
    .mt-3{
        margin-top: 7px;
    }
    .p-auto{
        padding:5px;
    }
</style>
<!-- Page Content -->
<main class="app-layout-content">

    <!-- Page Content -->
    <div class="container-fluid p-y-md">
        <!-- Partial Table -->
        <div class="card">
            <div class="card-header">
                <h4>Price Packages For Categories</h4>
            </div>
            <div class="card-block">
                <!-- /row -->
                <div class="row">
                    <div class="col-sm-12">
                        <div class="white-box">
                            <div id="quickad-tbs" class="wrap">
                                <div class="quickad-tbs-body">
                                    <div class="row">
                                        <div id="quickad-sidebar" class="col-sm-4">
                                            <div id="quickad-categories-list" class="quickad-nav">
                                                <div class="quickad-nav-item active quickad-category-item quickad-js-all-services">
                                                    <div class="quickad-padding-vertical-xs">All Categories</div>
                                                </div>
                                                <ul id="quickad-category-item-list" class="ui-sortable">
                                                    <?php
                                                    $query = "SELECT * FROM `".$config['db']['pre']."catagory_main` ORDER by cat_order ASC";
                                                    $result = $mysqli->query($query);
                                                    while ($row = mysqli_fetch_assoc($result)) {
                                                        $catid = $row['cat_id'];
                                                        $catname = $row['cat_name'];
                                                        $caticon = $row['icon'];
                                                        $catslug = $row['slug'];
                                                        $picture = $row['picture'];
                                                        ?>
                                                        
                                                        <div class="modal fade" id="price_category_modal_<?php echo $catid;?>" tabindex="-1" role="dialog" aria-labelledby="modelTitleId" aria-hidden="true">
                                                            <div class="modal-dialog modal-lg" role="document">
                                                                <div class="modal-content">
                                                                    <div class="modal-body">
                                                                        <div class="containers">
                                                                            <div class="row">
                                                                            <?php
                                                                                if(isset($o) && !empty($o)){    
                                                                                    foreach ($o as $k => $v) {
                                                                                        ?>
                                                                                            <div class="col-12 col-md-6 shadow">
                                                                                                <h4 style="border-bottom:1px solid #999;margin-bottom:2px;background:#eee;padding:5px"><?php echo $v['name']; ?></h4>
                                                                                                <img src="../<?php echo $v['image'];?>" style="width:100%"/>
                                                                                                <?php 
                                                                                                    if(isset($v['types']) && !empty($v['types'])){
                                                                                                        foreach ($v['types'] as $kk => $r) {
                                                                                                            $this_price_category="SELECT * FROM `".$config['db']['pre']."packages_price` WHERE pid='".$v['id']."' AND tid='".$r['id']."' AND cid='".$catid."' AND is_main =1 ORDER by id ASC";    
                                                                                                            $tre_=$mysqli->query($this_price_category);
                                                                                                            $prices=[];
                                                                                                            if($tre_->num_rows > 0){
                                                                                                                while ($a = mysqli_fetch_assoc($tre_)) {
                                                                                                                    $prices[]=$a;
                                                                                                                }
                                                                                                            }
                                                                                                            ?>
                                                                                                            <div class="form-group mt-1">
                                                                                                                <label style="display: block;" class="p-auto  badge label-<?php echo $r['color']; ?>"><?php echo $r['name'] ?></label>
                                                                                                                <input type="text"  data-id="<?php if(isset($prices[0])) echo $prices[0]['id']; ?>" data-pak="<?php echo $v['id']; ?>" data-cat-id="<?php echo $catid; ?>" data-type-id="<?php echo $r['id'] ?>" <?php if(isset($prices[0])) echo 'value="'.$prices[0]['price'].'"'; ?> placeholder="Default price" class="form-control default-prices">
                                                                                                            </div>
                                                                                                            <div class="price-range-div" id="price-range-div-<?php echo $r['id']; ?>-<?php echo $catid; ?>-<?php echo $v['id']; ?>">
                                                                                                            <?php 
                                                                                                                if(isset($prices) && count($prices) > 1){ ?> <hr /> <?php
                                                                                                                    foreach ($prices as $key => $value) {
                                                                                                                        if($key != 0){
                                                                                                                            ?>
                                                                                                                            <div class="input-group mt-1">
                                                                                                                                Price Range From <?php echo $value['start_from']; ?> - To <?php echo $value['end_from']; ?>
                                                                                                                                <input type="text"  data-id="<?php echo $value['id'] ?>" value="<?php echo $value['price'] ?>" placeholder="Range price" class="form-control price-ranges">
                                                                                                                                <span class="input-group-addon">
                                                                                                                                    <a href="#!" class="btn btn-sm btn-danger btn-remove-price-range" data-id="<?php echo $value['id'] ?>"><i class="fa fa-trash" aria-hidden="true"></i></a>
                                                                                                                                </span>
                                                                                                                            </div>
                                                                                                                            <?php
                                                                                                                        }
                                                                                                                    }
                                                                                                                }
                                                                                                            ?>
                                                                                                            </div>
                                                                                                            <hr />
                                                                                                                <div class="price-range-container">
                                                                                                                    <div class="p-2" style="border:1px solid #dee;padding:3px;display:none;" id="new-price-range-<?php echo $r['id']; ?>-<?php echo $catid; ?>-<?php echo $v['id']; ?>"  class="new-price-range">
                                                                                                                        <h5>Add new price range</h5> 
                                                                                                                        <div class="form-group">
                                                                                                                            <label> Start from </label>
                                                                                                                            <input type="text" placeholder="Price start"  class="form-control start_from">
                                                                                                                        </div>
                                                                                                                        <div class="form-group">
                                                                                                                            <label> End to </label>
                                                                                                                            <input type="text" placeholder="Price end unlimited = 0"  class="form-control end_to">
                                                                                                                        </div>
                                                                                                                        <div class="form-group">
                                                                                                                            <label> Price </label>
                                                                                                                            <input type="text" placeholder="Price"  class="form-control range_price">
                                                                                                                        </div>
                                                                                                                        <div class="form-group">
                                                                                                                            <a href="#!" class="btn btn-info btn-sm save_range" data-cat-id="<?php echo $catid; ?>" data-uid="<?php echo $r['id']; ?>-<?php echo $catid; ?>-<?php echo $v['id']; ?>" data-pack-id="<?php echo $v['id']; ?>" data-type-id="<?php echo $r['id'] ?>">Save</a> | <a href="#!" class="btn btn-dark btn-sm cancel_range">Cancel</a>
                                                                                                                        </div>
                                                                                                                    </div>
                                                                                                                    <a href="#!" class="btn btn-sm btn-success btn-add-new-range btn-block" data-cat-id="<?php echo $catid; ?>" data-uid="<?php echo $r['id']; ?>-<?php echo $catid; ?>-<?php echo $v['id']; ?>" data-pack-id="<?php echo $v['id']; ?>" data-type-id="<?php echo $r['id'] ?>" >Add new price range</a>
                                                                                                                </div>
                                                                                                            <?php
                                                                                                        }
                                                                                                    }
                                                                                                ?>
                                                                                            </div>
                                                                                        <?php
                                                                                    }
                                                                                }
                                                                                ?>
                                                                            </div>
                                                                        </div>
                                                                        <hr>
                                                                    </div>
                                                                    <div class="modal-footer">
                                                                        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
                                                                        <button type="button" id="save_price_category" class="btn btn-primary">Save</button>
                                                                    </div>
                                                                </div>
                                                            </div>
                                                        </div>
                                                        <li class="quickad-nav-item  main_cat" data-category-id="<?php echo $catid; ?>">
                                                            <div class="quickad-flexbox">
                                                                <div class="quickad-flex-cell quickad-vertical-middle" style="width: 1%">
                                                                    <i class="quickad-js-handle quickad-icon quickad-icon-draghandle quickad-margin-right-sm quickad-cursor-move ui-sortable-handle" title="Reorder"></i>

                                                                </div>
                                                                <div class="quickad-flex-cell quickad-vertical-middle">
                                                                    <span class="displayed-value" style="display: inline;">
                                                                        <i id="quickad-cat-icon" class="quickad-margin-right-sm <?php echo $caticon; ?>"
                                                                        title="<?php echo $catname; ?>"></i> <?php echo $catname; ?>
                                                                    </span>
                                                                </div>
                                                                <div class="quickad-flex-cell quickad-vertical-middle" style="width: 1%;font-size: 18px;">
                                                                    <a href="#!" class="btn btn-sm btn-price-category" data-id="<?php echo $catid; ?>">Prices</a>
                                                                </div>
                                                            </div>
                                                        </li>
                                                    <?php  } ?>
                                                </ul>
                                            </div>

                                           

                                        </div>

                                        <div id="quickad-services-wrapper" class="col-sm-8">
                                            <div class="panel panel-default quickad-main">
                                                <div class="panel-body">
                                                    <h4 class="quickad-block-head">
                                                        <span class="quickad-category-title">All Categories</span>
                                                    </h4>
                                                    <form method="post" id="new-subcategory-form" style="display: none">
                                                        <div class="form-group quickad-margin-bottom-md">
                                                            <div class="form-field form-required">
                                                                <label for="new-subcategory-name">Title</label>
                                                                <input class="form-control" id="new-subcategory-name" type="text" name="name" required=""/>
                                                                <input type="hidden" id="cat-id" name="cat_id" value="0">
                                                            </div>
                                                        </div>
                                                        <div class="text-right">
                                                            <button type="submit" class="btn btn-success confirm">Save</button>
                                                            <button type="button" id="cancel-button" class="btn btn-default">Cancel</button>
                                                        </div>
                                                    </form>

                                                    <p class="quickad-margin-top-xlg no-result" style="display: none;">No services found. Please add services</p>

                                                    <div class="quickad-margin-top-xlg" id="ab-services-list">
                                                        <div class="panel-group ui-sortable" id="services_list" role="tablist" aria-multiselectable="true">

                                                        </div>
                                                    </div>
                                                </div>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <div id="quickad-alert" class="quickad-alert"></div>
                            </div>
                        </div>
                    </div>
                </div>
                <!-- /.row -->
            </div>
            <!-- .card-block -->
        </div>
        <!-- .card -->
        <!-- End Partial Table -->

    </div>
    <!-- .container-fluid -->
    <!-- End Page Content -->

</main>

<script>
    $(document).on('click','#save_price_sub_category',function(){
        var obj=[];
        let tt=$(this);
        $('.default-prices-sub').each(function(i,v){
            if($(this).val() !=''){
                obj.push({
                    id:$(this).attr('data-id'),
                    value:$(this).val(),
                    cat:$(this).attr('data-cat-id'),
                    type:$(this).attr('data-type-id'),
                    pak:$(this).attr('data-pak'),
                });
            }
        }); 
        $.ajax({
            url: '',
            type: 'post',
            data: {
                action:'save-price-sub',
                pak:obj,
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
                    console.log(err);
                    alert('Error!');
                }
                
            },error:function(err){
                tt.toggleClass('disabled');
                console.log(err);
                alert('Error!');
            }
        });
    });
    $(document).on('click','.save_range_sub',function(){
        let typeid=$(this).attr('data-uid');
        let tt=$(this);
        var new_range_start=$('#new-price-range-sub-'+typeid).find('.start_from').val();
        var new_ranage_end=$("#new-price-range-sub-"+typeid).find('.end_to').val();
        var new_range_price=$('#new-price-range-sub-'+typeid).find('.range_price').val();
        if(new_range_start == undefined || new_range_start == ''){
            alert('Please type start price');
            return;
        }
        if(new_ranage_end == undefined || new_ranage_end == ''){
            alert('Please type end price');
            return;
        }
        if(new_range_price == undefined || new_range_price == ''){
            alert('Please type price');
            return;
        }
        $.ajax({
            url: '',
            type: 'post',
            data: {
                action:'add-range-sub',
                uid:typeid,
                start:new_range_start,
                end:new_ranage_end,
                price:new_range_price
            },
            dataType:'json',
            beforeSend:function(){
                tt.toggleClass('disabled');
            },
            success: function(response){
                tt.toggleClass('disabled');
                if(response.status == 1){
                    let temp_div=`
                    <div class="input-group mt-1">
                        Price Range From `+new_range_start+` - To `+new_ranage_end+`
                        <input type="text" data-id="`+response.id+`" value="`+new_range_price+`" placeholder="Range price" class="form-control price-ranges-sub">
                        <span class="input-group-addon">
                            <a href="#!" data-id="`+response.id+`" class="btn btn-sm btn-danger btn-remove-price-range-sub"><i class="fa fa-trash" aria-hidden="true"></i></a>
                        </span>
                    </div>
                    `;
                    $("#price-range-div-sub-"+typeid).append(temp_div);
                }else{
                    alert('Error!');
                }
            },error:function(err){
                tt.toggleClass('disabled');
                console.log(err);
                alert('Error!');
            }
        });
       
    });
    $(document).on('click','.btn-remove-price-range-sub',function(){
        if($(this).attr('data-id') == undefined){
            $(this).parent().parent().remove();
            return;
        }
        let tt=$(this);
        var dddid=$(this).attr('data-id');
        if(confirm('Are you sure to delete this price range? data will be lost')){
            $.ajax({
                url: '',
                type: 'post',
                data: {
                    action:'delete-range-sub',
                    id:dddid
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
    $(document).on('click','.btn-add-new-range-sub',function(){
        $('#new-price-range-sub-'+$(this).attr('data-uid')).show();
    });
    
    $(document).on('click','.btn-price-category-sub',function(){
        var dtt=$(this).attr('data-id');
        $("#price_sub_category_modal_"+dtt).modal('show');
    });
    //Main
    $(document).on('click','#save_price_category',function(){
        var obj=[];
        let tt=$(this);
        $('.default-prices').each(function(i,v){
            obj.push({
                id:$(this).attr('data-id'),
                value:$(this).val(),
                cat:$(this).attr('data-cat-id'),
                type:$(this).attr('data-type-id'),
                pak:$(this).attr('data-pak'),
            });
        }); 
        $.ajax({
            url: '',
            type: 'post',
            data: {
                action:'save-price',
                pak:obj,
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
                    console.log(err);
                    alert('Error!');
                }
                
            },error:function(err){
                tt.toggleClass('disabled');
                console.log(err);
                alert('Error!');
            }
        });
    });
    $(document).on('click','.save_range',function(){
        let typeid=$(this).attr('data-uid');
        let tt=$(this);
        var new_range_start=$('#new-price-range-'+typeid).find('.start_from').val();
        var new_ranage_end=$("#new-price-range-"+typeid).find('.end_to').val();
        var new_range_price=$('#new-price-range-'+typeid).find('.range_price').val();
        if(new_range_start == undefined || new_range_start == ''){
            alert('Please type start price');
            return;
        }
        if(new_ranage_end == undefined || new_ranage_end == ''){
            alert('Please type end price');
            return;
        }
        if(new_range_price == undefined || new_range_price == ''){
            alert('Please type price');
            return;
        }
        $.ajax({
            url: '',
            type: 'post',
            data: {
                action:'add-range',
                uid:typeid,
                start:new_range_start,
                end:new_ranage_end,
                price:new_range_price
            },
            dataType:'json',
            beforeSend:function(){
                tt.toggleClass('disabled');
            },
            success: function(response){
                tt.toggleClass('disabled');
                if(response.status == 1){
                    let temp_div=`
                    <div class="input-group mt-1">
                        Price Range From `+new_range_start+` - To `+new_ranage_end+`
                        <input type="text" data-id="`+response.id+`" value="`+new_range_price+`" placeholder="Range price" class="form-control price-ranges">
                        <span class="input-group-addon">
                            <a href="#!" data-id="`+response.id+`" class="btn btn-sm btn-danger btn-remove-price-range"><i class="fa fa-trash" aria-hidden="true"></i></a>
                        </span>
                    </div>
                    `;
                    $("#price-range-div-"+typeid).append(temp_div);
                }else{
                    alert('Error!');
                }
            },error:function(err){
                tt.toggleClass('disabled');
                console.log(err);
                alert('Error!');
            }
        });
       
    });
    $(document).on('click','.btn-remove-price-range',function(){
        if($(this).attr('data-id') == undefined){
            $(this).parent().parent().remove();
            return;
        }
        let tt=$(this);
        var dddid=$(this).attr('data-id');
        if(confirm('Are you sure to delete this price range? data will be lost')){
            $.ajax({
                url: '',
                type: 'post',
                data: {
                    action:'delete-range',
                    id:dddid
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
    $(document).on('click','.btn-add-new-range',function(){
        $('#new-price-range-'+$(this).attr('data-uid')).show();
    });
    $(document).on('click','.cancel_range',function(){
        $(this).parent().parent().hide();
    });
    $(document).on('click','.btn-price-category',function(){
        var dtt=$(this).attr('data-id');
        $("#price_category_modal_"+dtt).modal('show');
    });
    
    $(document).on('click','.main_cat',function(){
        $('#ab-services-list').html('<div class="quickad-loading"></div>');
        var $clicked = $(this);

        $.get(ajaxurl, {action:'getSubCatForPrice', category_id: $clicked.data('category-id')}, function(response) {
            if ( response != 0 ) {
                $('.quickad-category-title').text($clicked.find('.displayed-value').text());
                $('#ab-services-list').html(response);
            }else{
                $('#ab-services-list').html('<h3>No sub category found.</h3>');
            }
            $('.main_cat').not($clicked).removeClass('active');
            $clicked.addClass('active');
            if($clicked.data('category-id') != undefined){
                $('.new-subcategory').show();
            }else{
                $('.new-subcategory').hide();
            }
        });
    });
    
    //  $(document).on('click','#promoteBtn', function(event){
    //     event.preventDefault();
    //     let category_id = $(this).attr('data-id');
    //     $.ajax({
    //         url: 'ajax_admin.php',
    //         type: 'POST',
    //         dataType: 'application/json',
    //         data: $("#promoteForm").serialize() + '&action=' + 'add-promotion' + '&category_id=' + category_id,
    //         success: function(data) {
    //           console.log(data);
    //         }
    //     });
    //  });
    
</script>
<?php include("footer.php"); ?>
<script src="js/plugins/jqueryui/jquery-ui.min.js"></script>
<script src="js/custom-manage/category.js"></script>
<script src="js/custom-manage/alert.js"></script>
<script>
    setTimeout(function(){
        $('.main_cat')[0].click();
    },3000);
    
</script>
</body></html>
