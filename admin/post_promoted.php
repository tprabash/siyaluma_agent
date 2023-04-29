<?php
require_once('../includes/config.php');
require_once('../includes/functions/func.admin.php');
require_once('../includes/functions/func.sqlquery.php');
require_once('../includes/functions/func.users.php');
require_once('../includes/lang/lang_'.$config['lang'].'.php');
$mysqli = db_connect($config);
admin_session_start();
checkloggedadmin($config);

include("header.php");

?>
<!-- Page JS Plugins CSS -->
<link rel="stylesheet" href="assets/js/plugins/datatables/jquery.dataTables.min.css" />
<main class="app-layout-content">

    <!-- Page Content -->
    <div class="container-fluid p-y-md">
        <!-- Partial Table -->
        <div class="card">
            <div class="card-header">
                <h4>Promoted Ads</h4>
            </div>
            <div class="card-block">
                <div id="js-table-list">
                    <div class="table-responsive">
                    <table class="table table-vcenter table-hover" id="promoted-table">
                        <thead>
                        <tr>
                            <th>ID</th>
                            <th>Title</th>
                            <th class="hidden-xs hidden-sm">Top</th>
                            <th class="hidden-xs hidden-sm">T-Days</th>
                            <th>Bump</th>
                            <th>B-Days</th>
                            <th>Urgent</th>
                            <th>U-Days</th> 
                            <th>Spotlight</th>
                            <th>U-Spotlight</th>
                            <th>Payment</th>
                            <th>Reference </th>
                            <th>Action</th>
                        </tr>
                        </thead>
                        <tbody>
                            <?php
                              $sql = "SELECT * FROM ad_highlight ORDER BY highlight_id ASC"; 
                              $result = mysqli_query($mysqli, $sql) or die("database error:". mysqli_error($mysqli));
                            ?>
                            <?php if(isset($result)): ?>
                            <?php foreach($result as $row): ?>
                             <tr>
                                 <td><?=$row['highlight_id'];?></td>
                                 <td><a target="_blank" href="<?=$row['network_link'];?>"><?=$row['ad_title'];?></a></td>
                                 <td><span class="text-<?=$row['is_top_ad'] == "1" ? "success" : "warning";?>"><svg class="svg-inline--fa fa-circle fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="circle" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z"></path></svg></span></td>
                                 <td><?=$row['top_ad_days'];?></td>
                                 <td><span class="text-<?=$row['is_bump_ad'] == "1" ? "success" : "warning";?>"><svg class="svg-inline--fa fa-circle fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="circle" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z"></path></svg></span></td>
                                 <td><?=$row['bump_ad_days'];?></td>
                                 
                                 <td><span class="text-<?=$row['is_urgent_ad'] == "1" ? "success" : "warning";?>"><svg class="svg-inline--fa fa-circle fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="circle" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z"></path></svg></span></td>
                                 <td><?=$row['urgent_ad_days'];?></td>
                                 
                                 <td><span class="text-<?=$row['is_spotlight_ad'] == "1" ? "success" : "warning";?>"><svg class="svg-inline--fa fa-circle fa-w-16" aria-hidden="true" data-prefix="fas" data-icon="circle" role="img" xmlns="http://www.w3.org/2000/svg" viewBox="0 0 512 512" data-fa-i2svg=""><path fill="currentColor" d="M256 8C119 8 8 119 8 256s111 248 248 248 248-111 248-248S393 8 256 8z"></path></svg></span></td>
                                 <td><?=$row['spotlight_ad_days'];?></td>
                                 
                                 <td><?=$row['payment_method'];?></td>
                                 <td><?=$row['ref_number'] == "NULL" ? "-" : $row['ref_number'];?></td>
                                 <td>
                                     <?php if($row['is_active'] == "1"): ?>
                                     <button class="btn btn-sm btn-success" id="approval" data-id="<?=$row['highlight_id'];?>" data-status="<?=$row['is_active'];?>"><i class="fa fa-check-square-o"></i> Approved</button>
                                     <?php else: ?>
                                      <button class="btn btn-sm btn-warning" id="approval" data-id="<?=$row['highlight_id'];?>" data-status="<?=$row['is_active'];?>"><i class="fa fa-exclamation-circle"></i> Pending</button>
                                      <?php endif; ?>
                                  </td>
                             </tr>
                            <?php endforeach; ?>
                            <?php else:?>
                              <tr> <h2>Data Not Found</h2> </tr>
                            <?php endif;?>
                        </tbody>
                    </table>
                    </div>
                </div>


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
        
        jQuery('#promoted-table').DataTable({
            "order": [[ 0, "desc" ]]
        });
    });
    
    $(document).ready(function () {
        
$(document).on('click', '#approval', function (event) {
    event.preventDefault();
    var id = $(this).attr('data-id').toString();
    var status = $(this).attr('data-status').toString() === "1" ? "0" : "1";
    
  $.ajax({											
         type: "POST",
         cache: false,
         dataType: "json",
         data: {action_id:id, status:status},
         url:  "https://www.siyaluma.lk/php/api.php",
         success: function(response){
             if(response.message === "success"){
                     window.location.reload();
             }
         }
    });

});
    });
</script>
</body>

</html>

