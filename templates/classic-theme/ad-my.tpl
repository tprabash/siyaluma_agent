{OVERALL_HEADER}<!-- myads-page -->
<section id="main" class="clearfix myads-page">
    <div class="container">
        <div class="breadcrumb-section"><!-- breadcrumb -->
            <ol class="breadcrumb">
                <li><a href="{LINK_INDEX}"><i class="fa fa-home"></i> {LANG_HOME}</a></li>
                <li class="active">{LANG_MY-ADS}</li>
                <div class="pull-right back-result"><a href="{LINK_LISTING}"><i class="fa fa-angle-double-left"></i>
                    {LANG_BACK-RESULT}</a>
                </div>
            </ol>
            <!-- breadcrumb -->
        </div>
        <!-- Main Content -->
        <div class="ads-info">
            <div class="row"><!-- Page-Sidebar -->
                <aside class="col-sm-3 page-sidebar hidden-xs hidden-sm">
                    <div class="section">
                        <div class="user-panel-sidebar">
                            <div class="collapse-box">
                                <h5 class="collapse-title no-border"> {LANG_MY-CLASSIFIED} <a class="pull-right"
                                                                                              data-toggle="collapse"
                                                                                              href="#MyClassified"><i
                                        class="fa fa-angle-down"></i></a></h5>

                                <div id="MyClassified" class="panel-collapse collapse in">
                                    <ul class="acc-list">
                                        <li><a href="{LINK_DASHBOARD}" class="waves-effect"><i class="fa fa-home"></i>
                                            {LANG_DASHBOARD} </a></li>
                                        <li><a href="{LINK_PROFILE}/{USERNAME}" class="waves-effect"><i
                                                class="fa fa-user"></i> {LANG_PROFILE-PUBLIC}</a></li>
                                        <li><a href="{LINK_POST-AD}" class="waves-effect"><i class="fa fa-pencil"></i>
                                            {LANG_POST-AD}</a></li>
                                        <li><a href="{LINK_MEMBERSHIP}" class="waves-effect"><i
                                                        class="fa fa-shopping-bag"></i> {LANG_MEMBERSHIP} </a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="collapse-box">
                                <h5 class="collapse-title"> {LANG_MY-ADS} <a class="pull-right" data-toggle="collapse"
                                                                             href="#MyAds"><i
                                        class="fa fa-angle-down"></i></a></h5>

                                <div id="MyAds" class="panel-collapse collapse in">
                                    <ul class="acc-list">
                                        <li class="active"><a href="{LINK_MYADS}" class="waves-effect"><i class="fa fa-book"></i> {LANG_MY-ADS} <span class="badge">{MYADS}</span></a></li>
                                        <li><a href="{LINK_FAVADS}" class="waves-effect"><i class="fa fa-heart"></i>{LANG_FAVOURITE-ADS} <span class="badge">{FAVORITEADS}</span> </a></li>
                                        <li><a href="{LINK_PENDINGADS}" class="waves-effect"><i class="fa fa-info-circle"></i> {LANG_PENDING-ADS}<span class="badge">{PENDINGADS}</span></a></li>
                                        <li><a href="{LINK_HIDDENADS}" class="waves-effect"><i class="fa fa-eye-slash"></i> {LANG_HIDDEN-ADS} <span class="badge">{HIDDENADS}</span></a></li>
                                        <li><a href="{LINK_RESUBMITADS}" class="waves-effect"><i class="fa fa-briefcase"></i> {LANG_RESUBMITED-ADS} <span class="badge">{RESUBMITADS}</span></a></li>
                                    </ul>
                                </div>
                            </div>
                            <div class="collapse-box">
                                <h5 class="collapse-title no-border"> {LANG_MY-ACCOUNT} <a class="pull-right"
                                                                                           data-toggle="collapse"
                                                                                           href="#account"><i
                                        class="fa fa-angle-down"></i></a></h5>

                                <div id="account" class="panel-collapse collapse in">
                                    <ul class="acc-list">
                                        <li><a href="{LINK_TRANSACTION}" class="waves-effect"><i
                                                class="fa fa-money"></i> {LANG_TRANSACTION}</a></li>
                                        <li><a href="{LINK_ACCOUNT_SETTING}" class="waves-effect"><i
                                                class="fa fa-cog"></i> {LANG_ACCOUNT-SETTING} </a></li>
                                        <li><a href="{LINK_LOGOUT}" class="waves-effect"><i class="fa fa-unlock"></i>
                                            {LANG_LOGOUT} </a></li>
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </aside>
                <!-- # End Page-Sidebar --><!-- Page-Content -->
                <div class="col-sm-9 page-content">
                    <div class="my-quickad section">

                        <h2>{LANG_MY-ADS}</h2>
                        IF("{ISPHONEEXIST}"==""){
                           <div class="alert alert-danger" role="alert">
                              <i class="fa fa-info-circle"></i> Please complete your profile with phone number.
                           </div>
                        {:IF}
                        
                        <table id="js-table-list" class="manage-table responsive-table">
                          
                            <tbody>
                            <tr>
                                <th><i class="fa fa-file-text"></i> {LANG_ITEM-DETAILS}</th>
                                <th class="item-status row-hidden"><i class="fa fa-bell"></i> {LANG_STATUS}</th>
                                <th><i class="fa fa-cog"></i> {LANG_OPTION}</th>
                            </tr>
                            
                            
                            {LOOP: ITEM}
                            
                                                       <td class="title-container">
                                                           
                                                        
                                                           <img
                                    src="{SITE_URL}storage/products/thumb/{ITEM.picture}" alt=""
                                    style="max-height: 200px">

                                <div class="item-title">
                                    <h4><a href="{ITEM.link}">{ITEM.product_name}</a>
                                        <label class="label-wrap hidden-sm hidden-xs">
                                            IF("{ITEM.featured}"=="1"){ <div class="label featured"> {LANG_FEATURED}</div> {:IF}
                                            IF("{ITEM.urgent}"=="1"){ <div class="label urgent"> {LANG_URGENT}</div> {:IF}
                                            IF("{ITEM.highlight}"=="1"){ <div class="label highlight"> {LANG_HIGHLIGHT}</div> {:IF}
                                        </label>
                                    </h4>
                                    <ol class="breadcrumb">
                                        <li><a href="{ITEM.catlink}">{ITEM.category}</a></li>
                                        <li><a href="{ITEM.subcatlink}">{ITEM.sub_category}</a></li>
                                    </ol>
                                    <ul class="item-details">
                                        <li><i class="fa fa-map-marker"></i><a href="{ITEM.citylink}">{ITEM.location}</a></li>
                                        <li><i class="fa fa-clock-o"></i>{ITEM.created_at}</li>
                                        <li><i class="fa fa-calendar-times-o"></i>{LANG_EXPIRY_DATE}: {ITEM.expire_date}</li>
                                    </ul>
                                    IF("{ITEM.price}"!="0"){ <span class="table-item-price"> {ITEM.price} </span></div> {:IF}
                            </td>
                            <td class="item-status row-hidden" width="12%">
                                IF("{ITEM.status}"=="active"){ <span class="label label-success">{ITEM.status}</span>{:IF}
                                IF("{ITEM.status}"=="pending"){ <span class="label label-warning">{ITEM.status}</span> {:IF}
                                IF("{ITEM.status}"=="rejected"){ <span class="label label-danger">{ITEM.status}</span> {:IF}
                                IF("{ITEM.status}"=="expire"){ <span class="label label-danger">{ITEM.status}</span> {:IF}
                                IF("{ITEM.hide}"=="1"){ <span class="label label-info label-hidden">{LANG_HIDDEN}</span>{:IF}
                             <?php 
                                $myArray = explode(',', "{ITEM.ad_network_link}");
                               if(count($myArray) > 0){
                                 foreach($myArray as $data){
                                      if(is_ikman($data)){
                                         echo '<a href="'.$data.'"target="_blank" class="label label-info">View ad on ikman.lk</a></br>';
                                      }
                                      if(is_patpat($data)){
                                         echo '<a href="'.$data.'"target="_blank" class="label label-info">View ad on patpat.lk</a></br>';
                                      }
                                      if(is_hitad($data)){
                                         echo '<a href="'.$data.'"target="_blank" class="label label-info">View ad on hitad.lk</a></br>';
                                      }                                                                         
                                      if(is_carmudi($data)){
                                         echo '<a href="'.$data.'"target="_blank" class="label label-info">View ad on carmudi.lk</a></br>';
                                      }
                                      if(is_riyasewana($data)){
                                         echo '<a href="'.$data.'"target="_blank" class="label label-info">View ad on riyasewana.com</a></br>';
                                      }  
                                      if(is_sambole($data)){
                                         echo '<a href="'.$data.'"target="_blank" class="label label-info">View ad on sambole.lk</a></br>';
                                      }
                                      if(is_siyaluma($data)){
                                         echo '<a href="'.$data.'"target="_blank" class="label label-info">View ad on siyaluma.lk</a></br>';
                                      }
                                      if(is_geyakidamak($data)){
                                        echo '<a href="'.$data.'"target="_blank" class="label label-info">View ad on geyakidamak.com</a></br>';
                                      }
                                      if(is_ikmanata($data)){
                                        echo '<a href="'.$data.'"target="_blank" class="label label-info">View ad on Ikmanata.lk</a></br>';
                                      }
                                      if(is_myoffers($data)){
                                        echo '<a href="'.$data.'"target="_blank" class="label label-info">View ad on myoffers.lk</a></br>';
                                      }
                                      if(is_careka($data)){
                                        echo '<a href="'.$data.'"target="_blank" class="label label-info">View ad on careka.lk</a></br>';
                                      }
                                      if(is_promo($data)){
                                        echo '<a href="'.$data.'"target="_blank" class="label label-info">View ad on promo.lk</a></br>';
                                      }
                                      if(is_smartmarket($data)){
                                        echo '<a href="'.$data.'"target="_blank" class="label label-info">View ad on smartmarket.lk</a></br>';
                                      }
                                  }
                                }
                             ?>
                
                            </td>
                            <td class="action" width="12%">
                             <!--<span id="promote_trigger"   data-id="{ITEM.id}"  data-maincat="{ITEM.cat_id}" data-cat="{ITEM.sub_cat_id}" class="btn btn-outline"><i class="fa fa-arrow-up"></i> Promote</span>-->

                            <?php
                                 $date_now = date("Y-m-d");
                                
                                if ($date_now > "{ITEM.promoted_date}") {
                                    echo '';
                                }else{
                                   echo '<div class="well promotead">  <i class="fa  fa-check-square-o"></i> Promoted</div>';
                                }
                            ?>

                               IF("{ITEM.is_top_ad}"== "1"){
                                <span class="label label-danger">Top Ad</span>
                               {:IF}
                               IF("{ITEM.is_bump_ad}"== "1"){
                                <span class="label label-warning">Bump Ad</span>
                               {:IF}
                               
                               IF("{ITEM.is_top_ad}"== "1"){
                                <span class="label label-danger">Top Ad</span>
                               {:IF}
                               IF("{ITEM.is_spotlight_ad}"== "1"){
                                <span class="label label-warning">Spotlight Ad</span>
                               {:IF}
                                <a href="{LINK_EDIT-AD}/{ITEM.id}"><i class="fa fa-pencil"></i> {LANG_EDIT}</a>
                                <a class="item-js-hide" href="#" data-id="{ITEM.id}" data-ajax-action="hideItem">
                                    IF("{ITEM.hide}"=="0"){ <i class="fa  fa-eye-slash"></i> Delete {:IF}
                                    IF("{ITEM.hide}"=="1"){ <i class="fa  fa-eye"></i> Delete {:IF}</a>
                                    
                                <div class="show-on-mobile">
                                    IF("{ITEM.status}"=="active"){ <span class="label label-success">{ITEM.status}</span><br>{:IF}
                                    IF("{ITEM.status}"=="pending"){ <span class="label label-warning">{ITEM.status}</span> <br>{:IF}
                                    IF("{ITEM.status}"=="rejected"){ <span class="label label-danger">{ITEM.status}</span> <br>{:IF}
                                    IF("{ITEM.status}"=="expire"){ <span class="label label-danger">{ITEM.status}</span><br> {:IF}
                                    IF("{ITEM.hide}"=="1"){ <span class="label label-info label-hidden">{LANG_HIDDEN}</span><br>{:IF}     
                            <?php 
                                $myArray = explode(',', "{ITEM.ad_network_link}");
                               if(count($myArray) > 0){
                                     echo '<div class="list">';
                                 foreach($myArray as $data){
                                      if(is_ikman($data)){
                                         echo '<a href="'.$data.'"target="_blank" class="list-item">ikman.lk</a>';
                                      }
                                      if(is_patpat($data)){
                                         echo '<a href="'.$data.'"target="_blank" class="list-item">patpat.lk</a>';
                                      }
                                      if(is_hitad($data)){
                                         echo '<a href="'.$data.'"target="_blank" class="list-item">hitad.lk</a>';
                                      }                                                                         
                                      if(is_carmudi($data)){
                                         echo '<a href="'.$data.'"target="_blank" class="list-item">carmudi.lk</a>';
                                      }
                                      if(is_riyasewana($data)){
                                         echo '<a href="'.$data.'"target="_blank" class="list-item">riyasewana.com</a>';
                                      }  
                                      if(is_sambole($data)){
                                         echo '<a href="'.$data.'"target="_blank" class="list-item">sambole.lk</a>';
                                      }
                                      if(is_siyaluma($data)){
                                         echo '<a href="'.$data.'"target="_blank" class="list-group-item">siyaluma.lk</a>';
                                      }
                                      if(is_geyakidamak($data)){
                                        echo '<a href="'.$data.'"target="_blank" class="list-item">geyakidamak.com</a>';
                                      }
                                      if(is_ikmanata($data)){
                                        echo '<a href="'.$data.'"target="_blank" class="list-item">Ikmanata.lk</a>';
                                      }
                                      if(is_myoffers($data)){
                                        echo '<a href="'.$data.'"target="_blank" class="list-item">myoffers.lk</a>';
                                      }
                                      if(is_careka($data)){
                                        echo '<a href="'.$data.'"target="_blank" class="list-item">careka.lk</a>';
                                      }
                                      if(is_promo($data)){
                                        echo '<a href="'.$data.'"target="_blank" class="list-item">promo.lk</a>';
                                      }
                                      if(is_smartmarket($data)){
                                        echo '<a href="'.$data.'"target="_blank" class="list-item">smartmarket.lk</a>';
                                      }
                                  }
                                  echo '</div>';
                                }
                             ?>
                                </div>
                               

                            </td>
                            </tr>
                            {/LOOP: ITEM}
                            </tbody>
                        </table>

                        <!-- Pagination-->
                        <div class="pagination-container">
                            <div class="mt30 clearfix">
                                <ul class="pagination pull-right">
                                    {LOOP: PAGES}
                                    IF("{PAGES.current}"=="0"){
                                    <li><a href="{PAGES.link}">{PAGES.title}</a></li>
                                    {:IF}
                                    IF("{PAGES.current}"=="1"){
                                    <li class="active"><a>{PAGES.title}</a></li>
                                    {:IF}
                                    {/LOOP: PAGES}
                                </ul>
                            </div>
                        </div>
                        <!-- Pagination-->
                    </div>
                </div>
                <!-- # End Page-Content -->
                                                                         <!--Modal-->
                        <div id="promote_modal" class="modal fade" role="dialog" style="z-index: 1040; display: none;">
                            <div class="modal-dialog"><!-- Modal content-->
                                <div class="modal-content">
                                    <div class="modal-header">
                                        <button type="button" class="close" data-dismiss="modal">×</button>
                                        <h4 class="modal-title">Make your ad stand out! </h4>
                                    </div>
                                    <div class="modal-body">
                                        <div class="alert alert-success" id="email_success" style="display: none">
                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                            Thank you for using our site. Your mail successfully sent to seller.
                                        </div>
                                        <div class="alert alert-danger" id="email_error" style="display: none">
                                            <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                                            Error: Please try again.
                                        </div>
                                            <div class="row">
                                            	     <form id="payment-form" method="POST">
							                         <div class="col-md-6">
    						                            <div class="ad-option-container" id="top-ad-toggler">
    							                            <input type="checkbox" id="topadTrigger"> Top Ad</br>
    							                            <small>Get up to 10 times or more views by displaying your ad at the top! </small>
    							                         </div>
    							                           <ul class="list-group" id="topAdHiddenForm">
                                                              <li class="list-group-item">
                                                                  <div class="radio">
                                                                    <input type="radio" name="groupTopAd" id="top-ad-days-3"  value="3">
                                                                    <label for="top-ad-days-3">
			                                                           	3 days
				                                                        <span class="pr20  customer-amout" id="top-ad-days-3-price"></span>
				                                                        <span class="agent-amout" id="top-ad-days-3-price-agent"></span>
				                                                       </label>
                                                                   </div>
                                                               </li>
                                                              <li class="list-group-item">
                                                                  <div class="radio">
                                                                      <input type="radio" name="groupTopAd" id="top-ad-days-7"  value="7"> 
                                                                       <label for="top-ad-days-7">
			                                                           	7 days
			                                                           	 <span class="pr20 customer-amout" id="top-ad-days-7-price"></span>
			                                                           	  <span class="agent-amout" id="top-ad-days-7-price-agent"></span>
			                                                           	 </label>
				                                                       </label>
				                                                  </div>
                                                              </li>
                                                              <li class="list-group-item">
                                                                  <div class="radio">
                                                                     <input type="radio" name="groupTopAd" id="top-ad-days-15"  value="15">
                                                                       <label for="top-ad-days-15">
			                                                           	15 days 
			                                                           	<span class="pr20 customer-amout" id="top-ad-days-15-price"></span>
			                                                           	 <span class="agent-amout" id="top-ad-days-15-price-agent"></span>
				                                                       </label>
                                                                   </div>
                                                              </li>
                                                            </ul>
							                         </div>
							                         <div class="col-md-6">
							                              <div class="ad-option-container" id="bump-ad-toggler">
							                                <input type="checkbox" id="bumpUpTrigger"> Daily Bump Up </br>
							                                <small>Get a fresh start every day and gain up to 5 times or more views!</small>
							                              </div>
							                           <ul class="list-group" id="bumpUpHiddenForm">
                                                          <li class="list-group-item">
                                                              <div class="radio">
                                                                 <input type="radio" name="groupBumpUp" id="bump-up-days-3"  value="3"> 
                                                                 <label for="bump-up-days-3">
			                                                      3 days
			                                                      		  <span class="pr20 customer-amout" id="bump-up-days-3-price"></span>
			                                                           	  <span class="agent-amout" id="bump-up-days-3-price-agent"></span>
				                                                  </label>
                                                              </div>
                                                          </li>
                                                          <li class="list-group-item">
                                                              <div class="radio">
                                                                <input type="radio" name="groupBumpUp" id="bump-up-days-7"  value="7">
                                                                 <label for="bump-up-days-7">
			                                                      7 days 
			                                                      		  <span class="pr20 customer-amout" id="bump-up-days-7-price"></span>
			                                                           	  <span class="agent-amout" id="bump-up-days-7-price-agent"></span>
				                                                  </label>                                                                
                                                               </div>
                                                          </li>
                                                          <li class="list-group-item">
                                                              <div class="radio">
                                                                <input type="radio" name="groupBumpUp" id="bump-up-days-15"  value="15">
                                                                <label for="bump-up-days-15">
			                                                      15 days 
			                                                      		  <span class="pr20 customer-amout" id="bump-up-days-15-price"></span>
			                                                           	  <span class="agent-amout" id="bump-up-days-15-price-agent"></span>
				                                                  </label>  
                                                              </div>
                                                          </li>
                                                        </ul>
							                         </div>
							                         <!--Urgent-->
							                         <div class="col-md-6" style="margin-top:20px">
							                              <div class="ad-option-container" id="urgent-ad-toggler">
							                                <input type="checkbox" id="urgentTrigger"> Urgent </br>
							                                <small>Stand out from the rest by showing a bright red marker on the ad!</small>
							                              </div>
							                           <ul class="list-group" id="urgentHiddenForm">
                                                          <li class="list-group-item">
                                                              <div class="radio">
                                                                 <input type="radio" name="groupUrgent" id="urgent-days-3"  value="3"> 
                                                                 <label for="urgent-days-3">
			                                                      3 days
			                                                      		  <span class="pr20 customer-amout" id="urgent-days-3-price"></span>
			                                                           	  <span class="agent-amout" id="urgent-days-3-price-agent"></span>
				                                                  </label>
                                                              </div>
                                                          </li>
                                                          <li class="list-group-item">
                                                              <div class="radio">
                                                                <input type="radio" name="groupUrgent" id="urgent-days-7"  value="7">
                                                                 <label for="urgent-days-7">
			                                                      7 days 
			                                                      		  <span class="pr20 customer-amout" id="urgent-days-7-price"></span>
			                                                           	  <span class="agent-amout" id="urgent-days-7-price-agent"></span>
				                                                  </label>                                                                
                                                               </div>
                                                          </li>
                                                          <li class="list-group-item">
                                                              <div class="radio">
                                                                <input type="radio" name="groupUrgent" id="urgent-days-15"  value="15">
                                                                <label for="urgent-days-15">
			                                                      15 days 
			                                                      		  <span class="pr20 customer-amout" id="urgent-days-15-price"></span>
			                                                           	  <span class="agent-amout" id="urgent-days-15-price-agent"></span>
				                                                  </label>  
                                                              </div>
                                                          </li>
                                                        </ul>
							                         </div>
							                         
							                        <!--Spotlight-->
							                         <div class="col-md-6" style="margin-top:20px">
							                              <div class="ad-option-container" id="spotlight-ad-toggler">
							                                <input type="checkbox" id="spotlightTrigger"> Spotlight </br>
							                                <small>Boost sales by showing your ad in this premium spot.</small>
							                              </div>
							                           <ul class="list-group" id="spotlightHiddenForm">
                                                          <li class="list-group-item">
                                                              <div class="radio">
                                                                 <input type="radio" name="groupSpotlight" id="spotlight-days-3"  value="3"> 
                                                                 <label for="spotlight-days-3">
			                                                      3 days
			                                                      		  <span class="pr20 customer-amout" id="spotlight-days-3-price"></span>
			                                                           	  <span class="agent-amout" id="spotlight-days-3-price-agent"></span>
				                                                  </label>
                                                              </div>
                                                          </li>
                                                          <li class="list-group-item">
                                                              <div class="radio">
                                                                <input type="radio" name="groupSpotlight" id="spotlight-days-7"  value="7">
                                                                 <label for="spotlight-days-7">
			                                                      7 days 
			                                                      		  <span class="pr20 customer-amout" id="spotlight-days-7-price"></span>
			                                                           	  <span class="agent-amout" id="spotlight-days-7-price-agent"></span>
				                                                  </label>                                                                
                                                               </div>
                                                          </li>
                                                          <li class="list-group-item">
                                                              <div class="radio">
                                                                <input type="radio" name="groupSpotlight" id="spotlight-days-15"  value="15">
                                                                <label for="spotlight-days-15">
			                                                      15 days 
			                                                      		  <span class="pr20 customer-amout" id="spotlight-days-15-price"></span>
			                                                           	  <span class="agent-amout" id="spotlight-days-15-price-agent"></span>
				                                                  </label>  
                                                              </div>
                                                          </li>
                                                        </ul>
							                         </div>
							                         
			                                         <div class="col-md-12">
			                                           <div class="form-group">
			                                                <label for="payment-method" class="control-label">Select Payment Method</label>
			                                               <select class="form-control" id="payment-method" name="payment-method">
                                                              <option value="boc">BOC</option>
                                                              <option value="sampath">Sampath</option>
                                                              <option value="ezcash">Ezcash</option>
                                                              <option value="mcash">Mcash</option>
                                                            </select>
                                                            
                                                               <div id="mcashcontainer">
                                                                <div class="panel panel-default">
                                                                  <div class="panel-body">
                                                                    Send mCash to 0702 766 94
                                                                  </div>
                                                                </div>
                                                               </div>
                                                               
                                                               <div id="ezcashcontainer">
                                                                <div class="panel panel-default">
                                                                  <div class="panel-body">
                                                                   Send eZcash to 0778 544 700 or 0770 877 232
                                                                  </div>
                                                                </div>
                                                               </div>
                                                               
                                                               <div id="sampathcontainer">
                                                                <div class="panel panel-default">
                                                                  <div class="panel-body">
                                                                    Sampath Bank
                                                                    Account Holder: Siyaluma Corporation (PVT)LTD
                                                                    Account No: 101014017663
                                                                    Branch: Matara
                                                                  </div>
                                                                </div>
                                                               </div>
                                                               
                                                               <div id="boccontainer">
                                                                <div class="panel panel-default">
                                                                  <div class="panel-body">
                                                                    BOC
                                                                    Account Holder: Siyaluma Corporation (PVT)LTD
                                                                    Account No: 84471330
                                                                    Branch: Hambantota
                                                                  </div>
                                                                </div>
                                                               </div>
                                                               
                                                        </div>
                                                        <label for="ezcash-number" class="control-label">Date</label>
                                                            <input type="text" name="date" id="date" data-large-mode="true" data-format="Y-m-d" class="form-control">
                                                       
                                                         <div class="form-group">
                                                            <label for="ezcash-number" class="control-label">Time</label>
                                                            <input type="text" name="time" id="time" class="form-control timepicker">
                                                        </div>
                                                        <div class="form-group">
                                                            <input type="hidden" id="ad_title" value="" name="ad_title"  class="hidden">
                                                            <input type="hidden" id="category_main" value="" name="category_main"  class="hidden">
                                                            <input type="hidden" id="category_sub" value="" name="category_sub"  class="hidden">
                                                            <input type="hidden" id="product_id" value="" name="product_id"  class="hidden">
                                                            <input type="hidden" id="network_link" value="" name="network_link"  class="hidden">
                                                        </div>
                                                        <div class="form-group" id="bank_form">
                                                            <label for="ref-number">Ref Number</label>
                                                            <input type="text" name="refnumber" id="refnumber" class="form-control">
                                                        </div>
                                                         <button type="submit" name="promote-btn" id="promote-btn" class="btn btn-outline"><i class="fa fa-check"></i> Promote</button>
			                                         </div>
			                                         </form>
						                         </div><!--row-->
						                       </div>
						                    </div><!--row-->
                           
                            </div>
                      </div>
                       <!--End Modal-->
                       
                       <script>
$(function() {

var topadcheckbox = $("#topadTrigger");
var urgentcheckbox = $("#urgentTrigger");
var bumpUpcheckbox = $("#bumpUpTrigger");
var topAdHiddenForm = $("#topAdHiddenForm");
var bumpUpHiddenForm = $("#bumpUpHiddenForm");
var urgentHiddenForm = $("#urgentHiddenForm");

var spotlightAdHiddenForm = $("#spotlightHiddenForm");
var spotlightcheckbox = $("#spotlightTrigger");

topAdHiddenForm.hide();
    
      
topadcheckbox.change(function() {
if (topadcheckbox.is(':checked')) {
  //hiddenForm.show();
   topAdHiddenForm.slideDown('slow');
   $("#top-ad-toggler").addClass("ad-option-selected");
} else {
 //hiddenForm.hide();
  topAdHiddenForm.slideUp('slow');
   $("#top-ad-toggler").removeClass("ad-option-selected");
}
});
    
bumpUpHiddenForm.hide();

bumpUpcheckbox.change(function() {
    if (bumpUpcheckbox.is(':checked')) {
        bumpUpHiddenForm.slideDown('slow');
        $("#bump-ad-toggler").addClass("ad-option-selected");
    }else{
       bumpUpHiddenForm.slideUp('slow');
      $("#bump-ad-toggler").removeClass("ad-option-selected");
    }
    
});


urgentHiddenForm.hide();

urgentcheckbox.change(function() {
    if (urgentcheckbox.is(':checked')) {
        urgentHiddenForm.slideDown('slow');
        $("#urgent-ad-toggler").addClass("ad-option-selected");
    }else{
        urgentHiddenForm.slideUp('slow');
      $("#urgent-ad-toggler").removeClass("ad-option-selected");
    }
    
});

spotlightAdHiddenForm.hide();

spotlightcheckbox.change(function() {
    if (spotlightcheckbox.is(':checked')) {
        spotlightAdHiddenForm.slideDown('slow');
        $("#spotlight-ad-toggler").addClass("ad-option-selected");
    }else{
        spotlightAdHiddenForm.slideUp('slow');
      $("#spotlight-ad-toggler").removeClass("ad-option-selected");
    }
    
});

});


//START OF PROMOTE AD  BLOCK
$(document).on('click', '#promote_trigger', function (event) {
    //event.preventDefault();
    var id = $(this).attr('data-id');
    var category_id = $(this).attr('data-cat');
    var main_category_id = $(this).attr('data-maincat');
    $.ajax({											
    type: "POST",
    data: {id: id, category_id : category_id},
    url:  "https://www.siyaluma.lk/php/api.php",
    success: function(response){
         $('#ad_title').val(response.data[0]['product_name']);
         $('#category_main').val(response.data[0]['cat_name']);
         $('#category_sub').val(response.data[0]['sub_cat_name']);
         $('#product_id').val(id);
         $('#network_link').val(response.data[0]['ad_network_link']);

         if(response.price != undefined){
             
              $('#top-ad-days-3-price').text(response.price[0].top.ikman.three);
              $('#top-ad-days-3-price-agent').text(response.price[1].top.agent.three);
              
              $('#top-ad-days-7-price').text(response.price[2].top.ikman.seven);
              $('#top-ad-days-7-price-agent').text(response.price[3].top.agent.seven);
               
              $('#top-ad-days-15-price').text(response.price[4].top.ikman.fifteen);
              $('#top-ad-days-15-price-agent').text(response.price[5].top.agent.fifteen);
              
              $('#bump-up-days-3-price').text(response.price[6].bump.ikman.three);
              $('#bump-up-days-3-price-agent').text(response.price[7].bump.agent.three);
                            
              $('#bump-up-days-7-price').text(response.price[8].bump.ikman.seven);
              $('#bump-up-days-7-price-agent').text(response.price[9].bump.agent.seven);
              
              $('#bump-up-days-15-price').text(response.price[10].bump.ikman.fifteen);
              $('#bump-up-days-15-price-agent').text(response.price[11].bump.agent.fifteen);

              $('#urgent-days-3-price').text(response.price[12].urgent.ikman.three);
              $('#urgent-days-3-price-agent').text(response.price[13].urgent.agent.three);
              
              $('#urgent-days-7-price').text(response.price[14].urgent.ikman.seven);
              $('#urgent-days-7-price-agent').text(response.price[15].urgent.agent.seven);
              
              $('#urgent-days-15-price').text(response.price[16].urgent.ikman.fifteen);
              $('#urgent-days-15-price-agent').text(response.price[17].urgent.agent.fifteen);
              
              $('#promote_modal').modal('show');
         }
        
    },
    error: function(xhr, status, error) {
        console.log(error);
    }    
        
    });
});

//END OF PROMOTE AD BLOCK

$( document ).ready(function() {
     $('#bank_form').css("display", "none");
     $('#ezcashcontainer').css("display", "none");
     $('#mcashcontainer').css("display", "none");
     $('#sampathcontainer').css("display", "none");
     $('#boccontainer').css("display", "none");
     if($('#payment-method').val() == 'boc'){
        $('#ezcashcontainer').css("display", "none");
        $('#mcashcontainer').css("display", "none");
        $('#sampathcontainer').css("display", "none");
        $('#boccontainer').css("display", "block");
        $('#bank_form').css("display", "none");         
     }
    $("#payment-method").change(function () {
        var selected_option = $('#payment-method').val();
    if (selected_option === 'ezcash') {
        $('#bank_form').css("display", "block");
        $('#ezcashcontainer').css("display", "block");
        $('#mcashcontainer').css("display", "none");
        $('#sampathcontainer').css("display", "none");
        $('#boccontainer').css("display", "none");
    }
    if (selected_option == 'boc') {
        $('#ezcashcontainer').css("display", "none");
        $('#mcashcontainer').css("display", "none");
        $('#sampathcontainer').css("display", "none");
        $('#boccontainer').css("display", "block");
        $('#bank_form').css("display", "none");
    }
    
    if (selected_option == 'sampath') {
        $('#ezcashcontainer').css("display", "none");
        $('#mcashcontainer').css("display", "none");
        $('#sampathcontainer').css("display", "block");
        $('#boccontainer').css("display", "none");
        $('#bank_form').css("display", "none");
    }
    
    if (selected_option === 'mcash') {
        $('#bank_form').css("display", "block");
        $('#mcashcontainer').css("display", "block");
        $('#ezcashcontainer').css("display", "none");
        $('#sampathcontainer').css("display", "none");
        $('#boccontainer').css("display", "none");
    }
   })

   $('#date').dateDropper();
   $('.timepicker').wickedpicker();
});
$(document).on('click', '#promote-btn', function (event) {
    event.preventDefault();
    if ($("#topadTrigger").is(':checked')) {
        var is_top_ad = "1";
        var top_ad_days = $('input[name=groupTopAd]:checked').val();
    }else{ 
        var is_top_ad = "0";
        var top_ad_days = "0";
        
    }
    
    if ($("#bumpUpTrigger").is(':checked')) {
        var is_bump_ad = "1";
        var bump_ad_days = $('input[name=groupBumpUp]:checked').val();
    }else{
        var is_bump_ad = "0";
        var bump_ad_days = "0";        
    }
    

    if ($("#urgentTrigger").is(':checked')) {
        var is_urgent_ad = "1";
        var urgent_ad_days  = $('input[name=groupUrgent]:checked').val();
    }else{
        var is_urgent_ad = "0";
        var urgent_ad_days = "0";        
    }

    if ($("#spotlightTrigger").is(':checked')) {
        var is_spotlight_ad = "1";
        var spotlight_ad_days  = $('input[name=groupSpotlight]:checked').val();
    }else{
        var is_spotlight_ad = "0";
        var spotlight_ad_days = "0";        
    }
        
       
    var payment_method = $('#payment-method').val();
    
    var payment_date = $('#date').val();
    
    var payment_time = $('#time').val();
    
    var ad_title =   $('#ad_title').val();
    
    var category_main = $('#category_main').val();
    
    var product_id = $('#product_id').val();
        
    var refnumber = $('#refnumber').val();
    
    var network_link = $('#network_link').val();
    
    
    if($('input[type=checkbox]:checked').length == 0){
         swal("Hold On!", "Please select at least one promotion method", "error")
    }else{
     $.ajax({										
            type: "POST",
            //async:true,
            cache: false,
            dataType: "json",
            data: {
                promote_ad: 'true',
                product_id: product_id, 
                ad_title: ad_title , 
                category_main:category_main,
                is_top_ad:is_top_ad,
                top_ad_days: top_ad_days,
                is_bump_ad : is_bump_ad,
                bump_ad_days : bump_ad_days,
                is_urgent_ad : is_urgent_ad,
                urgent_ad_days : urgent_ad_days,  
                is_spotlight_ad : is_spotlight_ad,
                spotlight_ad_days : spotlight_ad_days, 
                payment_method: payment_method,
                payment_date : payment_date,
                payment_time : payment_time,
                refnumber : refnumber,
                network_link : network_link
            },
            url:  "https://www.siyaluma.lk/php/api.php",
            success: function(response){
                console.log(response);
                if(response.message === "success"){
                    $('#payment-form')[0].reset();
                    $('#promote_modal').modal('hide');
                    swal("Good job!", "Your ad has been promoted.", "success")
                }
                 if(response.message === "error"){
                     swal("Hold On!", "Please select ad duration", "error")
                 }
            },
            error: function(xhr, status, error) {
                console.log(error);
            }
        });
    }

});



                      </script>
            </div>
            <!-- row -->
        </div>
        <!-- row -->
    </div>
    <!-- container -->
</section>
<!-- myads-page -->
{OVERALL_FOOTER}