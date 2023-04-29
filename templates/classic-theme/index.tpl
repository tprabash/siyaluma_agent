{OVERALL_HEADER}
    <div class="container">
        <div class="row">
            <!--<div class="col-12 mt-3">
                <section class="section" style="padding-top: 6px;padding-bottom: 6px;">
                    <div class="row">
                        {LOOP: HOME_BANNERS}
                        <div class="col-12 col-md-3">
                            <a href="{HOME_BANNERS.url}">
                                <img src="{HOME_BANNERS.path}" style="width:100%;max-height:250px;"/>
                            </a>
                        </div>
                         {/LOOP: HOME_BANNERS}
                    </div>
                </section>
            </div>-->
            <div class="col-12 mt-3">
                <section class="section" style="padding-top: 6px;padding-bottom: 6px;">
                    <div class="containers">
                        <div class="row" style="padding: 9px 0">
                            <form method="get" action="{SITE_URL}listing" name="locationForm" id="ListingForm">
                                <div class="col-lg-3 col-md-6 col-sm-6 mb-sm-2 p-2">
                                    <div class="dropdown category-dropdown"><a data-toggle="dropdown" href="#"><span class="change-text">Choose Category</span><i class="fa fa-navicon"></i></a>
                                        {CAT_DROPDOWN}
                                    </div>
                                    {CAT_MOBILE}
                                </div>
                                <div class="col-lg-3 col-md-6 col-sm-6 mob-margin-bottom-10 p-2 ">
                                    <div class="form-group-group">
                                        <input type="hidden" name="placetype" id="searchPlaceType" value="{PTYPE}">
                                        <input type="hidden" name="placeid" id="searchPlaceId" value="{PID}">
                                        <input type="text" class="form-control form-control-must" placeholder="❂ All Sri Lanka" id="searchStateCity" name="location" value="{PLOCATION}">
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
                    </div>
                </section>
                
                <section class="section">
                    <div class="containers">
                        <div class="row">
                            <div class="col-md-6">
                                <div class="banners">
                                    <h3 style="font-weight: bold;">Search by City</h3>
                                    <ul style="columns: 3;-webkit-columns: 3;-moz-columns: 3;">
                                        {LOOP: HOME_LOOP_CITIES}
                                            <li class="category-item">
                                                <a href="{HOME_LOOP_CITIES.c}">
                                                    <span class="category-title" style="font-size: 14px;color:#3b5998;font-weight: bold;">{HOME_LOOP_CITIES.name}</span>
                                                </a>
                                            </li>
                                        {/LOOP: HOME_LOOP_CITIES}
                                    </ul>
                                </div>
                            </div>
                            <div class="col-md-6">
                                <div class="banners">
                                    <h3 style="font-weight: bold;">Search by Categories</h3>
                                    <ul style="columns: 2;-webkit-columns: 2;-moz-columns: 2;">
                                        {LOOP: CAT}
                                            <li class="category-item">
                                                <a href="{CAT.catlink}">
                                                    <span class="category-title" style="font-size: 14px;color:#3b5998;font-weight: bold;">{CAT.main_title}</span>
                                                </a>
                                            </li>
                                        {/LOOP: CAT}
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>
                </section>
                <div class="mobile-filer text-center">
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
            </div>
            <div class="col-12 col-md-6">
                
            </div>
            <div class="col-sm-12">
                <div class="banner">

                <div class="col-md-12 text-center">
                    <h2>Do you have something to sell?</h2>
                    <a href="https://www.siyaluma.lk/post-ad" class="btn btn-primary">Post an ad now!</a>
                </div>



                </div>
            </div>
            <!-- banner -->
        </div>






    <div class="quickad-section" id="quickad-bottom">{BOTTOM_ADSCODE}</div>
    </div>
    <!-- container -->
</section>
<!-- world-gmap -->





                        







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
</script>


{OVERALL_FOOTER}