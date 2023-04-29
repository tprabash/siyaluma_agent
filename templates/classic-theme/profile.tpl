<!DOCTYPE html>
<html lang="{LANG_CODE}" dir="{LANGUAGE_DIRECTION}">
<head>
    <title>{FULLNAME} - Siyaluma.lk</title>
    <meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="{SITE_TITLE}">
    <meta name="keywords" content="{PAGE_META_KEYWORDS}">
    <meta name="description" content="{ABOUT}">
    <meta name="google-site-verification" content="OQOkAzB0C2kiCZCzRbOXCu0jmup1trNwBU8xhWpSjWg" />
    <meta name="msvalidate.01" content="2AF0F645A14B31E97D9267A4C27C7B71" />
    <meta name="yandex-verification" content="6e34b613ef9f5a51" />
    <meta name="theme-color" content="#5e2ced"/>
    <meta property="fb:app_id" content="{FACEBOOK_APP_ID}" />
    <meta property="og:site_name" content="{SITE_TITLE}" />
    <meta property="og:locale" content="en_US" />
    <meta property="og:url" content="{PAGE_LINK}" />
    <meta property="og:title" content="{PAGE_TITLE} - {SITE_TITLE}" />
    <meta property="og:description" content="{PAGE_META_DESCRIPTION}" />
    <meta property="og:type" content="{META_CONTENT}" />
    IF("{META_CONTENT}"=="article"){
    <meta property="article:author" content="#" />
    <meta property="article:publisher" content="#" />
    <meta property="og:image" content="{META_IMAGE}" />
    <meta property="og:image:width" content="800" />
    <meta property="og:image:height" content="800" />
    {:IF}
    IF("{META_CONTENT}"=="website"){
    <meta property="og:image" content="{META_IMAGE}" />
    {:IF}

    <meta property="twitter:card" content="summary">
    <meta property="twitter:title" content="{PAGE_TITLE} - {SITE_TITLE}">
    <meta property="twitter:description" content="{PAGE_META_DESCRIPTION}">
    <meta property="twitter:domain" content="{SITE_URL}">
    <meta name="twitter:image:src" content="{META_IMAGE}" />



    <link rel="shortcut icon" href="{SITE_URL}storage/logo/{SITE_FAVICON}">
    <style>
        :root {
            --theme-color: transparent;
        }
        .highlight-premium-ad{ background: #ffedc0 !important;}
        @media (max-width: 767px) {
            .left-side {
                height: 70px !important;
            }
        }
        
        a:link {
        color: black;
        }
        
        a:hover {
        color: #337ab7!important;
        }

        
    </style>
    <script>
        var themecolor = '{THEME_COLOR}';
        var mapcolor = '{MAP_COLOR}';
        var siteurl = '{SITE_URL}';
        var template_name = '{TPL_NAME}';
    </script>
    <!-- CSS -->
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/map/map-marker.css">
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/bootstrap.min.css">
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/owl.carousel.css">
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/slidr.css">
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/main.css">
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/ajax-search.css">
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/membership.css">

    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/styleswitcher.css">
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/responsive.css">
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/flags/flags.min.css">
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/font-awesome.min.css">
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/icofont.css">
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/pe-icon-7-stroke.css">
    <!--Sweet Alert CSS -->
    <link href="{SITE_URL}templates/{TPL_NAME}/js/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
    <!-- font -->
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/assets/plugins/datedropper/datedropper.min.css">
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/assets/plugins/wickedpicker/dist/wickedpicker.min.css">
    <!-- icons -->

    IF("{LANGUAGE_DIRECTION}"=="rtl"){
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/rtl.css">
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/bootstrap-rtl.min.css">
    {:IF}

    <!-- icons -->
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/jquery-2.2.1.min.js'></script>
    <script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/jquery-migrate-1.2.1.min.js'></script>
    <script type='text/javascript' src='//maps.google.com/maps/api/js?key={GMAP_KEY}&#038;libraries=places%2Cgeometry&#038;ver=2.2.1'></script>
    <script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/richmarker-compiled.js'></script>
    <script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/markerclusterer_packed.js'></script>
    <script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/gmapAdBox.js'></script>
    <script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/maps.js'></script>
    <script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/jquery.style-switcher.js'></script>

    <script type="text/javascript" src="{SITE_URL}templates/{TPL_NAME}/js/mmenu.min.js"></script>
     
    <script>var ajaxurl = "{APP_URL}user-ajax.php";</script>

    <script type="text/javascript">
        $(document).ready(function() {
            
            $('.resend').click(function(e) { 						// Button which will activate our modal

                the_id = $(this).attr('id');						//get the id

                // show the spinner
                $(this).parent().html("<img src='{SITE_URL}templates/{TPL_NAME}/images/spinner.gif'/>");

                $.ajax({											//the main ajax request
                    type: "POST",
                    data: "action=email_verify&id="+$(this).attr("id"),
                    url: ajaxurl,
                    success: function(data)
                    {
                        $("span#resend_count"+the_id).html(data);
                        //fadein the vote count
                        $("span#resend_count"+the_id).fadeIn();
                        //remove the spinner
                        $("span#resend_buttons"+the_id).remove();

                    }
                });

                return false;
            });
        });
    </script>
    

</head>

<body class="{LANGUAGE_DIRECTION}">
<!-- Wrapper -->
<div id="wrapper">

    IF("{USERSTATUS}"=="0"){
    <div class="pam fbPageBanner uiBoxYellow noborder">
        <div class="fbPageBannerInner">
            <table class="uiGrid _51mz _5ud_" cellspacing="0" cellpadding="0">
                <tbody>
                <tr class="_51mx">
                    <td class="_51m- phm" style="width:78%">
                        <span class="uiIconText">
                            <i class="icon-lock text-18"></i>
                            <span class="pts5 fsl fwb fs13 fbold">{LANG_WELCOME} <span class="coffel">{USERNAME}</span>, go to <span class="coffel">{USEREMAIL}</span> {LANG_TO} {LANG_VERIFY_EMAIL_ADDRESS}</span>
                        </span>
                    </td>
                    <td class="_51m- phm _51mw">
                        <table class="uiGrid _51mz _5ud-" cellspacing="0" cellpadding="0">
                            <tbody>
                            <tr class="_51mx">
                                <td class="_51m- phm"><a class="uiButton uiButtonLarge" style="box-sizing:content-box;" rel="nofollow" target="_blank" role="button" href="http://www.{EMAILDOMAIN}/"><span class="uiButtonText">{LANG_GOTO_UR_EMAIL}</span></a>
                                </td>
                                <td class="_51m- phm _51mw">
                                    <span class='resend_buttons' id='resend_buttons{USER_ID}'><a class="uiButton uiButtonLarge resend" style="box-sizing:content-box;" href='javascript:;' id="{USER_ID}"><span class="uiButtonText">{LANG_RESEND_EMAIL}</span></a></span>
                                    <span class='resend_count' id='resend_count{USER_ID}' style="box-sizing:content-box;"></span>
                                </td>
                            </tr>
                            </tbody>
                        </table>
                    </td>
                </tr>
                </tbody>
            </table>
        </div>
    </div>
    
    {:IF}
    
</br>
<!-- siyaluma all -->
</center>

<!--Start of Tawk.to Script-->
<script type="text/javascript">
var Tawk_API=Tawk_API||{}, Tawk_LoadStart=new Date();
(function(){
var s1=document.createElement("script"),s0=document.getElementsByTagName("script")[0];
s1.async=true;
s1.src='https://embed.tawk.to/5d07a8da53d10a56bd7a7a65/default';
s1.charset='UTF-8';
s1.setAttribute('crossorigin','*');
s0.parentNode.insertBefore(s1,s0);
})();
</script>
<!--End of Tawk.to Script--> 

<style>
    .cover-photo {
	   background:url('{SITE_URL}storage/covers/{COVER}');
	 background-color: #435e9c;
	background-repeat: no-repeat;
	background-position: center;
	background-size: cover;
	color:white; 
	height:315px
	}
</style>
<section id="main" class="clearfix  ad-profile-page">
    <div class="container">
        <div class="breadcrumb-section">
            <!-- breadcrumb -->
            <ol class="breadcrumb">
                <a href="{SITE_URL}"><i class="fa fa-home"></i> Home </a>
                <a></a><i class="fa fa-arrow-left" aria-hidden="true"></i>
<script>
  document.write('<a  href="' + document.referrer + '"> Go Back</a>');
</script>

            </ol>
            <!-- breadcrumb -->
        </div>
        <div class="row">
            <div class="col-md-12"> 
                 <div class="cover-photo"> 
                    <img src="{SITE_URL}storage/profile/{USERIMAGE}" class="profile-photo img-thumbnail show-in-modal"> 
                        <div class="cover-name"> <h2>{FULLNAME}</h2></div>
                 </div>
            </div>
            <div class="my-details  col-md-12">
              <div class="section">
                <div class="row">
                   <div class="col-md-7">
                       <h3 class="is-tagline">
                           IF("{TAGLINE}"!=""){
                              {TAGLINE}
                           {:IF}
                           
                           IF("{TAGLINE}"==""){
                              Authorized Member
                           {:IF}
                       </h3>
                       <div class="shop-description">
                           <div class="fade-content">
                               <p>
                                  IF("{ABOUT}"!=""){
                                      {ABOUT}
                                  {:IF}
                                  IF("{ABOUT}"==""){
                                     Siyaluma.lk is a leading classified ad posting platform in Sri Lanka which provides a local Sri lankan high growth online marketplace to connect with local people to buy, sell or also exchange their used products and services.
                                  {:IF}
                               </p>
                               
                               <script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
     style="display:block; text-align:center;"
     data-ad-layout="in-article"
     data-ad-format="fluid"
     data-ad-client="ca-pub-4591416843855967"
     data-ad-slot="7095625309"></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script>
                               
                               
                            </div>
                        </div>
                   </div>
                   <div class="col-md-5">
                        <div class="user-admin">
                            <section class="contacts">
                                IF("{PHONE}"!=""){<figure class="social-links"><i class="fa fa-phone"></i>{PHONE}</figure>{:IF}
                                 IF("{EMAIL}"!=""){<figure class="social-links"><i class="fa fa-envelope"></i><a href="mailto:{EMAIL}">{EMAIL}</a></figure>{:IF}
                                 IF("{ADDRESS}"!=""){<figure class="social-links"><i class="fa fa-map-marker"></i>{ADDRESS}</figure>{:IF}
                            </section>
                         </div>
                   </div>
               <div class="featured-top">
                    <div class="filter-section">
                        <div class="row">
                            <div class="col-md-6">
                                <h4>{LANG_ALL-ADS} - {USERADS}</h4>
                            </div>
                            
                            <div class="col-md-6">
                                <div class="sorting well">
                                    <div class="btn-group pull-right">
                                        <button class="btn" id="list"><i
                                                class="fa fa-th-list fa-white icon-white"></i></button>
                                        <button class="btn" id="grid"><i class="fa fa-th fa"></i></button>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>


               <div class="" id="serchlist">

<div class="searchresult list hideresult" style="display: none;">
                                    {LOOP: ITEM}
                                    <!-- quick-item -->
                                    <div class="quick-item row">
                                        <!-- item-image -->
                                        <div class="ad-listing">
                                            <div class="image bg-transfer">
                                                <figure>
                                                    <div class="item-badges">
                                                        IF("{ITEM.featured}"=="1"){ <span class="featured">{LANG_FEATURED}</span>{:IF}
                                                        IF("{ITEM.urgent}"=="1"){ <span>{LANG_URGENT}</span>{:IF}
                                                    </div>
                                                </figure>
                                                <img src="{SITE_URL}storage/products/{ITEM.picture}"
                                                     alt="{ITEM.product_name}"></div>
                                            <div class="item-info {ITEM.highlight_bg} col-sm-12">
                                                <!-- ad-info -->
                                                <div class="ad-info">
                                                    <h4 class="item-title"><a href="{ITEM.link}">{ITEM.product_name}</a>
                                                    </h4>
                                                    <ol class="breadcrumb">
                                                        <li><a href="{ITEM.catlink}">{ITEM.category}</a></li>
                                                        <li><a href="{ITEM.subcatlink}">{ITEM.sub_category}</a>
                                                        </li>
                                                    </ol>
                                                    <ul class="item-details">
                                                        <li><i class="fa fa-map-marker"></i><a href="#">{ITEM.city}</a></li>
                                                        <li><i class="fa fa-clock-o"></i>{ITEM.created_at}</li>
                                                    </ul>
                                                    IF("{ITEM.price}"!="0"){ <span class="item-price"> {ITEM.price} </span> {:IF}

                                                </div>
                                                <!-- ad-info -->
                                            </div>
                                            <!-- item-info -->
                                        </div>
                                    </div>
                                    <!-- quick-item -->
                                    {/LOOP: ITEM}
                                </div>
                                <div class="searchresult grid hideresult" style="display: none;">
                                    <div class="gird-layout my-profile">
                                        {LOOP: ITEM2}
                                        <div class="quick-item clear-left-3"><!-- item-image -->
                                            <div class="item-image-box">
                                                <div class="item-image"><a href="{ITEM2.link}"><img
                                                        src="{SITE_URL}storage/products/thumb/{ITEM2.picture}"
                                                        alt="{ITEM2.product_name}" class="img-responsive"></a>

                                                    <div class="item-badges">
                                                        IF("{ITEM2.featured}"=="1"){ <span class="featured">{LANG_FEATURED}</span>{:IF}
                                                        IF("{ITEM2.urgent}"=="1"){ <span>{LANG_URGENT}</span>{:IF}
                                                    </div>
                                                </div>
                                                <!-- item-image -->
                                            </div>
                                            <div class="item-info {ITEM2.highlight_bg}">
                                                <!-- ad-info -->
                                                <div class="ad-info">
                                                    <h4 class="item-title"><a href="{ITEM2.link}">{ITEM2.product_name}</a></h4>
                                                    <ol class="breadcrumb">
                                                        <li><a href="{ITEM2.catlink}">{ITEM2.category}</a></li>
                                                        <li><a href="{ITEM2.subcatlink}">{ITEM2.sub_category}</a></li>
                                                    </ol>
                                                    <ul class="item-details">
                                                        <li><i class="fa fa-map-marker"></i>{ITEM2.city}</li>
                                                        <li><i class="fa fa-clock-o"></i>{ITEM2.created_at}</li>
                                                    </ul>
                                                    <div class="ad-meta">
                                                        IF("{ITEM2.price}"!="0"){ <span class="item-price"> {ITEM2.price} </span> {:IF}
                                                    </div>
                                                </div>
                                                <!-- ad-info -->
                                            </div>
                                            <!-- item-info -->
                                        </div>
                                        <!-- quick-item -->
                                        {/LOOP: ITEM2}
                                        <div class="clearfix"></div>
                                    </div>
                                </div>
<script async src="https://pagead2.googlesyndication.com/pagead/js/adsbygoogle.js"></script>
<ins class="adsbygoogle"
     style="display:block"
     data-ad-format="fluid"
     data-ad-layout-key="-ew+15-n-nq+18w"
     data-ad-client="ca-pub-4591416843855967"
     data-ad-slot="5653209798"></ins>
<script>
     (adsbygoogle = window.adsbygoogle || []).push({});
</script>

<!-- Pagination-->
                                <div class="pagination-container text-center">
                                    <ul class="pagination">
                                        {LOOP: PAGES}IF("{PAGES.current}"=="0"){
                                        <li><a href="{PAGES.link}">{PAGES.title}</a></li>
                                        {:IF}IF("{PAGES.current}"=="1"){
                                        <li class="active"><a>{PAGES.title}</a></li>
                                        {:IF}{/LOOP: PAGES}
                                    </ul>
                                </div>
                                <!-- Pagination-->
                            </div>
              </div>
            </div>  
        </div>
    </div>
</section>
<!-- ad-profile-page -->
<script>var loginurl = "{LINK_LOGIN}?ref=profile.php";</script>
<!-- siyaluma all -->

</br>



<script>
    // Language Var
    var LANG_ENABLE_CHAT_YOURSELF = "{LANG_ENABLE_CHAT_YOURSELF}";
    var LANG_PREVIEW = "{LANG_PREVIEW}";
    var LANG_SEND = "{LANG_SEND}";
    var LANG_FILENAME = "{LANG_FILENAME}";
    var LANG_STATUS = "{LANG_STATUS}";
    var LANG_SIZE = "{LANG_SIZE}";
    var LANG_DRAG_FILES_HERE = "{LANG_DRAG_FILES_HERE}";
    var LANG_STOP_UPLOAD = "{LANG_STOP_UPLOAD}";
    var LANG_ADD_FILES = "{LANG_ADD_FILES}";
    var LANG_TYPE_A_MESSAGE = "{LANG_TYPE_A_MESSAGE}";
    var LANG_ADD_FILES_TEXT = "{LANG_ADD_FILES_TEXT}";
    var LANG_LOGGED_IN_SUCCESS = "{LANG_LOGGED_IN_SUCCESS}";
    var LANG_ERROR_TRY_AGAIN = "{LANG_ERROR_TRY_AGAIN}";
    var LANG_ERROR = "{LANG_ERROR}";
    var LANG_CANCEL = "{LANG_CANCEL}";
    var LANG_DELETED = "{LANG_DELETED}";
    var LANG_ARE_YOU_SURE = "{LANG_ARE_YOU_SURE}";
    var LANG_YOU_WANT_DELETE = "{LANG_YOU_WANT_DELETE}";
    var LANG_YES_DELETE = "{LANG_YES_DELETE}";
    var LANG_AD_DELETED = "{LANG_AD_DELETED}";
    var LANG_SHOW = "{LANG_SHOW}";
    var LANG_HIDE = "{LANG_HIDE}";
    var LANG_HIDDEN = "{LANG_HIDDEN}";
    var LANG_ADD_FAV = "{LANG_ADD-FAVOURITE}";
    var LANG_REMOVE_FAV = "{LANG_REMOVE-FAVOURITE}";
    var LANG_SELECT_CITY = "{LANG_SELECT_CITY}";
</script>
<!-- JS -->
<script src="{SITE_URL}templates/{TPL_NAME}/js/modernizr.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/bootstrap.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/owl.carousel.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/scrollup.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/jquery.nicescroll.min.js"></script>
<script src='{SITE_URL}templates/{TPL_NAME}/js/custom2.js' type='text/javascript'></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/custom.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/assets/plugins/datedropper/datedropper.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/assets/plugins/wickedpicker/dist/wickedpicker.min.js"></script>
<!-- Sweet-Alert  -->
<script src="{SITE_URL}templates/{TPL_NAME}/js/sweetalert/sweetalert.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/sweetalert/jquery.sweet-alert.custom.js"></script>
<script src='{SITE_URL}templates/{TPL_NAME}/js/user-ajax.js'></script>
<script src='{SITE_URL}templates/{TPL_NAME}/js/jquery.twism.js'></script>
<script type="text/javascript"
        src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script>
    /* THIS PORTION OF CODE IS ONLY EXECUTED WHEN THE USER THE LANGUAGE & THEME(CLIENT-SIDE) */
    $(function () {
        $('#lang-dropdown').on('click', '.dropdown-menu li', function (e) {
           // var lang = $(this).data('lang');
            //if (lang != null) {
               // var res = lang.substr(0, 2);
                //$('#selected_lang').html(res);
                var lang = "en"
                $.cookie('Quick_lang', lang,{ path: '/' });
               //location.reload();
           // }
        });

        $('#theme-dropdown').on('click', '.dropdown-menu li', function (e) {
            var theme = $(this).data('theme');
            var thm = theme.substr(0, theme.indexOf('-'));
            $('#selected_theme').html(thm);
            $.cookie('Quick_theme', theme,{ path: '/' });
            location.reload();
        });
    });
    $(document).ready(function () {
        var lang = $.cookie('Quick_lang');
        if (lang != null) {
            var res = lang.substr(0, 2);
            $('#selected_lang').html(res);
        }
        var theme = $.cookie('Quick_theme');
        if (theme != null) {
            var thm = theme.substr(0, theme.indexOf('-'));
            $('#selected_theme').html(thm);
        }

    });
    

				
</script>


</div>
</body></html>
