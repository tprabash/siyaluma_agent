{OVERALL_HEADER}
 <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/test.css">
   <div class="container  denwim_container" style="background:#fff;border-radius:7px;">
		<div class="row my_slider_sect in_ads">
			<div class="col-lg-3 col-md-6 col-sm-6 mb-sm-2 p-2">
				<button type="button" class="btn btn-danger btn-block text-left font-msr set_loc p-2-2 text-center"><i class="fa fa-map-marker"></i> Select a City </button>
			</div>
			<div class="col-lg-3 col-md-6 col-sm-6 mob-margin-bottom-10 p-2 ">
			   	<div class="form-group-group">
			   	    	<input type="text" class="form-control" placeholder="{LANG_WHAT} ?"  value="">
			   	</div>
			</div>
			
			<div class="col-lg-4 col-md-6 col-sm-6 mb-sm-2 p-2">
				<div class="form-group-group">
					<input type="hidden" id="sq_cat" value="">
					<input type="hidden" id="sq_city" value="">
					<input type="text" class="form-control" placeholder="{LANG_WHERE} ?" value="">
					
				</div>
			</div>
			<div class="col-lg-2 col-md-6 col-sm-6 mb-sm-2 p-2">
				<button type="button" id="search_q_1__" class="btn btn-primary btn-lg btn-block"><i class="fa fa-search"></i> Search</button>
			</div>
			
		</div>
		<div class="mobile-filer text-center">
			<a class=" show-mob-filter" href="#">Show Filters</a>
				<div class="mobile-filter-content" style="display:none;">
				
					<select class="form-control" id="sort_by">
					
						<option value="/?sort=new">Date: Newest on Top</option>
						<option value="/?sort=older">Date: Oldest on Top</option>
												<option value="/?sort=views">Views: Most View on Top</option>
						<option value="/?sort=low">Price: Low to High</option>
						<option value="/?sort=high">Price: High to Low</option>
						
					</select>
					<script>
					$(document).on('change','#sort_by',function(){
						location.href="https://lansu.lk/ads/"+$(this).val();
					})
					</script>
				</div>
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
					
						<option value="/?sort=new">Date: Newest on Top</option>
						<option value="/?sort=older">Date: Oldest on Top</option>
												<option value="/?sort=views">Views: Most View on Top</option>
						<option value="/?sort=low">Price: Low to High</option>
						<option value="/?sort=high">Price: High to Low</option>
						
					</select>
					<script>
					$(document).on('change','#sort_by',function(){
						location.href="https://lansu.lk/ads/"+$(this).val();
					})
					</script>
				</div>
			
				<div class="col-md-12 cat_list_on_ads" role="tablist">
					<a href="#col_cat" data-toggle="collapse" class="text-dec-none make_me_ud" data-value="show" data-tar="1"><div class="cross_or2 updown1">
						Category
						<div class="pull-right ud">
						<i class="fa fa-chevron-down"></i>
						</div>
					</div></a>
					<div id="col_cat" class="collapse show " role="tabpanel">
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
					<div id="loc_cat" class="" role="tabpanel">
				<ul class="action-list"> 
                                <li class="action-item">
                   	            <a  href="{SITE_URL}listing?keywords=&location=Colombo%2C+Region&placetype=state&placeid=LK.1&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                    Colombo</a></br>
                                </li>
                                <li class="action-item">
                    	        <a  href="{SITE_URL}listing?keywords=&location=Kandy%2C+Region&placetype=state&placeid=LK.2&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                Kandy</a></br>
                                </li>
                                <li class="action-item">
                    	        <a  href="{SITE_URL}listing?keywords=&location=Galle%2C+Region&placetype=state&placeid=LK.3&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                  Galle</a></br>
                                </li>
                                <li class="action-item">
                                <a  href="{SITE_URL}listing?keywords=&location=Ampara%2C+Region&placetype=state&placeid=LK.4&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                 Ampara</a></br>
                                </li>
                                <li class="action-item">
                                <a  href="{SITE_URL}listing?keywords=&location=Anuradhapura%2C+Region&placetype=state&placeid=LK.6&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                  Anuradhapura</a></br>
                                </li>
                                <li class="action-item">  
                                <a  href="{SITE_URL}listing?keywords=&location=Badulla%2C+Region&placetype=state&placeid=LK.9&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                    Badulla</a></br>
                                </li>
                                <li class="action-item">    
                                <a  href="{SITE_URL}listing?keywords=&location=Batticaloa%2C+Region&placetype=state&placeid=LK.25&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                   Batticaloa</a></br>
                                </li>
                                <li class="action-item">   
                                <a  href="{SITE_URL}listing?keywords=&location=Gampaha%2C+Region&placetype=state&placeid=LK.24&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                  Gampaha</a></br>
                                </li>
                                <li class="action-item">  
                                <a  href="{SITE_URL}listing?keywords=&location=Hambantota%2C+Region&placetype=state&placeid=LK.23&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                  Hambantota</a></br>
                                </li>
                                <li class="action-item">  
                                <a  href="{SITE_URL}listing?keywords=&location=Jaffna%2C+Region&placetype=state&placeid=LK.22&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                  Jaffna</a></br>
                                </li>
                                <li class="action-item">  
                                <a  href="{SITE_URL}listing?keywords=&location=Kalutara%2C+Region&placetype=state&placeid=LK.21&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                  Kalutara</a></br>
                                </li>
                                <li class="action-item">  
                    	        <a  href="{SITE_URL}listing?keywords=&location=Kegalle%2C+Region&placetype=state&placeid=LK.20&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                  Kegalle</a></br>
                                </li>
                                <li class="action-item">  
                                <a  href="{SITE_URL}listing?keywords=&location=Kilinochchi%2C+Region&placetype=state&placeid=LK.19&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                   Kilinochchi</a></br>
                                </li>
                                <li class="action-item">   
                                <a  href="{SITE_URL}listing?keywords=&location=Kurunegala%2C+Region&placetype=state&placeid=LK.18&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                   Kurunegala</a></br>
                                </li>
                                <li class="action-item">   
                                <a  href="{SITE_URL}listing?keywords=&location=Mannar%2C+Region&placetype=state&placeid=LK.17&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                  Mannar</a></br>
                                </li>
                                <li class="action-item"> 
                                <a  href="{SITE_URL}listing?keywords=&location=Matale%2C+Region&placetype=state&placeid=LK.16&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                   Matale</a></br>
                                </li>
                                <li class="action-item">   
                                <a  href="{SITE_URL}listing?keywords=&location=Matara%2C+Region&placetype=state&placeid=LK.15&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                   Matara</a></br>
                                </li>
                                <li class="action-item">   
                                <a  href="{SITE_URL}listing?keywords=&location=Moneragala%2C+Region&placetype=state&placeid=LK.14&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                   Moneragala</a></br>
                                </li>
                                <li class="action-item">   
                                <a  href="{SITE_URL}listing?keywords=&location=Mullativu%2C+Region&placetype=state&placeid=LK.13&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                   Mullativu</a></br>
                                </li>
                                <li class="action-item">   
                                <a  href="{SITE_URL}listing?keywords=&location=Nuwara+Eliya%2C+Region&placetype=state&placeid=LK.12&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                   Nuwara Eliya</a></br>
                                </li>
                                <li class="action-item">    
                                <a  href="{SITE_URL}listing?keywords=&location=Polonnaruwa%2C+Region&placetype=state&placeid=LK.11&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                   Polonnaruwa</a></br>
                                </li>
                                <li class="action-item">   
                                <a  href="{SITE_URL}listing?keywords=&location=Puttalam%2C+Region&placetype=state&placeid=LK.10&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                  Puttalam</a>
                                </li>
                                <li class="action-item">  
                                <a  href="{SITE_URL}listing?keywords=&location=Ratnapura%2C+Region&placetype=state&placeid=LK.8&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                   Ratnapura</a>
                                </li>
                                <li class="action-item">   
                                <a  href="{SITE_URL}listing?keywords=&location=Trincomalee%2C+Region&placetype=state&placeid=LK.7&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                    Trincomalee</a>
                                </li>
                                <li class="action-item">    
                                <a  href="{SITE_URL}listing?keywords=&location=Vavuniya%2C+Region&placetype=state&placeid=LK.5&cat=&subcat=&filter=&sort=Newest&order=DESC&Submit=&range1=&range2=">
                                    Vavuniya</a>
                                </li>    
                           </ul>         
					</div>
				</div>
			</div>
			<div class="col-md-9 border-1-drop-left ads_family col-12">
			
				<div class="denwim_header">
					<span><a href="https://lansu.lk/" class="text-dec-none"><i class="fa fa-home"></i>Home </a></span>
					
				</div>
                    {LOOP: ITEM}
                        <!-- start  -->
                        <div class="quick-item row">
                            <div class="ad-listing">
                                <div class="image bg-transfer">
                                    <figure>
                                        <div class="item-badges">
                                            IF("{ITEM.featured}"=="1"){ <span class="featured">{LANG_FEATURED}</span>{:IF}
                                            IF("{ITEM.urgent}"=="1"){ <span>{LANG_URGENT}</span>{:IF}
                                        </div>
                                    </figure>
                                    <img src="{SITE_URL}storage/products/thumb/{ITEM.picture}"
                                         alt="{ITEM.product_name}"></div>
                                <div class="item-info col-sm-12 {ITEM.highlight_bg}">
                                    <!-- ad-info -->
                                    <div class="ad-info">
                                        <h4 class="item-title">
                                            IF("{ITEM.sub_image}"!=""){
                                            <img src="{ITEM.sub_image}" width="24px" alt="{ITEM.sub_title}" title="{ITEM.sub_title}"/>
                                            {:IF}
                                            <a href="{ITEM.link}">{ITEM.product_name}</a>
                                        </h4>
                                        <ul class="contact-options pull-right" id="set-favorite">
                                            <li><a href="#" data-item-id="{ITEM.id}" data-userid="{USER_ID}"
                                                   data-action="setFavAd"
                                                   class="fav_{ITEM.id} fa fa-heart IF("{ITEM.favorite}"=="1"){ active {:IF}"></a></li>
                                        </ul>
                                        <ol class="breadcrumb">
                                            <li class="breadcrumb-category"><a href="{ITEM.catlink}">{ITEM.category}</a></li>
                                            <li><a href="{ITEM.subcatlink}">{ITEM.sub_category}</a></li>
                                        </ol>
                                        <ul class="item-details">
                                            <li><i class="fa fa-map-marker"></i><a href="{ITEM.citylink}">{ITEM.city}</a>
                                            </li>
                                            <li><i class="fa fa-clock-o"></i>{ITEM.created_at}</li>
                                        </ul>
                                        IF("{ITEM.price}"!="0"){ <span class="item-price"> {ITEM.price} </span> {:IF}

                                        <div><a class="view-btn" href="{ITEM.link}">{LANG_VIEW-AD}</a></div>
                                    </div>
                                    <!-- ad-info -->
                                </div>
                                <!-- item-info -->
                            </div>
                        </div>
                        <!-- end -->
                    {/LOOP: ITEM}

			

                   <div class="clearfix fixme2"></div>
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
    $(document).ready(function () {
        $('ul.action-list').each(function(){
          var LiN = $(this).find('li').length;
          if( LiN > 5){    
            $('li', this).eq(2).nextAll().hide().addClass('toggleable');
            $(this).append('<li class="more">Show more...</li>');    
          }
        });
        
        $('ul.action-list').on('click','.more', function(){
          if( $(this).hasClass('less') ){    
            $(this).text('Show more...').removeClass('less');  
          }else{
            $(this).text('Show less...').addClass('less'); 
          }
          $(this).siblings('li.toggleable').slideToggle();
        }); 
    });
</script>


{OVERALL_FOOTER}

