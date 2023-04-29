<?php
require_once('../includes/config.php');
require_once('../includes/functions/func.admin.php');
require_once('../includes/functions/func.sqlquery.php');
require_once('../includes/functions/func.users.php');
require_once('../includes/lang/lang_'.$config['lang'].'.php');
$mysqli = db_connect($config);
admin_session_start();
checkloggedadmin($config);

$total_last_month_item = mysqli_num_rows(mysqli_query($mysqli,"SELECT * FROM ad_product WHERE created_at > (NOW() - INTERVAL 1 MONTH)"));

$current_month = mysqli_num_rows(mysqli_query($mysqli,"SELECT * FROM ad_product WHERE MONTH(created_at) = MONTH(CURRENT_DATE()) AND YEAR(created_at) = YEAR(CURRENT_DATE())"));

include("header.php");

?>

<main class="app-layout-content">

    <!-- Page Content -->
    <div class="container-fluid p-y-md">
        <div class="row">
            <div class="col-md-6">
                <a class="card" href="#">
                    <div class="card-block clearfix">
                        <div class="pull-right">
                            <p class="h6 text-muted m-t-0 m-b-xs">Last Month</p>
                            <p class="h3 text-blue m-t-sm m-b-0"><?php echo $total_last_month_item; ?></p>
                        </div>
                        <div class="pull-left m-r">
                            <span class="img-avatar img-avatar-48 bg-blue bg-inverse"><i class="ion-ios-arrow-back  fa-1-5x"></i></span>
                        </div>
                    </div>
                </a>
            </div>
            <!-- .col-sm-6 -->

            <div class="col-md-6">
                <a class="card bg-green bg-inverse" href="#">
                    <div class="card-block clearfix">
                        <div class="pull-right">
                            <p class="h6 text-muted m-t-0 m-b-xs">Current Month</p>
                            <p class="h3 m-t-sm m-b-0"><?php echo $current_month; ?></p>
                        </div>
                        <div class="pull-left m-r">
                            <span class="img-avatar img-avatar-48 bg-gray-light-o"><i class="ion-ios-arrow-down  fa-1-5x"></i></span>
                        </div>
                    </div>
                </a>
            </div>
        </div>
        <!-- Partial Table -->
        <div class="card">
            <div class="card-header">
                <h4>Check voucher code</h4>
            </div>
            <div class="card-block">
               <form class="form-inline">
              <div class="form-group">
                <label for="code">Code</label>
                <input type="text" class="form-control" id="code">
              </div>
              <button type="submit" id="check_code" class="btn btn-default">Check</button>
            </form>
            </div>
            <!-- .card-block -->
        </div>
        <!-- .card -->
        <!-- End Partial Table -->

    </div>
    <!-- .container-fluid -->
    <!-- End Page Content -->

</main>



<?php include("footer.php"); ?>

<script>
    $(function()
    {
        // Init page helpers (Table Tools helper)
        App.initHelpers('table-tools');

        // Init page helpers (BS Notify Plugin)
        App.initHelpers('notify');
        
    });
    
    $(document).ready(function(){
        
    $('#check_code').click(function(e){
        var code = $('#code').val();
        $.ajax({                      
             type: "GET",
             cache: false,
             url:  "https://store.ikman.lk/en/vouchers/"+code+"/balance",
             success: function(data){
                 console.log(data);
                 
             }
        });
     });
    });
    
</script>
</body>

</html>

