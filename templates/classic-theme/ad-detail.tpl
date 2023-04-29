<!--start header-->

<html lang="{LANG_CODE}" dir="{LANGUAGE_DIRECTION}">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    
    <title>{ITEM_TITLE} in {ITEM_COUNTRY} - Siyaluma.lk</title>
        
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Siyaluma.lk">
    <meta itemprop="datePublished" content="{ITEM_CREATED}">
    <meta name="keywords" content="classifieds,{ITEM_COUNTRY},free ads,{ITEM_SUB_CATEGORY},{ITEM_CATEGORY},{ITEM_CITY},for sale,for rent,price">
    
    <meta name="description" content="What is the price of {ITEM_TITLE} {ITEM_SUB_CATEGORY} in {ITEM_COUNTRY}? Price in {ITEM_CITY}, {ITEM_COUNTRY} is {ITEM_PRICE}. Find More {ITEM_CATEGORY} Prices...">
    
    <meta name="msvalidate.01" content="2AF0F645A14B31E97D9267A4C27C7B71" />
    <meta name="yandex-verification" content="6e34b613ef9f5a51" />
    <meta name="theme-color" content="#5e2ced"/>
    <meta property="fb:app_id" content="{FACEBOOK_APP_ID}" />
    <meta property="og:site_name" content="Siyaluma.lk" />
    <meta property="og:locale" content="en_US" />
    <meta property="og:url" content="https://www.siyaluma.lk/" />
    <meta property="og:title" content="{ITEM_TITLE}" />
    <meta property="og:description" content="Buy {ITEM_TITLE} {ITEM_SUB_CATEGORY} from {ITEM_COUNTRY}. Find The Best {ITEM_CATEGORY} For Sale in {ITEM_CITY}, {ITEM_COUNTRY}" />
    <meta property="og:type" content="website" />
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
    <meta property="twitter:title" content="Siyaluma.lk">
    <meta property="twitter:description" content="{PAGE_META_DESCRIPTION}">
    <meta property="twitter:domain" content="Siyaluma.lk">
    <meta name="twitter:image:src" content="{META_IMAGE}" />
    <link rel="shortcut icon" href="{SITE_URL}storage/logo/{SITE_FAVICON}">
    <style>
        :root {
            --theme-color: #3b5998;
        }
        .highlight-premium-ad{ background: #ffedc0 !important;}
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
    <link href="{SITE_URL}templates/{TPL_NAME}/js/sweetalert/sweetalert.css" rel="stylesheet" type="text/css">
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/assets/plugins/datedropper/datedropper.min.css">
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/assets/plugins/wickedpicker/dist/wickedpicker.min.css">


    <!-- icons -->
    <!-- HTML5 shim and Respond.js for IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
    <script src="https://oss.maxcdn.com/html5shiv/3.7.2/html5shiv.min.js"></script>
    <script src="https://oss.maxcdn.com/respond/1.4.2/respond.min.js"></script>
    <![endif]-->

    <script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/jquery-2.2.1.min.js'></script>
    <script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/jquery-migrate-1.2.1.min.js'></script>
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
    <header id="header-container">
        <div id="header">
            <div class="container">
                <div class="left-side">
                    <!-- Logo -->
                    <div id="logo">
                        <a href="{LINK_INDEX}"><img src="{SITE_URL}storage/logo/{SITE_LOGO}" alt=""></a>
                    </div>

                     IF("{COUNTRY_TYPE}"=="multi"){
                    <!-- Mobile Navigation -->
                    <button class="btn btn-primaryy hidden" id="change-city" data-toggle="modal" data-target="#countryModal">{LANG_SELECT_CITY}</span></button>

                    <div class="mmenu-trigger" id="#selectCountry" data-toggle="modal" data-target="#selectCountry">
               
                    </div>
                    {:IF}
                    
                    <div class="clearfix"></div>
                    <!-- Main Navigation / End -->

                </div>
                <!-- Right Side Content / End -->
                <div class="right-side">
                    <div class="header-widget">
                        <a href="{SITE_URL}listing" class="sign-in popup-with-zoom-anim"> <span class="all-button">Find Ads</span></a>

                        IF("{LOGGED_IN}"=="1"){
                        <!-- User Menu -->
                        <div class="user-menu">
                            <div class="user-name"><span><img src="{SITE_URL}storage/profile/{USERPIC}" alt="{USERNAME}"></span>{USERNAME}</div>
                            <ul>
                                <li><a href="{SITE_URL}myads"><i class="fa fa-th-list"></i> {LANG_MY-ADS}</a></li>
                                <li><a href="{LINK_DASHBOARD}"><i class="fa fa-user"></i> {LANG_MY-PROFILE}</a></li>
                                
                                <li><a href="{LINK_LOGOUT}"><i class="fa fa-unlock"></i> {LANG_LOGOUT}</a></li>
                            </ul>
                        </div>
                        {:IF}
                        IF("{LOGGED_IN}"=="0"){
                        <a href="#loginPopUp" class="sign-in popup-with-zoom-anim modal-trigger"><i class="fa fa-sign-in"></i> {LANG_LOGIN}</a>
                        {:IF}
                        <a href="{LINK_POST-AD}" class="button border with-icon">{LANG_POST-FREE-AD} <i class="fa fa-plus-circle"></i></a>
                        <!-- lang-dropdown -->
                        IF("{LANG_SEL}"=="1"){
                        <div class="dropdown lang-dropdown" id="lang-dropdown">
                            <button class="btn dropdown-toggle btn-default-lite" type="button" id="dropdownMenu1"
                                    data-toggle="dropdown" aria-expanded="false"><span id="selected_lang">EN</span><span
                                        class="caret"></span></button>
                            <ul class="dropdown-menu dropdown-menu-right" role="menu" aria-labelledby="dropdownMenu1">
                                {LOOP: LANGS}
                                    <li><a role="menuitem" tabindex="-1" rel="alternate" href="{LINK_INDEX}/{LANGS.code}">{LANGS.name}</a></li>
                                {/LOOP: LANGS}
                            </ul>
                        </div>
                        {:IF}
                        <!-- lang-dropdown -->
                    </div>
                </div>
            </div>
        </div>
    </header>


    <div class="clearfix"></div>
    
    
    



    <div class="modal" id="countryModal">
        <div class="modal-dialog modal-lg">
            <div class="modal-content" style="top:23px">
                <div class="quick-states" id="country-popup" data-country-id="{DEFAULT_COUNTRY_ID}" style="display: block;">
                    <div id="regionSearchBox" class="title clr">
                        <a class="closeMe icon close fa fa-close" data-dismiss="modal" title="Close"></a>

                        <div class="clr row">
    
                            <div class="locationrequest smallBox br5 col-sm-4">
                                <div class="rel input-container"><span class="watermark_container" style="display: block;">
                    <input class="light cityfield ca2" type="text" id="inputStateCity" placeholder="{LANG_TYPE_YOUR_CITY}">
                    </span>
                                    <label for="inputStateCity" class="icon locmarker2 abs"><i class="fa fa-map-marker"></i></label>

                                    <div id="searchDisplay"></div>
                                    <div class="suggest bottom abs small br3 error hidden"><span
                                                class="target abs icon"></span>

                                        <p></p>
                                    </div>
                                </div>
                                <div id="lastUsedCities" class="last-used binded" style="display: none;">{LANG_LAST_VISITED}:
                                    <ul id="last-locations-ul">
                                    </ul>
                                </div>
                            </div>
                        </div>
                    </div>

                    <div class="viewport">
                        <style>
                            .cities {
                                -webkit-column-count: 4; /* Chrome, Safari, Opera */
                                -moz-column-count: 4; /* Firefox */
                                column-count: 4;
                            }
                        </style>
                        <div class="row full" id="getCities">
                            <div class="col-sm-12 col-md-12 loader" style="display: none"></div>
                            <div id="results" class="animate-bottom">
                                <ul class="column col-md-12 col-sm-12 cities">
                                    {LOOP: STATELIST}
                                    {STATELIST.tpl}
                                    {/LOOP: STATELIST}
                                </ul>
                            </div>
                        </div>
                        <div class="table full subregionslinks hidden" id="subregionslinks"></div>
                    </div>
                </div>
            </div>
            
        </div>
    </div>
    <div id="loginPopUp" class="modal-container"><a href="#" class="modal-overlay"> {LANG_CLOSE_MODAL}</a>

        <div class="inner">
            <button class="close_modal"><i class="fa fa-remove"></i></button>
            IF("{FACEBOOK_APP_ID}{GOOGLE_APP_ID}"==""){
            <style>
                .socialLoginDivHide{display:none;}
            </style>
            {:IF}
            <div class="socialLoginDiv socialLoginDivHide">
                <div class="socialLoginHere">
                    <div class="row text-center">
                        IF("{FACEBOOK_APP_ID}"!=""){
                        <div class="col-xs-6"><a class="loginBtn loginBtn--facebook" onclick="fblogin()"><i
                                        class="fa fa-facebook"></i> <span>Facebook</span></a></div>
                        {:IF}
                        IF("{GOOGLE_APP_ID}"!=""){
                        <div class="col-xs-6"><a class="loginBtn loginBtn--google" onclick="gmlogin()"><i
                                        class="fa fa-google-plus"></i> <span>Google+</span></a></div>
                        {:IF}
                    </div>
                    <div class="clear"></div>
                </div>
                <span class="split-opt">or</span>
            </div>
            <div class="modal-content signin text-center">
                <div id="login-status" class="info-notice" style="display: none;margin-bottom: 20px">
                    <div class="content-wrapper">
                        <div id="login-detail">
                            <div id="login-status-icon-container"><span class="login-status-icon"></span></div>
                            <div id="login-status-message">{LANG_AUTHENTICATING}...</div>
                        </div>
                    </div>
                </div>
                <form action="ajaxlogin" id="lg-form">
                    <header>
                        <h4>{LANG_WELCOME_BACK}!</h4>

                        <p>{LANG_ENTER_DETAILS}</p>
                    </header>
                    <div class="field-block">
                        <div class="labeled-input">
                            <input type="text" id="username" placeholder="{LANG_USERNAME} / {LANG_EMAIL}">
                        </div>
                    </div>
                    <div class="field-block">
                        <div class="labeled-input">
                            <input id="password" type="password" placeholder="{LANG_PASSWORD}">
                        </div>
                    </div>
                    <div class="text-center"><a href="{LINK_LOGIN}?fstart=1">{LANG_FORGOTPASS}?</a></div>
                    <button id="login" href="#" class="btn field-block">{LANG_LOGIN}</button>
                    <div class="login-cta text-center">
                        <p>{LANG_FORGOTPASS}?</p>
                        <a href="{LINK_SIGNUP}">{LANG_CREATE-NEW-ACCOUNT}</a></div>
                </form>
            </div>
        </div>
    </div>
    <!--*********************************Modals*************************************-->

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




<!--end header-->





<link href="{SITE_URL}templates/{TPL_NAME}/css/user-html.css" rel="stylesheet" type="text/css"/>
<link href="{SITE_URL}plugins/starreviews/assets/css/starReviews.css" rel="stylesheet" type="text/css"/>
<section id="main" class="clearfix details-page">
    <div class="container" id="serchlist">
        <div class="breadcrumb-section">
            <ol class="breadcrumb">
                <li><a href="{LINK_LISTING}"><i class="fa fa-home"></i>All Ads</a></li>
                <li><a href="{ITEM_CITY}">{ITEM_CITY}</a></li>
                <li><a href="{ITEM_CATLINK}">{ITEM_CATEGORY}</a></li>
                <li class="active">{ITEM_SUB_CATEGORY}</li>
                <!--<div class="pull-right back-result"><a href="{LINK_LISTING}"><i class="fa fa-angle-double-left"></i>{LANG_BACK-RESULT}</a></div>-->
            </ol>
        </div>
        
        
        
        <div class="section slider">
            <div class="row"><!-- carousel -->
                <div class="col-md-8">
                    <div class="ad-details">

                        <h3 class="title">{ITEM_TITLE}
                            <span class="label-wrap hidden-sm hidden-xs">
                            IF("{ITEM_FEATURED}"=="1"){ <span class="label featured"> {LANG_FEATURED}</span> {:IF}
                            IF("{ITEM_URGENT}"=="1"){ <span class="label urgent"> {LANG_URGENT}</span> {:IF}
                            IF("{ITEM_HIGHLIGHT}"=="1"){ <span class="label highlight"> {LANG_HIGHLIGHT}</span> {:IF}
                            </span>
                        </h3>
                        <span class="icon"><i class="fa fa-clock-o"></i><a href="#">{ITEM_CREATED}</a></span>
                        <span class="icon"><i class="fa fa-map-marker"></i><a href="#">{ITEM_CITY}, {ITEM_COUNTRY}</a></span>
                        <span class="icon"><i class="fa fa-eye"></i><a href="#">{LANG_AD-VIEWS}:{ITEM_VIEW}</a></span>
                        <!--<span> {LANG_AD-ID}:<a href="#" class="time"> {ITEM_ID}</a></span>-->
                    </div>

                    IF("{SHOW_IMAGE_SLIDER}"=="1"){
                    <figure class="ad-detail-page">
                        <div id="product-carousel" class="carousel slide" data-ride="carousel" style="position: inherit">

                            <!-- Wrapper for slides -->
                            <!--<?php
                            if("{ITEM_PRICE}"!="0"){
                                echo '<div class="ribbon ribbon-clip ribbon-reverse"><span class="ribbon-inner">{ITEM_PRICE}</span></div>';
                            }
                            ?>-->
                            <div class="carousel-inner" role="listbox">{ITEM_SCREENS_CLASSB}

                                <!-- Controls -->
                                <a class="left carousel-control" href="#product-carousel" role="button" data-slide="prev"><i class="fa fa-chevron-left"></i></a>
                                <a class="right carousel-control" href="#product-carousel" role="button" data-slide="next"><i class="fa fa-chevron-right"></i></a>
                                <!-- Controls -->
                            </div>
                            <!-- carousel-inner -->

                            <!-- Indicators -->
                            <ol class="carousel-indicators">
                                {ITEM_SCREENS_CLASSSM}
                            </ol>
                        </div>

                    </figure>
                    {:IF}

                    <div class="contact-advertiser visible-sm visible-xs text-center">
                        <!--<div class="aside-header">Contact advertiser</div>
                         IF("{ITEM_HIDE_PHONE}"=="no"){
                          <a href="tel:{ITEM_PHONE}" class="btn btn-phone"><i class="fa fa-phone"></i>{ITEM_PHONE}</a>
                        {:IF}
                        IF("{ITEM_HIDE_PHONE2}"=="no"){
                         <a href="tel:{ITEM_PHONE2}" class="btn btn-phone"><i class="fa fa-phone"></i>{ITEM_PHONE2}</a>
                        {:IF}-->
                        
                                                      <div class="social-links text-center">
                                    <h4>{LANG_SHARE-AD}</h4>

                                    <div class="social-share"></div>
                                    <!--end social-->
                                </div>
                        
                    </div>
                    
                    
                                
                    <div class="description-info">
                        <div class="ads-details">

                            <!-- Tab panes -->
                            <div class="tab-content">
                                <div class="tab-pane active" id="tab-details">
                                    
                                    
                                    <?php
                            if("{ITEM_PRICE}"!="0"){
                                echo '<div class="ribbon ribbon-clip ribbon-reverse"><span class="ribbon-inner">{ITEM_PRICE}</span></div>';
                            }
                            ?>
                            

                            
                                                            <div class="contact-advertiser text-center">
                                    <h4>Contact Advertiser</h4>
                                     IF("{ITEM_HIDE_PHONE}"=="no"){
                                      <a  class="btn btn-phone" href="tel:{ITEM_PHONE}"><i class="fa fa-phone"></i>{ITEM_PHONE}</a>
                                    {:IF}
                                    IF("{ITEM_HIDE_PHONE2}"=="no"){
                                     <a  class="btn btn-phone"  href="tel:{ITEM_PHONE2}"><i class="fa fa-phone"></i>{ITEM_PHONE2}</a>
                                    {:IF}
                                </div>

                                    
                                    
                                    IF("{ITEM_CUSTOMFIELD}"!="0"){
                                    <div class="quick-info">
                                        <div class="detail-title">
                                            <h2 class="title-left">{ITEM_TITLE}</h2>
                                        </div>
                                        <ul class="clearfix">
                                            {LOOP: ITEM_CUSTOM}
                                                <li>
                                                    <div class="inner clearfix"><span class="label">{ITEM_CUSTOM.title}</span><span
                                                                class="desc">{ITEM_CUSTOM.value}</span></div>
                                                </li>
                                            {/LOOP: ITEM_CUSTOM}
                                        </ul>
                                    </div>
                                    {:IF}
                                    {LOOP: ITEM_CUSTOM_TEXTAREA}
                                        <div class="text-widget">
                                            <div class="detail-title">
                                                <h2 class="title-left">{ITEM_CUSTOM_TEXTAREA.title}</h2>
                                            </div>
                                            <div class="inner">
                                                <div class="user-html">{ITEM_CUSTOM_TEXTAREA.value}</div>
                                            </div>
                                        </div>
                                    {/LOOP: ITEM_CUSTOM_TEXTAREA}

                                    {LOOP: ITEM_CUSTOM_CHECKBOX}
                                        <div class="text-widget">
                                            <div class="detail-title">
                                                <h2 class="title-left">{ITEM_CUSTOM_CHECKBOX.title}</h2>
                                            </div>
                                            <div class="inner row">{ITEM_CUSTOM_CHECKBOX.value}</div>
                                        </div>
                                    {/LOOP: ITEM_CUSTOM_CHECKBOX}

                                    <div class="description">
                                        <!--<div class="detail-title">
                                            <h2 class="title-left">{LANG_DESCRIPTION}</h2>
                                        </div>-->
                                        <div class="user-html">{ITEM_DESC}</div>
                                        

                                        
                                        <div class="detail-title">
                                            <h2 class="title-left">FAQ</h2>
                                        </div>
                                        <div class="user-html"><h4>What is the price?</h4> <h5>{ITEM_PRICE}</h5></div>
                                        <div class="user-html"><h4>Where could I get?</h4> <h5>{ITEM_CITY}, {ITEM_COUNTRY}</h5></div>
                                        <div class="user-html"><h4>How Can I Contact?</h4> <h5>Call {ITEM_PHONE}. {ITEM_PHONE2}</h5></div>
                                        <div class="user-html"><h4>How to buy safe?</h4> <h5>Always meet in person to inspect the item and exchange money. Never send or wire money to someone you don't know</h5></div>
                                        <div class="user-html"><h4>Details are wrong. What can I do next?</h4><h5> <a href="{LINK_REPORT}">{LANG_REPORT-THIS-AD}</a></h5></div>
                                        
                                        
                                        
                                        
                                        <!-- <p class="show-more"></p>
                                        <a href="#" class="show-more-button" data-more-title="{LANG_SHOW-MORE}"
                                           data-less-title="{LANG_SHOW-LESS}"><i class="fa fa-angle-down"></i></a> -->
                                    </div>
                                    
                                    
         
         











                                    IF("{SHOW_TAG}"=="1"){
                                    <div class="text-widget">
                                        <div class="detail-title">
                                            <h2 class="title-left">{LANG_PRODUCT-TAG}</h2>
                                        </div>
                                        <div class="inner">
                                            <ul class="tags">
                                                {ITEM_TAG}
                                            </ul>
                                        </div>
                                    </div>
                                    {:IF}


                                </div>

                                <div class="reviews-widget tab-pane" id="tab-reviews">
                                    <!-- **** Start reviews **** -->
                                    <div class="starReviews text-widget">
                                        <!-- This is where your product ID goes -->
                                        <div id="review-productId" class="review-productId" style="">{ITEM_ID}</div>
                                        <!-- Show current reviews -->
                                        <div class="show-reviews">
                                            <div class="loader" style="margin: 0 auto;"></div>
                                        </div>
                                        <hr>

                                        IF("{LOGGED_IN}"=="0"){
                                        <div style="padding-top: 10px"><a class="modal-trigger btn btn-primary" href="#loginPopUp">{LANG_LOGINTOREVIEW}</a></div>
                                        {:IF}
                                        IF("{LOGGED_IN}"=="1"){
                                        <!-- Add new review -->
                                        <div class="add-review"></div>
                                        {:IF}

                                        <script type="text/javascript">
                                            var LANG_ADDREVIEWS     = "{LANG_ADDREVIEWS}";
                                            var LANG_SUBMITREVIEWS  = "{LANG_SUBMITREVIEWS}";
                                            var LANG_HOW_WOULD_RATE = "{LANG_HOW_WOULD_RATE}";
                                            var LANG_REVIEWS        = "{LANG_REVIEWS}";
                                            var LANG_YOURREVIEWS    = "{LANG_YOURREVIEWS}";
                                            var LANG_ENTER_REVIEW   = "{LANG_ENTER_REVIEW}";
                                            var LANG_STAR           = "{LANG_STAR}";
                                        </script>

                                    </div>

                                    <!-- **** End reviews **** -->
                                </div>


                            </div>
                            <!-- /.tab content -->

                        </div>
                    </div>
                </div>
                <!-- Controls -->
                <!-- slider-text -->
                <div class="col-md-4">
                    <div class="ad-details">
                        
                        
                        
                        
                        
                        
                                                <div class="aside  margin-top-20">
                            <div class="aside-header">Member</div>
                            <div class="aside-body text-center">
                                <!-- short-info -->
                                <div class="user-info ">
                                    <div class="profile-picture">
                                        <img width="70px" style="min-height:73px" src="{SITE_URL}storage/profile/{ITEM_AUTHORIMG}" alt="{ITEM_AUTHORUNAME}">
                                    </div>
                                    <h4><a href="{ITEM_AUTHORLINK}"> {ITEM_AUTHORNAME} IF("{ITEM_AUTHORNAME}"==""){ {ITEM_AUTHORUNAME} {:IF}</a>
                                        IF("{SUB_IMAGE}"!=""){
                                        <img src="{SUB_IMAGE}" alt="{SUB_TITLE}" title="{SUB_TITLE}" width="24px"/>
                                        {:IF}
                                    </h4>
                                </div>
                                <!-- short-info -->

                                <!-- contact-advertiser -->
                                <div class="contact-advertiser">
                                    <a href="#" class="btn btn-outline" data-toggle="modal" data-target="#emailToSeller"><i class="fa fa-envelope"></i>Send a Message</a>
                                </div>
                                <!-- contact-advertiser -->


                            </div>
                        </div>

                        
                        
                        
                        
                        

                        <!-- short-info --
                        <div class="aside margin-top-20 hidden-xs hidden-md">
                            <div class="aside-body ">
                                <div class="more-info">
                                
                                <div class="contact-advertiser text-center">
                                    <h4>Contact Advertiser</h4>
                                     IF("{ITEM_HIDE_PHONE}"=="no"){
                                      <a  class="btn btn-phone" href="tel:{ITEM_PHONE}"><i class="fa fa-phone"></i>{ITEM_PHONE}</a>
                                    {:IF}
                                    IF("{ITEM_HIDE_PHONE2}"=="no"){
                                     <a  class="btn btn-phone"  href="tel:{ITEM_PHONE2}"><i class="fa fa-phone"></i>{ITEM_PHONE2}</a>
                                    {:IF}
                                </div>
                                
                                --social-links--
                                <div class="social-links text-center">
                                    <h4>{LANG_SHARE-AD}</h4>

                                    <div class="social-share"></div>
                                    --end social--
                                </div>
                               -- social-links--
                                
                                    -- social-icon --
                                    <ul id="set-favorite">
                                        <li><a href="#" data-item-id="{ITEM_ID}" data-userid="{USER_ID}"
                                               data-action="setFavAd" class="fav_{ITEM_ID} fa fa-heart IF("
                                            {ITEM_FAVORITE}"=="1"){ active {:IF}"><span
                                                    style="font-family: 'Open Sans', sans-serif;color: #707070;font-size: 15px;">{LANG_SAVE-AS-FAVOURITE}</span></a>
                                        </li>
                                    </ul>
                                    <ul>
                                        <li><i class="fa fa-exclamation-triangle"></i><a href="{LINK_REPORT}">{LANG_REPORT-THIS-AD}</a>
                                        </li>
                                    </ul>
                                    -- social-icon --
                                </div>
                            </div>
                        </div>
                        -- short-info --> 
                        

                        
        




                        
                        
                        <!-- Rating-info -->
                        <div class="aside margin-top-20">
                            <div class="aside-body ">


                                        <!-- Show average-rating -->
                                        <div>

</div>

                            </div>
                        </div>
                        <!-- Rating-info -->


                        
                        <!-- short-info -->
                        <!--<div class="aside margin-top-20">
                            <div class="aside-body ">
                                <div class="more-info">
                                    <h4><i class="fa fa-shield"></i>  Safety and security tips</h4>
                                     <p class="security-tips-description">Always meet in person to inspect the item and exchange money. Never send or wire money to someone you don't know</p>
                                </div>
                            </div>
                        </div>-->
                        <!-- short-info -->
                        
                        
                        
                                                         <!-- short-info -->
                        <div class="aside margin-top-20 hidden-xs hidden-md">
                            <div class="aside-body ">
                                <div class="more-info">
                                
                                <!-- social-links -->
                                <div class="social-links text-center">
                                    <h4>{LANG_SHARE-AD}</h4>

                                    <div class="social-share"></div>
                                    <!--end social-->
                                </div>
                                <!-- social-links -->
                                
                                <!-- social-icon -->
                                    <ul id="set-favorite">
                                        <li><a href="#" data-item-id="{ITEM_ID}" data-userid="{USER_ID}"
                                               data-action="setFavAd" class="fav_{ITEM_ID} fa fa-heart IF("
                                            {ITEM_FAVORITE}"=="1"){ active {:IF}"><span
                                                    style="font-family: 'Open Sans', sans-serif;color: #707070;font-size: 15px;">{LANG_SAVE-AS-FAVOURITE}</span></a>
                                        </li>
                                    </ul>
                                    <ul>
                                        <li><i class="fa fa-exclamation-triangle"></i><a href="{LINK_REPORT}">{LANG_REPORT-THIS-AD}</a>
                                        </li>
                                    </ul>
                                    <!-- social-icon -->

                                
                                </div>
                            </div>
                        </div>
                        <!-- short-info -->


                        
                    </div>
                </div>
                <!-- slider-text -->
        </div>
    </div>





    <!-- slider -->

    <!-- featured-slide -->
    <div class="section recommended-ads">
        <div class="row">
            <div class="col-sm-12">
                <div class="featured-top">
                    <h4>{LANG_RECOMMENDED-ADS}</h4>
                </div>
            </div>
        </div>
        <!-- featured-slider -->
        <div class="recommended-slider">
            <div id="recommended-slider-id">
                {LOOP: ITEM}
                    <!-- quick-item -->
                    <div class='quick-item IF(" {ITEM.highlight}"=="1"){ highlight {:IF}'>
                        <!-- item-image -->
                        <div class="item-image-box">
                            <div class="item-image">
                                <a href="{ITEM.link}"><img src="{SITE_URL}storage/products/thumb/{ITEM.picture}" alt="{ITEM.product_name}" class="img-responsive"></a>
                                <div class="item-badges">
                                    IF("{ITEM.featured}"=="1"){ <span class="featured">{LANG_FEATURED}</span> {:IF}
                                    IF("{ITEM.urgent}"=="1"){ <span>{LANG_URGENT}</span> {:IF}
                                </div>
                            </div>
                        </div>
                        <!-- item-image -->
                        <div class="item-info"><!-- ad-info -->
                            <div class="ad-info">
                                <h4 class="item-title"><a href="{ITEM.link}">{ITEM.product_name}</a></h4>
                                <ol class="breadcrumb">
                                    <li><a href="{ITEM.catlink}">{ITEM.category}</a></li>
                                </ol>
                                <ul class="item-details">
                                    <li><i class="fa fa-map-marker"></i><a href="{ITEM.citylink}">{ITEM.cityname}, {ITEM.country}</a></li>
                                    <li><i class="fa fa-clock-o"></i>{ITEM.created_at}</li>
                                </ul>
                                <div class="ad-meta">
                                    IF("{ITEM.price}"!="0"){ <span class="item-price"> {ITEM.price} </span> {:IF}
                                    <ul class="contact-options pull-right" id="set-favorite">
                                        <li><a href="#" data-item-id="{ITEM.id}" data-userid="{USER_ID}"
                                               data-action="setFavAd" class="fav_{ITEM.id} fa fa-heart IF("{ITEM.favorite}"=="1"){ active {:IF}"></a></li>
                                    </ul>
                                </div>
                            </div>
                            <!-- ad-info -->
                        </div>
                        <!-- item-info -->
                    </div>
                    <!-- quick-item -->
                {/LOOP: ITEM}
            </div>
        </div>
        <!-- #featured-slider -->
    </div>
    <!-- featured -->
    </div>
    <!-- container -->
</section>
<!-- main -->
<!-- Modal -->
<div id="emailToSeller" class="modal fade" role="dialog">
    <div class="modal-dialog"><!-- Modal content-->
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal">&times;</button>
                <h4 class="modal-title">{LANG_SEND-MAIL} {LANG_TO} {ITEM_AUTHORUNAME}</h4>
            </div>
            <div class="modal-body">
                <div class="alert alert-success" id="email_success" style="display: none">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    {LANG_MAILSENTTOSELLER}
                </div>
                <div class="alert alert-danger" id="email_error" style="display: none">
                    <button type="button" class="close" data-dismiss="alert" aria-hidden="true">×</button>
                    {LANG_ERROR_TRY_AGAIN}
                </div>
                <div class="feed-back-form">
                    <form method="post" id="email_contact_seller" action="email_contact_seller">
                        <div id="post_loading" class="loader" style="display: none;margin: 0 auto;"></div>
                        <input type="text" class="form-control" name="name" placeholder="Full Name" required=""
                               style="width: 100%">
                        <input type="text" class="form-control" name="email" placeholder="Email" required=""
                               style="width: 100%">
                        <input type="text" class="form-control" name="phone" placeholder="Phone No" style="width: 100%">
                        <!---728x90--->
                        <span>{LANG_MESSAGE} ?</span>
                        <textarea type="text" class="form-control" name="message" placeholder="{LANG_ENTER-YOUR-MESSAGE}..." required=""
                                  rows="2" style="width: 100%;height: 100px"></textarea>
                        <input type="hidden" class="form-control" name="id" value="{ITEM_ID}">
                        <input type="hidden" class="form-control" name="sendemail" value="1">
                        <input type="submit" class="btn btn-outline" value="{LANG_SEND-MAIL}">
                    </form>
                </div>
            </div>
        </div>
    </div>
</div>
<script>
    $("#email_contact_seller").on('submit', function() {

        $('#email_contact_seller #post_loading').show();
        var action = $("#email_contact_seller").attr('action');
        var form_data = $(this).serialize();

        $.ajax({
            type: "POST",
            url: ajaxurl+'?action='+action,
            data: form_data,
            success: function (response) {
                if (response == "success") {
                    $('#email_success').show();
                }
                else {
                    $('#email_error').show();
                }
                $('#email_contact_seller #post_loading').hide();
            }
        });
        return false;
    });

    $('.show-more-button').on('click', function (e) {
        e.preventDefault();
        $(this).toggleClass('active');
        $('.show-more').toggleClass('visible');
        if ($('.show-more').is(".visible")) {
            var el = $('.show-more'),
                    curHeight = el.height(),
                    autoHeight = el.css('height', 'auto').height();
            el.height(curHeight).animate({
                height: autoHeight
            }, 400);
        } else {
            $('.show-more').animate({
                height: '100px'
            }, 400);
        }
    });
</script>
<script type="text/javascript">
    var _latitude = {ITEM_LAT};
    var _longitude = {ITEM_LONG};
    var site_url = '{SITE_URL}';
    var color = '{MAP_COLOR}';
    var path = '{SITE_URL}templates/{TPL_NAME}';
    var element = "map-detail";
    //simpleMap(_latitude, _longitude, element);


    function socialShare() {
        var socialButtonsEnabled = 1;
        if (socialButtonsEnabled == 1) {
            $('head').append($('<link rel="stylesheet" type="text/css">').attr('href', 'https://cdn.jsdelivr.net/jquery.jssocials/1.4.0/jssocials.css'));
            $('head').append($('<link rel="stylesheet" type="text/css">').attr('href', 'https://cdn.jsdelivr.net/jquery.jssocials/1.4.0/jssocials-theme-flat.css'));
            $.getScript("{SITE_URL}templates/{TPL_NAME}/assets/plugins/social-share/jssocials.min.js", function (data, textStatus, jqxhr) {
                $(".social-share").jsSocials({
                    showLabel: false,
                    showCount: false,
                    shares: ["twitter", "facebook", "googleplus", "pinterest"]
                });
            });
        }
    }
    //  Social Share -------------------------------------------------------------------------------------------------------
    if ($(".social-share").length) {
        socialShare();
    }

    var loginurl = "{LINK_LOGIN}?ref=listing";
</script>



{OVERALL_FOOTER}
<!-- jQuery Form Validator -->
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery-form-validator/2.1.34/jquery.form-validator.min.js"></script>

<!-- jQuery Barrating plugin -->
<script src="{SITE_URL}plugins/starreviews/assets/js/jquery.barrating.js"></script>

<!-- jQuery starReviews -->
<script src="{SITE_URL}plugins/starreviews/assets/js/starReviews.js"></script>

<script type="text/javascript">

    $(document).ready(function () {

        /* Activate our reviews */
        $().reviews('.starReviews');

    });

</script>