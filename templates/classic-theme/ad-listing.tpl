{OVERALL_HEADER}
<style>
.stack-menu{
	display:none;
}
    .search-list-item {
    border: 0 solid #eee;
        border-bottom-color: rgb(238, 238, 238);
        border-bottom-style: solid;
        border-bottom-width: 0px;
    margin-bottom: 0;
    position: relative;
    border-bottom: 1px solid #eee;
    padding-bottom: 11px;
    padding-top: 11px;
}
.search-list-item .thumb-img-div {
    margin: 0;
    padding: 0;
}
.pd-l-5 {
    padding-left: 5px;
    padding-right: 10px;
}
.search-list-item .item-title {
    margin-top: 8px;
    margin-bottom: 10px;
    font-size: 18px;
    font-weight: 500;
    color: rgba(0,0,0,.78);
}
.item-m {
    margin-bottom: 6px !important;
}
.search-list-item .item-loc-cat {
    margin-bottom: 4px;
    font-size: 12px !important;
}
.search-list-item .item-price {
    margin-bottom: 5px;
    margin-top: 5px;
    font-size: 16px;
    color: #fea502;
}
.open-in-new-tab {
    font-size: 20px;
    position: absolute;
    bottom: 0;
    right: 0;
    padding: 10px 10px 1px;
    color: #929191 !important;
}
.item-time {
    font-size: 10px !important;
}
.link-pre{
    z-index:5;
}
.link-pass{
    z-index:7;
}
@media(max-width:770px){
    #category-change{
        position: absolute;
        top: -2px;
        width: 100%;
        left: -1px;
        z-index: 99999999999;
    }
}
</style>
 <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/test.css">
 <link href="{SITE_URL}/plugins/jquery-stack-menu/dist/jquery-stack-menu.min.css" rel="stylesheet"/>
 <script src="{SITE_URL}/plugins/jquery-stack-menu/dist/jquery-stack-menu.min.js"></script>
   <div class="container  denwim_container" style="background:#fff;border-radius:7px;">
       
       
       		<!-- <div class="row">
	        <section class="categories__block">
               <div class="categories__container point1">
                 <div class="category_slider d-flex owl-hidden">
                     {LOOP: CAT}
                        <div class="item {CAT.linkstatus} col-4 col-sm-3 col-md-2 col-lg-1">
                            <a href="{CAT.catlink}" class="categories__link text-center" id="cameras">
                              
