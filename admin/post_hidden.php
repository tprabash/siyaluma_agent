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
                <h4>Hidden Ads</h4>
            </div>
            <div class="card-block">
                <div id="js-table-list">
                    <table class="table table-vcenter table-hover">
                        <thead>
                        <tr>
                            <th><i class="ion-image"></i> #</th>
                            <th><i class="ion-image"></i> Title</th>
                            <th class="hidden-xs w-30">link</th>
                            <th class="hidden-xs hidden-sm" style="width:100px">Posted</th>
                            <th class="hidden-xs hidden-sm" style="width:100px">Action</th>
                        </tr>
                        </thead>
                        <tbody>
                            <?php
                                $sql = "SELECT p.*,u.group_id,g.show_on_home,
                                    c.name as cityname,
                                    cat.cat_id as catid,
                                    cat.cat_name as catname,
                                    cat.slug as catslug,
                                    scat.sub_cat_id as subcatid,
                                    scat.sub_cat_name as subcatname,
                                    scat.slug as subcatslug,
                                    highlight.is_active as is_promoted
                                    FROM `".$config['db']['pre']."product` as p
                                    INNER JOIN `".$config['db']['pre']."user` as u ON u.id = p.user_id
                                    INNER JOIN `".$config['db']['pre']."usergroups` as g ON g.group_id = u.group_id
                                    LEFT JOIN `".$config['db']['pre']."highlight` as highlight ON highlight.product_id = p.id
                                    LEFT JOIN `".$config['db']['pre']."cities` as c ON c.id = p.city
                                    LEFT JOIN `".$config['db']['pre']."catagory_main` as cat ON cat.cat_id = p.category
                                    LEFT JOIN `".$config['db']['pre']."catagory_sub` as scat ON scat.sub_cat_id = p.sub_category
                                    WHERE p.hide = '1' ORDER BY p.updated_at DESC";
                                    
                              $result = mysqli_query($mysqli, $sql) or die("database error:". mysqli_error($mysqli));
                            ?>
                             <?php foreach($result as $row): ?>
                              <tr>
                                  <td><?=$row['id'];?></td>
                                  <td><?=$row['product_name'];?></td>
                                  <th><?= $row['ad_network_link'];?></th>
                                  <th><?=timeAgo($row['created_at']);?></th>
                                  <th><a href="#" class="btn btn-xs btn-danger" data-id="<?=$row['id'];?>" id="deleteHidden">Delete</a></th>
                              </tr>
                             <?php endforeach; ?>

                        </tbody>
                    </table>
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


<!-- Site Action -->
<div class="site-action">
    <button type="button" class="site-action-toggle btn-raised btn btn-warning btn-floating" style="visibility: hidden;">
        <i class="back-icon ion-android-close animation-scale-up" aria-hidden="true"></i>
    </button>
    <div class="site-action-buttons">
        <button type="button" data-ajax-response="deletemarked" data-ajax-action="deleteads"
                class="btn-raised btn btn-danger btn-floating animation-slide-bottom">
            <i class="icon ion-android-delete" aria-hidden="true"></i>
        </button>
    </div>
</div>
<!-- End Site Action -->

<?php include("footer.php"); ?>

<script>
    $(function(){
      $('.table').DataTable({
          "ordering": false
      });
    });
    
    $(document).on('click', '#deleteHidden', function (event) {
         var hiddenDelete = $(this).attr('data-id');
       swal({
            title: "Are you sure?",
            text: "You want to delete this ad?",
            type: "warning",
            showCancelButton: true,
            confirmButtonColor: "#f44336",
            confirmButtonText: "Yes, Delete it!",
            cancelButtonText: "No, cancel plz!",
            closeOnConfirm: false,
            closeOnCancel: false
        }, function(isConfirm){
            if (isConfirm) {
                $.ajax({											
                   type: "POST",
                   dataType: "json",
                   data: {hiddenDelete: hiddenDelete},
                   url:  "https://www.siyaluma.lk/php/api.php",
                   success: function(response){
                      if(response.message == "success"){
                          alertify.success("Done! Ad has been deleted.");
                          swal.close();
                          location.reload();
                      }
                  }
                });
    
            } else {
                swal("Cancelled", "This Ad is safe :)", "error");
            }
        });
        
    });
</script>
</body>

</html>


