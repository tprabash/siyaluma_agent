{OVERALL_HEADER}
 <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/test.css">
   <div class="container  denwim_container" style="background:#fff;border-radius:7px;">
		<div class="row my_slider_sect in_ads">
		     <form method="get" action="{SITE_URL}listing" name="locationForm" id="ListingForm">


			
			<div class="col-lg-3 col-md-6 col-sm-6 mob-margin-bottom-10 p-2 ">
				<div class="form-group-group">
                    <input type="hidden" name="placetype" id="searchPlaceType" value="">
                    <input type="hidden" name="placeid" id="searchPlaceId" value="">
					<input type="text" class="form-control" placeholder="{LANG_WHERE} ?" id="searchStateCity" name="location">
					
				</div>
			</div>
			
			<div class="col-lg-4 col-md-6 col-sm-6 mb-sm-2 p-2">
			   	<div class="form-group-group">
			   	    <input type="text" class="form-control" name="keywords" id="keywords" placeholder="{LANG_WHAT} ?" autocomplete="off" data-prev-value="0">
			   	</div>
			</div>
			
			<div class="col-lg-2 col-md-6 col-sm-6 mb-sm-2 p-2">

				<button type="submit" id="submit" name="submit" class="btn btn-primary btn-lg btn-block"><i class="fa fa-search"></i> Search</button>
			</div>
			</form>
		</div>
		<div class="row">
	        <section class="categories__block">
               <div class="categories__container point1">
                 <div class="category_slider d-flex owl-hidden">
                     {LOOP: CAT}
                        <div class="item {CAT.linkstatus} col-4 col-sm-3 col-md-2 col-lg-1">
                            <a href="{CAT.catlink}" class="categories__link text-center" id="cameras">
                              <i class="{CAT.icon}"></i>
                              {CAT.main_title}
                            </a>
                        </div>
                    {/LOOP: CAT}
                </div>
               </div>
            </section>
		</div>
		
		
		<div class="mobile-filer text-center">
			<a class="show-mob-filter" href="javascript:void(0)">Show Filters</a>
			<div class="mobile-filter-content" style="display:none;">
			    <div class="row">
			        <div class="col-md-12">
			             <form method="get" action="{SITE_URL}listing" name="locationForm" id="ListingForm">
                                <div class="inner">
                                    <div class="form-group">
                                        <label class="label-title">{LANG_PRICE}</label>
                                        <div class="range-widget">
                                            <div class="range-inputs">
                                                <input type="text" placeholder="From" name="range1" value="From">
                                                <input type="text" placeholder="To" name="range2" value="To">
                                            </div>
                                            <button type="submit"><i class="fa fa-search"></i></button>
                                        </div>
                                    </div>
                                </div>
                                <button type="submit" name="Submit" class="btn btn-lg btn-primary" id="advance-search-btn">{LANG_ADVANCE-SEARCH}</button>
			             </form>
			        </div>
			    </div>
			</div>
			<script>
				$(document).on('click','.show-mob-filter',function(){
					$(".mobile-filter-content").toggle();
				});
			</script>
		</div>
			
		<div class="row silde_bar">
			<div class="col-md-3 border-1-drop-right  hidden-sm  hidden-xs  filter_family" style="padding-left:15px;padding-right:15px;border-bottom:none!important;">
				<div class="col-md-12">
					<div class="cross_or">
						<span class="hrline" style="font-size:13px;">Sortby</span>
					</div>
				</div>
				<div class="form-group sort_area">
					<select class="form-control" id="sort_by">
						<option value="?keywords=&location=&placetype=&placeid=&cat=&subcat=&filter=&sort=id&order=desc&range1=&range2=">Date: Newest on Top</option>
						<option value="?keywords=&location=&placetype=&placeid=&cat=&subcat=&filter=&sort=title&order=desc&range1=&range2=">Name: Name on Top</option>
						<option value="?keywords=&location=&placetype=&placeid=&cat=&subcat=&filter=&sort=date&order=desc&range1=&range2=">Date: Date  on Top</option>
						<option value="?keywords=&location=&placetype=&placeid=&cat=&subcat=&filter=&sort=price&order=desc&range1=&range2=">Price: Low to High</option>
						<option value="?keywords=&location=&placetype=&placeid=&cat=&subcat=&filter=&sort=price&order=asc&range1=&range2=">Price: High to Low</option>
						
					</select>
					<script>
					$(document).on('change','#sort_by',function(){
						location.href="https://siyaluma.lk/listing/"+$(this).val();
					})
					</script>
				</div>
			
				<div class="col-md-12 cat_list_on_ads" role="tablist">
					<a href="#col_cat" data-toggle="collapse" class="text-dec-none make_me_ud"><div class="cross_or2 updown1">
						Category
						<div class="pull-right ud">
						<i class="fa fa-chevron-down"></i>
						</div>
					</div>
					</a>
					<div id="col_cat" class="collapse in" role="tabpanel">
					<ul>
						{CATEGORY_SIDE}
					</ul>
					</div>
				</div>
				<div class="col-md-12 cat_list_on_ads">
					<a href="#loc_cat" data-toggle="collapse" class="text-dec-none make_me_ud" data-tar="2"><div class="cross_or2 updown2">
						Location
						<div class="pull-right ud">
						<i class="fa fa-chevron-down"></i>
						</div>
					</div></a>
					<div id="loc_cat" class="collapse in" role="tabpanel">
					       IF("{LOCATION_VISIBILITY}" != "1"){ 
			            	<ul class="action-list"> 
                                <li class="action-item">
                   	            <a  href="{SITE_URL}listing?keywords=&location=Colombo%2C+Region&placetype=state&placeid=LK.1&cat={CATID}&subcat={SUBCATID}&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                    Colombo</a></br>
                                </li>
                                <li class="action-item">
                    	        <a  href="{SITE_URL}listing?keywords=&location=Kandy%2C+Region&placetype=state&placeid=LK.2&cat={CATID}&subcat={SUBCATID}&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                Kandy</a></br>
                                </li>
                                <li class="action-item">
                    	        <a  href="{SITE_URL}listing?keywords=&location=Galle%2C+Region&placetype=state&placeid=LK.3&cat={CATID}&subcat={SUBCATID}&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                  Galle</a></br>
                                </li>
                                <li class="action-item">
                                <a  href="{SITE_URL}listing?keywords=&location=Ampara%2C+Region&placetype=state&placeid=LK.4&cat={CATID}&subcat={SUBCATID}&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                 Ampara</a></br>
                                </li>
                                <li class="action-item">
                                <a  href="{SITE_URL}listing?keywords=&location=Anuradhapura%2C+Region&placetype=state&placeid=LK.6&cat={CATID}&subcat={SUBCATID}&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                  Anuradhapura</a></br>
                                </li>
                                <li class="action-item">  
                                <a  href="{SITE_URL}listing?keywords=&location=Badulla%2C+Region&placetype=state&placeid=LK.9&cat={CATID}&subcat={SUBCATID}&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                    Badulla</a></br>
                                </li>
                                <li class="action-item">    
                                <a  href="{SITE_URL}listing?keywords=&location=Batticaloa%2C+Region&placetype=state&placeid=LK.25&cat={CATID}&subcat={SUBCATID}&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                   Batticaloa</a></br>
                                </li>
                                <li class="action-item">   
                                <a  href="{SITE_URL}listing?keywords=&location=Gampaha%2C+Region&placetype=state&placeid=LK.24&cat={CATID}&subcat={SUBCATID}&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                  Gampaha</a></br>
                                </li>
                                <li class="action-item">  
                                <a  href="{SITE_URL}listing?keywords=&location=Hambantota%2C+Region&placetype=state&placeid=LK.23&cat={CATID}&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                  Hambantota</a></br>
                                </li>
                                <li class="action-item">  
                                <a  href="{SITE_URL}listing?keywords=&location=Jaffna%2C+Region&placetype=state&placeid=LK.22&cat={CATID}&subcat={SUBCATID}&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                  Jaffna</a></br>
                                </li>
                                <li class="action-item">  
                                <a  href="{SITE_URL}listing?keywords=&location=Kalutara%2C+Region&placetype=state&placeid=LK.21&cat={CATID}&subcat={SUBCATID}&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                  Kalutara</a></br>
                                </li>
                                <li class="action-item">  
                    	        <a  href="{SITE_URL}listing?keywords=&location=Kegalle%2C+Region&placetype=state&placeid=LK.20&cat={CATID}&subcat={SUBCATID}&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                  Kegalle</a></br>
                                </li>
                                <li class="action-item">  
                                <a  href="{SITE_URL}listing?keywords=&location=Kilinochchi%2C+Region&placetype=state&placeid=LK.19&cat={CATID}&subcat{SUBCATID}=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                   Kilinochchi</a></br>
                                </li>
                                <li class="action-item">   
                                <a  href="{SITE_URL}listing?keywords=&location=Kurunegala%2C+Region&placetype=state&placeid=LK.18&cat={CATID}&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                   Kurunegala</a></br>
                                </li>
                                <li class="action-item">   
                                <a  href="{SITE_URL}listing?keywords=&location=Mannar%2C+Region&placetype=state&placeid=LK.17&cat={CATID}&subcat={SUBCATID}&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                  Mannar</a></br>
                                </li>
                                <li class="action-item"> 
                                <a  href="{SITE_URL}listing?keywords=&location=Matale%2C+Region&placetype=state&placeid=LK.16&cat={CATID}&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                   Matale</a></br>
                                </li>
                                <li class="action-item">   
                                <a  href="{SITE_URL}listing?keywords=&location=Matara%2C+Region&placetype=state&placeid=LK.15&cat={CATID}&subcat={SUBCATID}&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                   Matara</a></br>
                                </li>
                                <li class="action-item">   
                                <a  href="{SITE_URL}listing?keywords=&location=Moneragala%2C+Region&placetype=state&placeid=LK.14&cat={CATID}&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                   Moneragala</a></br>
                                </li>
                                <li class="action-item">   
                                <a  href="{SITE_URL}listing?keywords=&location=Mullativu%2C+Region&placetype=state&placeid=LK.13&cat={CATID}&subcat={SUBCATID}&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                   Mullativu</a></br>
                                </li>
                                <li class="action-item">   
                                <a  href="{SITE_URL}listing?keywords=&location=Nuwara+Eliya%2C+Region&placetype=state&placeid=LK.12&cat={CATID}&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                   Nuwara Eliya</a></br>
                                </li>
                                <li class="action-item">    
                                <a  href="{SITE_URL}listing?keywords=&location=Polonnaruwa%2C+Region&placetype=state&placeid=LK.11&cat={CATID}&subcat={SUBCATID}&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                   Polonnaruwa</a></br>
                                </li>
                                <li class="action-item">   
                                <a  href="{SITE_URL}listing?keywords=&location=Puttalam%2C+Region&placetype=state&placeid=LK.10&cat={CATID}&subcat={SUBCATID}&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                  Puttalam</a>
                                </li>
                                <li class="action-item">  
                                <a  href="{SITE_URL}listing?keywords=&location=Ratnapura%2C+Region&placetype=state&placeid=LK.8&cat={CATID}&subcat={SUBCATID}&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                   Ratnapura</a>
                                </li>
                                <li class="action-item">   
                                <a  href="{SITE_URL}listing?keywords=&location=Trincomalee%2C+Region&placetype=state&placeid=LK.7&cat={CATID}&subcat={SUBCATID}&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                    Trincomalee</a>
                                </li>
                                <li class="action-item">    
                                <a  href="{SITE_URL}listing?keywords=&location=Vavuniya%2C+Region&placetype=state&placeid=LK.5&cat={CATID}&subcat={SUBCATID}&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                    Vavuniya</a>
                                </li>    
                           </ul>   
                           {:IF}
                           
                            IF("{LOCATION_VISIBILITY}" != "0"){ 
                               	<ul class="action-list"> 
                               	    {LOOP: SUBLOCATION}
                                    <li class="action-item">
                       	            <a  href="{SITE_URL}listing?keywords=&location={SUBLOCATION.name}+City&placetype=city&placeid={SUBLOCATION.id}&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                        {SUBLOCATION.name}</a></br>
                                    </li>
                                    {/LOOP: SUBLOCATION}
                                </ui>
                            {:IF}
					</div>
				
					<a href="#filter" data-toggle="collapse" class="text-dec-none make_me_ud"><div class="cross_or2 updown1">
						Filter
						<div class="pull-right ud">
						  <i class="fa fa-chevron-down"></i>
						  </div>
					    </div>
					</a>
					
					

					
				</div>
			</div>
			<div class="col-md-9 border-1-drop-left ads_family col-12">
			    


			

                   <div class="clearfix fixme2"></div>
				</div>
		</div>
	</div>

	
{OVERALL_FOOTER}