<i class="{CAT.icon}" style="font-size:20px;"></i>
                              {CAT.main_title}
                            </a>
                        </div>
                    {/LOOP: CAT}
                </div>
               </div>
            </section>
		</div> -->

   
       
		<div class="row" style="padding: 9px 0">
		     <form method="get" action="{SITE_URL}listing" name="locationForm" id="ListingForm">
			<div class="col-lg-3 col-md-6 col-sm-6 mb-sm-2 p-2">
                    <div class="dropdown category-dropdown"><a data-toggle="dropdown" href="#"><span
                                    class="change-text">Choose Category</span><i class="fa fa-navicon"></i></a>
                        {CAT_DROPDOWN}
                    </div>
                 {CAT_MOBILE}
                 <div class="modal fade" id="cat_modal" tabindex="-1" role="dialog" style="display: none;" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content" id="yolacity">
								<div class="modal-header">
									<h5 class="modal-title text-center">All Categories</h5>
										<button type="button" class="close" data-dismiss="modal" aria-label="Close">
											<span aria-hidden="true">×</span>
										</button>
								</div>
								<div class="modal-body">
								
									<div id="cat_sel" role="tablist" aria-multiselectable="true">
										<div class="card">
											<div class="card-header" role="tab">
												<h6 class="mb-0 cat_list_h">
													<i class="fa fa-th"></i>
													
														<a href="https://siyaluma.lk/listing?keywords=&placetype=&placeid=&location=&cat=&subcat=&filter=&sort=Newest&order=DESC&submit=">
														All Categories
														</a>
														
												</h6>
											</div>
										</div>
									</div>
									<div id="cat_1_sel" class="collapse" role="tabpanel">
										<div class="card-block">
										
										</div>
									</div>
										
									<div id="cat_sel" role="tablist" aria-multiselectable="true">
										<div class="card">
											<div class="card-header" role="tab">
												<h6 class="mb-0 cat_list_h">
													<i class="pe-7s-car"></i>
													<a data-toggle="collapse" data-parent="#cat_sel" href="#cat_2_sel" aria-expanded="true" aria-controls="collapseOne">
													Vehicle  
													</a>
												</h6>
											</div>
										</div>
									</div>
									
									<div id="cat_2_sel" class="collapse" role="tabpanel">
										<div class="card-block">
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=47&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Cars</a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=48&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Motorbikes</a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=49&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Three Wheelers</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=50&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Push Cycles</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=51&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Vans</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=53&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Heavy Machinery & Tractors</a></li>
												
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=54&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Auto Services</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=55&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Auto Parts</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=56&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Boats</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=142&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Buses</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=143&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Lorries</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="">Push Cycles</a></li>
										
										</div>
									</div>

									<div id="cat_sel" role="tablist" aria-multiselectable="true">
										<div class="card">
											<div class="card-header" role="tab">
												<h6 class="mb-0 cat_list_h">
													<i class="pe-7s-home"></i>
													<a data-toggle="collapse" data-parent="#cat_sel" href="#cat_3_sel" aria-expanded="true" aria-controls="collapseOne">
													Property   
													</a>
												</h6>
											</div>
										</div>
									</div>
									
									<div id="cat_3_sel" class="collapse" role="tabpanel">
										<div class="card-block">
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=10&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Property</a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=57&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Land</a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=58&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Houses</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=59&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Apartments</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=60&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">New Developments</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=61&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Commercial Property</a></li>
												
										</div>
									</div>

									<div id="cat_sel" role="tablist" aria-multiselectable="true">
										<div class="card">
											<div class="card-header" role="tab">
												<h6 class="mb-0 cat_list_h">
											    	<i class="pe-7s-key"></i>
													<a data-toggle="collapse" data-parent="#cat_sel" href="#cat_4_sel" aria-expanded="true" aria-controls="collapseOne">
													Property For Rent    
													</a>
												</h6>
											</div>
										</div>
									</div>
									
									<div id="cat_4_sel" class="collapse" role="tabpanel">
										<div class="card-block">
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=11&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Property For Rent</a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=62&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Land</a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=63&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Houses</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=64&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Apartments</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=65&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Rooms & Annexes</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=66&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Holiday & Short-Term Rental</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=67&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Commercial Property</a></li>
												
										</div>
									</div>

									<div id="cat_sel" role="tablist" aria-multiselectable="true">
										<div class="card">
											<div class="card-header" role="tab">
												<h6 class="mb-0 cat_list_h">
												   <i class="pe-7s-portfolio"></i>
													<a data-toggle="collapse" data-parent="#cat_sel" href="#cat_5_sel" aria-expanded="true" aria-controls="collapseOne">
													Job Vacancy     
													</a>
												</h6>
											</div>
										</div>
									</div>
									
									<div id="cat_5_sel" class="collapse" role="tabpanel">
										<div class="card-block">
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=22&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Job Vacancy</a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=131&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Private Jobs</a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=132&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Foreign Jobs</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=141&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Apartments</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=141&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Government Jobs</a></li>
											
										</div>
									</div>

									<div id="cat_sel" role="tablist" aria-multiselectable="true">
										<div class="card">
											<div class="card-header" role="tab">
												<h6 class="mb-0 cat_list_h">
											   	<i class="pe-7s-shopbag"></i>
													<a data-toggle="collapse" data-parent="#cat_sel" href="#cat_6_sel" aria-expanded="true" aria-controls="collapseOne">
													Discounts      
													</a>
												</h6>
											</div>
										</div>
									</div>
									
									<div id="cat_6_sel" class="collapse" role="tabpanel">
										<div class="card-block">
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=30&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Discounts</a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=136&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Business Promotion</a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=137&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Education Promotion</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=138&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Health Promotion</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=139&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Services Promotion</a></li>
											
										</div>
									</div>	

									<div id="cat_sel" role="tablist" aria-multiselectable="true">
										<div class="card">
											<div class="card-header" role="tab">
											 	<h6 class="mb-0 cat_list_h">
											    	<i class="pe-7s-phone"></i>
													<a data-toggle="collapse" data-parent="#cat_sel" href="#cat_7_sel" aria-expanded="true" aria-controls="collapseOne">
													Electronics       
													</a>
												</h6>
											</div>
										</div>
									</div>
									
									<div id="cat_7_sel" class="collapse" role="tabpanel">
										<div class="card-block">
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=12&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Electronics </a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=68&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Mobile Phones</a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=69&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Mobile Phone Accessories</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=70&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Computers & Tablets</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=71&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Computer Accessories</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=72&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">TVs</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=73&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">TV & Video Accessories</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=74&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Cameras & Camcorders</a></li>
											
										   <li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=75&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Audio & MP3</a></li>
										   
										   <li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=76&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Electronic Home Appliances</a></li>
										   										   
										   <li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=77&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Air Conditions & Electrical fittings</a></li>
										   
										   <li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=78&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Video Games & Consoles</a></li> 
										   
										   <li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=79&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Other Electronics</a></li> 
										</div>
									</div>	

									<div id="cat_sel" role="tablist" aria-multiselectable="true">
										<div class="card">
											<div class="card-header" role="tab">
												<h6 class="mb-0 cat_list_h">
													<i class="pe-7s-graph2"></i>
													<a data-toggle="collapse" data-parent="#cat_sel" href="#cat_8_sel" aria-expanded="true" aria-controls="collapseOne">
													Business & Industry       
													</a>
												</h6>
											</div>
										</div>
									</div>
									
									<div id="cat_8_sel" class="collapse" role="tabpanel">
										<div class="card-block">
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=16&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Business & Industry </a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=103&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Office Equipment, Supplies & Stationery</a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=104&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Solar & Generators</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=105&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Industry Tools & Machinery</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=106&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Raw Materials & Wholesale Lots</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=107&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Licences & Titles</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=108&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Healthcare, Medical Equipment & Supplies</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=109&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Other Business Services</a></li>
											
										</div>
									</div>

									<div id="cat_sel" role="tablist" aria-multiselectable="true">
										<div class="card">
											<div class="card-header" role="tab">
												<h6 class="mb-0 cat_list_h">
													<<i class="pe-7s-tools"></i>
													<a data-toggle="collapse" data-parent="#cat_sel" href="#cat_9_sel" aria-expanded="true" aria-controls="collapseOne">
													Services   
													</a>
												</h6>
											</div>
										</div>
									</div>
									
									<div id="cat_9_sel" class="collapse" role="tabpanel">
										<div class="card-block">
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=17&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Services </a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=110&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Trade Services</a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=111&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Domestic Services</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=112&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Events & Entertainment</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=113&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Health & Wellbeing</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=114&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Travel & Tourism</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=115&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Other Services</a></li>
											
											
										</div>
									</div>

									<div id="cat_sel" role="tablist" aria-multiselectable="true">
										<div class="card">
											<div class="card-header" role="tab">
												<h6 class="mb-0 cat_list_h">
													<i class="pe-7s-piggy"></i>
													<a data-toggle="collapse" data-parent="#cat_sel" href="#cat_10_sel" aria-expanded="true" aria-controls="collapseOne">
													Animals    
													</a>
												</h6>
											</div>
										</div>
									</div>
									
									<div id="cat_10_sel" class="collapse" role="tabpanel">
										<div class="card-block">
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=19&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Animals </a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=121&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Pets</a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=122&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Pet Food</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=123&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Veterinary Services</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=124&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Farm Animals</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=125&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Animal Accessories</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=126&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Other Animals</a></li>
											
											
										</div>
									</div>			
									
									<div id="cat_sel" role="tablist" aria-multiselectable="true">
										<div class="card">
											<div class="card-header" role="tab">
												<h6 class="mb-0 cat_list_h">
											    	<i class="pe-7s-study"></i>
													<a data-toggle="collapse" data-parent="#cat_sel" href="#cat_11_sel" aria-expanded="true" aria-controls="collapseOne">
													Education      
													</a>
												</h6>
											</div>
										</div>
									</div>
									
									<div id="cat_11_sel" class="collapse" role="tabpanel">
										<div class="card-block">
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=18&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Education </a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=116&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Higher Education</a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=117&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Textbooks</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=118&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Tuition</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=119&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Vocational Institutes</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=120&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Other Education</a></li>
											
											
										</div>
									</div>	


									<div id="cat_sel" role="tablist" aria-multiselectable="true">
										<div class="card">
											<div class="card-header" role="tab">
												<h6 class="mb-0 cat_list_h">
												<i class="pe-7s-box1"></i>
													<a data-toggle="collapse" data-parent="#cat_sel" href="#cat_12_sel" aria-expanded="true" aria-controls="collapseOne">
													Home & Garden       
													</a>
												</h6>
											</div>
										</div>
									</div>
									
									<div id="cat_12_sel" class="collapse" role="tabpanel">
										<div class="card-block">
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=13&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Home & Garden  </a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=80&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Furniture</a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=82&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Building Material & Tools</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=83&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Garden</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=84&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Home Decor</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=85&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Kitchen items</a></li>

											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=86&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Other Home Items</a></li>											
											
										</div>
									</div>


									<div id="cat_sel" role="tablist" aria-multiselectable="true">
										<div class="card">
											<div class="card-header" role="tab">
												<h6 class="mb-0 cat_list_h">
												<i class="pe-7s-wristwatch"></i>
													<a data-toggle="collapse" data-parent="#cat_sel" href="#cat_13_sel" aria-expanded="true" aria-controls="collapseOne">
													 Fashion, Health & Beauty        
													</a>
												</h6>
											</div>
										</div>
									</div>
									
									<div id="cat_13_sel" class="collapse" role="tabpanel">
										<div class="card-block">
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=14&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Fashion, Health & Beauty </a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=87&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Bags & Luggage</a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=88&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Clothing</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=89&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Shoes & Footwear</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=90&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Jewellery</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=91&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Sunglasses & Optician</a></li>

											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=92&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Watches</a></li>											

											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=93&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Other Fashion Accessories</a></li>	
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=94&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Health & Beauty Products</a></li>	
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=95&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Other Personal Items</a></li>	
										</div>
									</div>									

									<div id="cat_sel" role="tablist" aria-multiselectable="true">
										<div class="card">
											<div class="card-header" role="tab">
												<h6 class="mb-0 cat_list_h">
													<i class="pe-7s-ball"></i>
													<a data-toggle="collapse" data-parent="#cat_sel" href="#cat_14_sel" aria-expanded="true" aria-controls="collapseOne">
													 Hobby, Sport & Kids         
													</a>
												</h6>
											</div>
										</div>
									</div>
									
									<div id="cat_14_sel" class="collapse" role="tabpanel">
										<div class="card-block">
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=15&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Hobby, Sport & Kids </a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=96&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Musical Instruments</a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=97&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Sports Equipment</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=98&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Sports Supplements</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=99&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Travel, Events & Tickets</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=100&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Art & Collectibles</a></li>

											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=101&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Music, Books & Movies</a></li>											

											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=102&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Other Hobby, Sport & Kids Items</a></li>	
											
										</div>
									</div>		



									<div id="cat_sel" role="tablist" aria-multiselectable="true">
										<div class="card">
											<div class="card-header" role="tab">
												<h6 class="mb-0 cat_list_h">
													<i class="pe-7s-leaf"></i>
													<a data-toggle="collapse" data-parent="#cat_sel" href="#cat_15_sel" aria-expanded="true" aria-controls="collapseOne">
													 Food & Agriculture       
													</a>
												</h6>
											</div>
										</div>
									</div>
									
									<div id="cat_15_sel" class="collapse" role="tabpanel">
										<div class="card-block">
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=20&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Food & Agriculture </a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=127&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Food</a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=128&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Crops, Seeds & Plants</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=129&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Farming Tools & Machinery</a></li>
											
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=130&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Other Food & Agriculture</a></li>
											
											
										</div>
									</div>	


									<div id="cat_sel" role="tablist" aria-multiselectable="true">
										<div class="card">
											<div class="card-header" role="tab">
												<h6 class="mb-0 cat_list_h">
												<i class="pe-7s-ticket"></i>
													<a data-toggle="collapse" data-parent="#cat_sel" href="#cat_16_sel" aria-expanded="true" aria-controls="collapseOne">
													 Other       
													</a>
												</h6>
											</div>
										</div>
									</div>
									
									<div id="cat_16_sel" class="collapse" role="tabpanel">
										<div class="card-block">
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=21&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Other</a></li>
										
											<li class="moda_cat_sel"><i class="fa fa-tag" style="color:#555;"></i> <a href="https://siyaluma.lk/listing?keywords=&location=&placetype=&placeid=&cat=&subcat=144&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">Astrology</a></li>
									
											
											
										</div>
									</div>										
									
								</div>
							</div>
						</div>
					</div>
					
			</div>

			
			<div class="col-lg-3 col-md-6 col-sm-6 mob-margin-bottom-10 p-2 ">
		
				<div class="form-group-group">
                    <input type="hidden" name="placetype" id="searchPlaceType" value="{PTYPE}">
                    <input type="hidden" name="placeid" id="searchPlaceId" value="{PID}">
					<input type="text" class="form-control form-control-must"
					
					 placeholder="❂ All Sri Lanka" id="searchStateCity" name="location" value="{PLOCATION}">
				</div>
			</div>
			
			<div class="col-lg-4 col-md-6 col-sm-6 mb-sm-2 p-2">
			   	<div class="form-group-group">
			   	    <input type="text" class="form-control" name="keywords" id="keywords" placeholder="{LANG_WHAT} ?" autocomplete="off" data-prev-value="0">
			   	</div>
			</div>
			
			<div class="col-lg-2 col-md-6 col-sm-6 mb-sm-2 p-2">
                <input type="hidden" id="input-maincat" name="cat" value="{MAINCAT}"/>
                <input type="hidden" id="input-subcat" name="subcat" value="{SUBCAT}"/>
                <input type="hidden" id="input-filter" name="filter" value="{FILTER}"/>
                <input type="hidden" id="input-sort" name="sort" value="{SORT}"/>
                <input type="hidden" id="input-order" name="order" value="{ORDER}"/>
				<button type="submit" id="submit" name="submit" class="btn btn-primary btn-lg btn-block"><i class="fa fa-search"></i> Search</button>
			</div>
			</form>
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
					<!--<div class="cross_or">
						<span class="hrline" style="font-size:13px;">Filter</span>
					</div>-->
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
				

                           
					</div>
				

			
			
			
			<div class="col-md-7 border-1-drop-left ads_family col-12">
			  
                <div class="quick-item row" onclick='goToLocation("{SITE_URL}ad/{TOP_AD_ID}/{TOP_AD_SLUG}")'>
                    <div class="ad-listing  top-ad">
                        <div class="image bg-transfer">
                            <figure>
                                <div class="item-badges">
                                     <span class="featured">Top Ad <i class="fa fa-certificate" aria-hidden="true"></i></span>
                                </div>
                            </figure>



                            <img src="{SITE_URL}storage/products/thumb/{TOP_AD_IMAGE}"  alt="{TOP_AD_IMAGE}"></div>
                            <div class="item-info col-sm-12">
                            <div class="ad-info">
                                <h4 class="item-title">
                                    <a href="{SITE_URL}ad/{TOP_AD_ID}/{TOP_AD_SLUG}">{TOP_AD_TITLE}</a>
                                </h4>
                                <ol class="breadcrumb">
                                    <li class="breadcrumb-category"><a href="{SITE_URL}ad/{TOP_AD_ID}/{TOP_AD_SLUG}">{TOP_AD_CITY}, {TOP_AD_SUBCATEOGORY}</a></li>
                                </ol>
                                <ul class="item-details">
                                    <li><i class="fa fa-clock-o"></i>{TOP_AD_PUBLISHED_DATE}</li>
                                </ul>
                               <span class="item-price"> ₨. {TOP_AD_PRICE}</span>

                                <!--<div><a class="view-btn" href="{SITE_URL}ad/{TOP_AD_ID}/{TOP_AD_SLUG}">View</a></div>-->
                            </div>
                        </div>
                    </div>
                </div>
			 
			 

			 
                {LOOP: ITEM}
  
                <a href="{ITEM.link}" class="link-pass on-continue">
                    <div class="quick-item row">
                        <div class="ad-listing">
                            <div class="image bg-transfer">
                                <figure>
                                    <div class="item-badges">
                                        IF("{ITEM.featured}"=="1"){ <span class="featured">{LANG_FEATURED}</span>{:IF}
                                        IF("{ITEM.urgent}"=="1"){ <span>{LANG_URGENT}</span>{:IF}
                                    </div>
                                    
                                </figure>
                                <img src="{SITE_URL}storage/products/thumb/{ITEM.picture}"alt="{ITEM.product_name}">
                            </div>
                            <div class="item-info col-sm-12 {ITEM.highlight_bg}">
                                <div class="ad-info">
                                    <h4 class="item-title">
                                        IF("{ITEM.sub_image}"!=""){
                                        <img src="{ITEM.sub_image}" width="24px" alt="{ITEM.sub_title}" title="{ITEM.sub_title}"/>
                                        {:IF}
                                        <span>{ITEM.product_name}</span>
                                    </h4>
                                    <!--<ul class="contact-options pull-right" id="set-favorite">
                                        <li><a href="#" data-item-id="{ITEM.id}" data-userid="{USER_ID}"
                                               data-action="setFavAd"
                                               class="fav_{ITEM.id} fa fa-heart IF("{ITEM.favorite}"=="1"){ active {:IF}"></a>
                                        </li>
                                    </ul>-->
                                    <ol class="breadcrumb">
                                        <li class="breadcrumb-category"><span class="link link-pass" href="{ITEM.catlink}" onclick="window.location.href='{ITEM.catlink}';">{ITEM.category}</span></li>
                                        <li><span  class="link link-pass" href="{ITEM.subcatlink}" onclick="window.location.href='{ITEM.subcatlink}';">{ITEM.sub_category}</span></li>
                                    </ol>
                                    <ul class="item-details">
                                        <li><i class="fa fa-map-marker"></i><span class="link link-pass" href="{ITEM.citylink}" onclick="window.location.href='{ITEM.citylink}';">{ITEM.city}</span>
                                        </li>
                                        <li class="link"><i class="fa fa-clock-o"></i>{ITEM.created_at}</li>
                                    </ul>
                                    IF("{ITEM.price}"!="0"){ <span class="item-price"> {ITEM.price} </span> {:IF}

                                    <!--<div><a class="view-btn" href="{ITEM.link}">{LANG_VIEW-AD}</a></div>-->
                                </div>
                            </div>
                        </div>
                    </div>
                </a>
                {/LOOP: ITEM}
                
                
               <div class="clearfix fixme2"></div>
			</div>
			
			

				

			
			
								<div class="col-md-2">
								    
								    
								    
					<!--<div class="cross_or">
						<span class="hrline" style="font-size:13px;">Sortby</span>
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
					</script></br>-->
								    
								    
								    
								    

                                </div>

			
		</div>
		
		</div>
	</div>

	
	
	<div class="container pagination_cont">
	    

	    
        <div class="pagination-container text-center">
            
            

            
            <ul class="pagination">
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
	
<script type="text/javascript">

    function  goToLocation(link) {
        location.href=link;
    }
    
    $(document).ready(function () {
        
        $('ul.action-list').each(function(){
          var LiN = $(this).find('li').length;
          if( LiN > 6){    
            $('li', this).eq(6).nextAll().hide().addClass('toggleable');
            $(this).append('<li class="more">Show more <i class="fa fa-chevron-down" aria-hidden="true"></i></li>');    
          }
        });
        
        $('ul.action-list').on('click','.more', function(){
          if( $(this).hasClass('less') ){    
            $(this).html('Show more <i class="fa fa-chevron-down" aria-hidden="true"></i>').removeClass('less');  
          }else{
            $(this).html('Show less <i class="fa fa-chevron-up" aria-hidden="true"></i>').addClass('less'); 
          }
          $(this).siblings('li.toggleable').slideToggle();
        });
        
            
    var getMaincatId = '{MAINCAT}';
    var getSubcatId = '{SUBCAT}';

    $(window).bind("load", function () {
        if (getMaincatId != "") {
            $('li a[data-cat-type="maincat"][data-ajax-id="' + getMaincatId + '"]').trigger('click');
        } else if (getSubcatId != "") {
            $('li ul li a[data-cat-type="subcat"][data-ajax-id="' + getSubcatId + '"]').trigger('click');
        } else {
            $('li a[data-cat-type="all"]').trigger('click');
        }
    });
    
    });
    $(document).on('click','.link-pass',function(e){
        e.stopImmediatePropagation(); 
        if(!$(this).hasclass('on-continue')){
            window.location.href=$(this).attr('href');
        }
    });
        
	$(document).on('click','.category-dropdown a',function(e){
		
	});
</script>

{OVERALL_FOOTER}

