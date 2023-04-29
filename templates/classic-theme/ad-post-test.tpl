<!DOCTYPE html>
<html lang="{LANG_CODE}" dir="{LANGUAGE_DIRECTION}">

<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    <title>{PAGE_TITLE} - {SITE_TITLE}</title>
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="{SITE_TITLE}">
    <meta name="keywords" content="{META_KEYWORDS}">
    <meta name="description" content="{META_DESCRIPTION}">

    <meta property="fb:app_id" content="{FACEBOOK_APP_ID}" />
    <meta property="og:site_name" content="{SITE_TITLE}" />
    <meta property="og:locale" content="en_US" />
    <meta property="og:url" content="{LINK_POST-AD}" />
    <meta property="og:title" content="{PAGE_TITLE}" />
    <meta property="og:description" content="{META_DESCRIPTION}" />
    <meta property="og:type" content="website" />
    <meta property="twitter:card" content="summary">
    <meta property="twitter:title" content="{PAGE_TITLE}">
    <meta property="twitter:description" content="{META_DESCRIPTION}">
    <meta property="twitter:domain" content="{SITE_URL}">
    <link rel="shortcut icon" href="{SITE_URL}storage/logo/{SITE_FAVICON}">

    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/bootstrap.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.0/css/bootstrap-datepicker.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.0/css/bootstrap-datepicker.css.map">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.0/css/bootstrap-datepicker.min.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.6.0/css/bootstrap-datepicker.min.css.map">


    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/css/bootstrap-timepicker.css">
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/css/bootstrap-timepicker.min.css">




    <!-- Render-blocking styles -->
    <link href="{SITE_URL}templates/{TPL_NAME}/css/post-ad/base.css" type="text/css" rel="stylesheet" />
    <link href="{SITE_URL}templates/{TPL_NAME}/css/post-ad/PageLoggedOutPostAd.css" type="text/css" rel="stylesheet" />
    <link href="{SITE_URL}templates/{TPL_NAME}/css/post-ad/styles.css" type="text/css" rel="stylesheet">
    <link href="{SITE_URL}templates/{TPL_NAME}/css/post-ad/ModalDeferredLogin.less" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/main.css">
    <link href="{SITE_URL}templates/{TPL_NAME}/css/post-ad/file-uploader.css" type="text/css" rel="stylesheet" />
    <link href="{SITE_URL}templates/{TPL_NAME}/css/post-ad/checkbox-radio.css" type="text/css" rel="stylesheet">
    <link href="{SITE_URL}templates/{TPL_NAME}/css/post-ad/category-modal.css" type="text/css" rel="stylesheet">
    <link href="{SITE_URL}templates/{TPL_NAME}/css/post-ad/owl.post.carousel.css" type="text/css" rel="stylesheet">
    <link href="{SITE_URL}templates/{TPL_NAME}/css/post-ad/loader.css" type="text/css" rel="stylesheet">
    <link href="{SITE_URL}templates/{TPL_NAME}/css/select2.css" type="text/css" rel="stylesheet">
    <link href="{SITE_URL}templates/{TPL_NAME}/css/select2-bootstrap.css" type="text/css" rel="stylesheet">
    <link href="{SITE_URL}templates/{TPL_NAME}/css/flags/flags.min.css" type="text/css" rel="stylesheet">
    

    <!-- Template Developed By Bylancer -->
    <script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/jquery-2.2.1.min.js'></script>
    

    IF("{LANGUAGE_DIRECTION}"=="rtl"){
    <link href="{SITE_URL}templates/{TPL_NAME}/css/post-ad/post-rtl.css" type="text/css" rel="stylesheet">
    <link rel="stylesheet" href="{SITE_URL}templates/{TPL_NAME}/css/bootstrap-rtl.min.css">
    {:IF}
    <!-- orakuploader -->
    <link type="text/css" href="{SITE_URL}plugins/orakuploader/orakuploader.css" rel="stylesheet" />
    <script type="text/javascript" src="{SITE_URL}plugins/orakuploader/jquery.min.js"></script>
    <script type="text/javascript" src="{SITE_URL}plugins/orakuploader/jquery-ui.min.js"></script>
    <script type="text/javascript" src="{SITE_URL}plugins/orakuploader/orakuploader.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.8.0/js/bootstrap-datepicker.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/js/bootstrap-timepicker.min.js"></script>
    <script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-timepicker/0.5.2/js/bootstrap-timepicker.js"></script>
    IF("{LANGUAGE_DIRECTION}"=="rtl"){
    <link type="text/css" href="{SITE_URL}plugins/orakuploader/orakuploader-rtl.css" rel="stylesheet" />
    {:IF}
    <!-- orakuploader -->
    IF("{POST_WATERMARK}"=="1"){
    <script>
        var watermark_image = 'storage/logo/watermark.png';
    </script>
    {:IF}
    IF("{POST_WATERMARK}"=="0"){
    <script>
        var watermark_image = '';
    </script>
    {:IF}
    <script>
        var ajaxurl = "{APP_URL}user-ajax.php";
        var lang_edit_cat = "{LANG_EDIT_CATEGORY}";
        var lang_upload_images = "{LANG_UPLOAD_IMAGES}";
        var siteurl = '{SITE_URL}';
        var template_name = '{TPL_NAME}';
        var max_image_upload = '{MAX_IMAGE_UPLOAD}';

        // Language Var
        var LANG_MAIN_IMAGE = "{LANG_MAIN_IMAGE}";
        var LANG_LOGGED_IN_SUCCESS = "{LANG_LOGGED_IN_SUCCESS}";
        var LANG_ERROR_TRY_AGAIN = "{LANG_ERROR_TRY_AGAIN}";
        var LANG_HIDDEN = "{LANG_HIDDEN}";
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
        $(document).ready(function(){
            // -------------------------------------------------------------
            //  Intialize orakuploader
            // -------------------------------------------------------------
            $('#item_screen').orakuploader({
                site_url :  siteurl,
                orakuploader_path : 'plugins/orakuploader/',
                orakuploader_main_path : 'storage/products',
                orakuploader_thumbnail_path : 'storage/products/thumb',
                orakuploader_add_image : siteurl+'plugins/orakuploader/images/add.svg',
                orakuploader_watermark : watermark_image,
                orakuploader_add_label : lang_upload_images,
                orakuploader_use_main : true,
                orakuploader_use_sortable : true,
                orakuploader_use_dragndrop : true,
                orakuploader_use_rotation: true,
                orakuploader_resize_to : 400,
                orakuploader_thumbnail_size  : 250,
                orakuploader_maximum_uploads : max_image_upload,
                orakuploader_max_exceeded : max_image_upload,
                orakuploader_hide_on_exceed : true,
                orakuploader_main_changed    : function (filename) {
                    $("#mainlabel-images").remove();
                    $("div").find("[filename='" + filename + "']").append("<div id='mainlabel-images' class='maintext'>Main Image</div>");
                },
                orakuploader_max_exceeded : function() {
                    alert("You exceeded the max. limit of "+max_image_upload+" images.");
                }
            });
        });
    </script>
    <script>
        $('body').toggleClass('loaded');
        $(document).ready(function() {
            setTimeout(function(){
                $('body').addClass('loaded');
            }, 3000);

        });
    </script>
    <script>
        $( document ).ready(function() {
            $("#from-datepicker").datepicker({ 
                format: 'yyyy-mm-dd',
                todayBtn: "linked",
                clearBtn: true,
                todayHighlight: true
            });
            
            $("#from-timepicker").timepicker({ 
                format: 'hh:ii',
                showSeconds : true
            });
            
            
        }); 
    </script>
    
    
</head>

<body data-role="page" class="{LANGUAGE_DIRECTION}">

    <!-- /.modal -->

    <!-- Header Container
     ================================================== -->
    <header id="header-container">

        <!-- Header -->
        <div id="header">
            <div class="container">
               <button class="btn btn-primaryy hidden" id="change-city" data-toggle="modal" data-target="#countryModal">Select City</span></button>
                <!-- Left Side Content -->
                <div class="left-side">
                    <!-- Logo -->
                    <div id="logo">
                        <a href="{LINK_INDEX}"><img src="{SITE_URL}storage/logo/{SITE_LOGO}" alt=""></a>
                        <span class="hotline"><i class="fa fa-phone"></i> 0702766942</span>
                    </div>
                    <div class="clearfix"></div>
                    <!-- Main Navigation / End -->

                </div>
                <!-- Left Side Content / End -->


                <!-- Right Side Content / End -->
                <div class="right-side">
                    <div class="header-widget">
                        <a href="{SITE_URL}listing" class="sign-in popup-with-zoom-anim"> <span class="all-button">All Ads</span></a>
                        IF("{LOGGED_IN}&{WCHAT}"=="1&on"){
                        <a href="{LINK_MESSAGE}" class="sign-in popup-with-zoom-anim"><i class="fa fa-envelope"></i> <span class="hidden-xs">{LANG_MESSAGE}</span></a>
                        {:IF}
                        IF("{LOGGED_IN}"=="1"){
                        <!-- User Menu -->
                        <div class="user-menu">
                            <div class="user-name">{USERNAME}</div>
                             <ul>
                                <li><a href="{SITE_URL}myads"><i class="fa fa-th-list"></i> {LANG_MY-ADS}</a></li>
                                <li><a href="{LINK_DASHBOARD}"><i class="fa fa-user"></i> {LANG_MY-PROFILE}</a></li>
                                <li><a href="{LINK_LOGOUT}"><i class="fa fa-unlock"></i> {LANG_LOGOUT}</a></li>
                            </ul>
                        </div>
                        {:IF}
                        IF("{LOGGED_IN}"=="0"){
                        <a href="login" class="sign-in popup-with-zoom-anim"><i class="fa fa-sign-in"></i> {LANG_LOGIN}</a>
                        <a href="signup" class="sign-in popup-with-zoom-anim"> {LANG_REGISTER}</a>
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
                <!-- Right Side Content / End -->
            </div>
        </div>
        <!-- Header / End -->

    </header>
    
    <div class="clearfix"></div>
    <!-- Header Container / End -->
    <!-- Change Country Modal -->
    <!-- Select Category Modal -->
    <div class="modal fade tg-thememodal tg-categorymodal" tabindex="-1" role="dialog">
        <div class="modal-dialog tg-thememodaldialog" role="document">
            <button type="button" id="dismiss-modal" class="tg-close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
            <div class="modal-content tg-thememodalcontent">
                <div class="tg-title">
                    <strong>{LANG_SELECT-CATEGORY} දැන්වීම් වර්ගය තෝරන්න</strong>
                </div>
                <div id="tg-dbcategoriesslider" class="tg-dbcategoriesslider tg-categories owl-carousel select-category post-option">
                    {LOOP: CATEGORY}
                    <div class="tg-category {CATEGORY.selected}" data-ajax-catid="{CATEGORY.id}" data-ajax-action="getsubcatbyidList" data-cat-name="{CATEGORY.name}">
                        <div class="tg-categoryholder">
                            <div><i class="{CATEGORY.icon}"></i> </div>
                            <h3><a href="#">{CATEGORY.name}</a></h3>
                        </div>
                    </div>
                    {/LOOP: CATEGORY}

                </div>
                <ul class="tg-subcategories" style="display: none">
                    <li>
                        <div class="tg-title">
                            <strong>{LANG_SELECT-SUBCATEGORY}</strong>
                            <div id="sub-category-loader" style="visibility:hidden"></div>
                        </div>
                        <div class=" tg-verticalscrollbar tg-dashboardscrollbar">
                            <ul id="sub_category">

                            </ul>
                        </div>
                    </li>
                </ul>
            </div>
        </div>
    </div>
    <!-- Select Category Modal -->
    <!-- Link to existing Quickad account -->
    <div class="quickad-template">
        <div class="responsive-modal hide" id="post_ad_email_exist">
            <section class="FacebookSignUpModal modal fb-bs-identifier">
                <header class="FacebookSignUpModal-header modal-header">
                    <a class="close FacebookSignUpModal-close close-fb-modal-bs" data-dismiss="modal">
                        <span>&times;</span>
                    </a>
                    <h3 id="link_account_welcome" class="FacebookSignUpModal-heading" style="display: block">
                        {LANG_LINK_EXIST_ACCOUNT}
                    </h3>
                    <h3 id="link_account_success" class="FacebookSignUpModal-heading" style="display: none">
                        {LANG_LINK_ACCOUNT_SUCCESS}
                    </h3>
                    <div id="link_account_error" class="FacebookSignUpModal-heading text-danger" style="display: none">{LANG_USERNOTFOUND}</div>
                </header>

                <div class="modal-body" id="fb-modal-body">
                    <div class="FacebookSignUpModal-content">
                        <div id="post_loading" class="modal-loader Loader Loader--full" style="display: none"></div>

                        <!-- Link To Existing Account -->
                        <form class="FacebookSignUpModal-form fl-form" style="display:block">
                            <div class="form-step">
                                <p>
                                    <span id="quickad_email_already_linked"></span>
                                    <br>
                                    <span>{LANG_ENTER_PASS_LINK_AC}</span>
                                </p>
                            </div>
                            <div class="form-step">
                                <label>{LANG_USERNAME}:</label>
                                <div id="quickad_username_display"></div>
                            </div>
                            <div class="form-step">
                                <label>{LANG_EMAIL}:</label>
                                <div id="quickad_email_display"></div>
                            </div>
                            <div class="form-step">
                                <input type="hidden">
                                <label>{LANG_PASSWORD}:</label>
                                <input type="password" class="default-input" id="password" name="password">
                                <p>
                                    <a href="{LINK_LOGIN}?fstart=1" target="_blank" id="fb_forgot_password_btn">
                                        <small>{LANG_FORGOTPASS}</small>
                                    </a>
                                </p>
                            </div>
                            <div class="link-account-error alert alert-error" style="display:none"></div>
                            <div class="form-step">
                                <input type="hidden" name="email" id="email" value="" />
                                <input type="hidden" name="username" id="username" value="" />
                                <button id="link_account" type="button" value="Submit" class="btn btn-info FacebookSignUpModal-ctaButton">
                                    {LANG_LINK_ACCOUNT}
                                </button>
                                <div class="FacebookSignUpModal-loader Loader Loader--full fb_submit_loading" style="display:none;"></div>
                            </div>
                        </form>

                        <!-- Error -->
                        <div id="post_error_div" style="display:none">
                            <div id="post_error_content">

                            </div>
                            <button class="fbCloseBtn btn FacebookSignUpModal-ctaButton">{LANG_CLOSE}</button>
                        </div>

                    </div>
                </div>
            </section>
            <div id="facebookConnect-backdrop" class="modal-backdrop"></div>
        </div>
    </div>
    <!-- Link to existing Quickad account -->

    <!-- Premium Ad -->
    <div class="quickad-template">
        <div class="responsive-modal hide" id="premium_ad_modal">
            <section class="FacebookSignUpModal modal fb-bs-identifier">
                <header class="FacebookSignUpModal-header modal-header">
                    <a class="close FacebookSignUpModal-close close-fb-modal-bs" data-dismiss="modal"><span>&times;</span></a><br>
                </header>

                <div class="modal-body">
                    <div class="ModalPayment-body">
                        <div id="post_loading" class="modal-loader Loader Loader--full" style="display: none"></div>
                        <figure class="ModalPayment-figure">
                            <img class="ModalPayment-image" src="{SITE_URL}templates/{TPL_NAME}/images/secure-payment.png" alt="Secure Payment">
                        </figure>
                        <div class="ModalPayment-heading">{LANG_CONFIRM_PAYMENT}</div>

                        <div class="ModalPayment-subHeading">{LANG_UPGRADES}</div>
                        <div id="display_premium_tpl">

                        </div>

                    </div>
                    <div class="ModalPayment-footer">
                        <p>{LANG_CONFIRM_PAYMENT_TEXT}</p>
                        <button id="paymentModalConfirmButton" class="btn btn-large btn-success ModalPayment-footer-btn">{LANG_CONFIRM_PAYMENT}</button>
                    </div>
                </div>
            </section>
            <div id="facebookConnect-backdrop" class="modal-backdrop"></div>
        </div>
    </div>
    <!-- Premium Ad -->
    <!-- /.modal -->
    
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
    

    <div class="quickad-template">
        <main id="main" class="main-content" id="page" data-ipapi="GPS">
            <section class="PagePostProject">
                <div class="PagePostProject-container container">
                    <div class="row">
                        <div class="col-md-12">
                            <div class="aside">
                            <div class="aside-body ">
                                <div class="more-info">
                                <header class="PagePostProject-header">
                                    <div id="post_success_uploaded" class="middle-container" style="display: none">
                                        <div class="middle-dabba">
                                            <h1>{LANG_SUCCESS}!</h1>
    
                                            <p>{LANG_ADSUCCESS}</p>
                                        </div>
                                    </div>
    
                                    <div id="ad_post_title">
<center><h2 style="color:green"> මිළ ගණන් වෙනස් වී ඇත. වැඩි විස්තර සදහා අමතන්න. 0702766942 - December 1st, 2022</h2></center>

<h1 class="PagePostProject-header-title">{LANG_POST-ADVERTISE}</h1>
                                        <p class="PagePostProject-header-desc">
                                            {LANG_POST-ADVERTISE-QUTO}</br>
                                            දැන්වීම් පළකිරීම ඉක්මන් හා ඉතා පහසුයි. 
                                        </p>
                                    </div>
                                </header>
                                

                            <fl-project-form id="ad_post_form">
                                <div id="post_error">

                                </div>
                                

                                <form class="fl-form" action="{LINK_POST-AD}?action=post_ad" id="post-advertise-form" method="post" enctype="multipart/form-data" accept-charset="UTF-8">
                                    
                                    <div class="form-group" style="margin-bottom:50px">
                                        <legend class="PagePostProject-legend">Category * දැන්වීම් වර්ගය තෝරන්න</legend>
                                        <a href="#" id="choose-category" class="tg-btn" data-toggle="modal" data-target=".tg-categorymodal"><i class="fa fa-plus-circle"></i> {LANG_CHOOSE-CATEGORY}</a>
                                    </div>
                                    
                                    <div class="form-group selected-product" id="change-category-btn" style='display: none'>
                                        <ul class="select-category list-inline">
                                            <li id="main-category-text"></li>
                                            <li id="sub-category-text"></li>
                                            <li class="active"><a href="#" data-toggle="modal" data-target=".tg-categorymodal"><i class="fa fa-pencil-square-o"></i> {LANG_EDIT}</a></li>
                                        </ul>

                                        <input type="hidden" id="input-maincatid" name="catid" value="">
                                        <input type="hidden" id="input-subcatid" name="subcatid" value="">
                                    </div>
                                    
                                    
                                     <!-- /////////////////////////////////////////////////////////// city //////////////////////////////////////////////////////////////////////////////// -->
                                        <div>
                                            IF("{POST_TAGS_MODE}"=="1"){
                                            <fieldset class="PagePostProject-fieldset">
                                                <legend class="PagePostProject-legend">Location * </legend>
                                                <ol>
                                                    <li class="form-step">
                                                        <select id="postadcity" name="city" class="large-input focusable-field">
                                                            <option value="0" selected="selected">{LANG_SELECT_CITY}</option>
                                                        </select>
                                                    </li>
                                                </ol>
                                            </fieldset>
                                            {:IF}
                                            IF("{POST_TAGS_MODE}"=="1"){
                                            <fieldset class="PagePostProject-fieldset">
                                                <label>{LANG_CITY} *</label>
                                                <input type="text" class="form-control location" id="searchStateCity" name="cityx" placeholder="{LANG_SELECT_CITY} ?" >
                                                <input type="hidden" name="placetype" id="searchPlaceType" value="">
                                                <input type="hidden" name="placeid" id="searchPlaceId" value="">
                                            </fieldset>
                                            {:IF}

                                            <fieldset class="PagePostProject-fieldset">
                                                <legend class="PagePostProject-legend">Location * පළ කිරීමට අවශ්‍ය නගරය</legend>
                                                <input type="text" class="form-control location" id="searchStateCity" name="city" placeholder="{LANG_SELECT_CITY} ?" >
                                                <input type="hidden" name="placetype" id="searchPlaceType" value="">
                                                <input type="hidden" name="placeid" id="searchPlaceId" value="">
                                            </fieldset>
                                            
                                            IF("{POST_ADDRESS_MODE}"!="1"){
                                            <style>
                                                .address_hidden{display:none;}
                                    </style>
                                            {:IF}

                                            <fieldset class="PagePostProject-fieldset address_hidden">
                                                <legend class="PagePostProject-legend">{LANG_ADDRESS}</legend>
                                                <ol>
                                                    <li class="form-step">
                                                        <div class="tg-inputwithicon">
                                                            <div class="geo-location"><i class="fa fa-crosshairs"></i></div>
                                                            <input type="text" class="large-input focusable-field" placeholder="Your Location" name="location" id="address-autocomplete">
                                                            <input type="hidden" id="latitude" name="latitude" value="{LATITUDE}" />
                                                            <input type="hidden" id="longitude" name="longitude" value="{LONGITUDE}" />
                                                            <div class="map height-200px shadow" id="map"></div>
                                                            <p class="note" style="opacity: 1">{LANG_DRAG-MAP-MARKER}.</p>
                                                        </div>
                                                    </li>
                                                </ol>
                                            </fieldset>

                                        </div>
                                        
                                        
                                        
                                    
                                    <ol>
                                        <li>
                                            <fieldset class="PagePostProject-fieldset">
                                                <legend class="PagePostProject-legend">Title * දැන්වීමේ මාතෘකාව</legend>
                                                <ol>
                                                    <li class="form-step">
                                                        <input type="text" class="large-input focusable-field" placeholder="{LANG_AD-TITLE}" name="title" value="">
                                                        <div class="ng-active hidden">
                                                            <div class="form-error"></div>
                                                        </div>
                                                    </li>
                                                </ol>
                                            </fieldset>
                                            <fieldset class="PagePostProject-fieldset">
                                                <legend class="PagePostProject-legend">{LANG_DESCRIPTION} * දැන්වීම් විස්තරය</legend>
                                                <ol>
                                                    <li class="form-step">
                                                        <textarea class="large-textarea focusable-field" id="pageContent" placeholder="{LANG_AD_DESCRIPTION}..." name="content" rows="3"></textarea>
                                                    </li>
                                                </ol>
                                            </fieldset>
                                        </li>

                                    <ol>
                                        <li>
                                            <fieldset class="PagePostProject-fieldset">
                                                <legend class="PagePostProject-legend">Photos * පිංතූර ඇතුලත් කරන්න</legend>
                                                <ol>


                                        <li id="quickad-photo-field">
                                            <fieldset class="PagePostProject-fieldset">
                                                <div id="item_screen" orakuploader="on"></div>
                                            </fieldset>
                                            <div class="notice">
                                            පින්තූර ඇතුලත් කිරිමෙදි පින්තුර ඇතුලත් නොවි පවතිනම් කිසියම් හෝ 
                                            පින්තුරයක් ඇතුලත් කර දැන්විම පල කර, පසුව දැන්විමට ආදාල පින්තුර මෙම ඊමෙල් 
                                            ලිපිනයට ඊමෙල් කරන්න support@siyaluma.lk. කිසියම් ගැටලුවක් මතුවුව හොත් 
                                            මෙම දුරකථන අංකය හා සම්බන්ධවන්න 0702766942
                                            </div>
                                        </li>
</br>
                                        <li style="padding-bottom: 20px;">
                                            <fieldset class="PagePostProject-fieldset">
                                                <legend class="PagePostProject-legend">{LANG_ADDITIONAL-INFO}</legend>
                                            </fieldset>
                                            IF("{SHOWCUSTOMFIELD}"!="1"){
                                            <style>
                                                .asdcasca{display:none;}
                                    </style>
                                            {:IF}
                                            <div id="custom-field-block asdcasca">
                                                <div id="ResponseCustomFields">
                                                    {LOOP: CUSTOMFIELDS}
                                                    IF("{CUSTOMFIELDS.type}"=="text-field"){
                                                    <div class="row form-group {CUSTOMFIELDS.title}">
                                                        <label class="col-sm-3 label-title">{CUSTOMFIELDS.title}</label>
                                                        <div class="col-sm-9">{CUSTOMFIELDS.textbox}</div>
                                                    </div>
                                                    {:IF}
                                                    IF("{CUSTOMFIELDS.type}"=="textarea"){
                                                    <div class="row form-group {CUSTOMFIELDS.title}">
                                                        <label class="col-sm-3 label-title">{CUSTOMFIELDS.title}</label>
                                                        <div class="col-sm-9">{CUSTOMFIELDS.textarea}</div>
                                                    </div>
                                                    {:IF}
                                                    IF("{CUSTOMFIELDS.type}"=="drop-down"){
                                                    <div class="row form-group {CUSTOMFIELDS.title}">
                                                        <label class="col-sm-3 label-title">{CUSTOMFIELDS.title}</label>
                                                        <div class="col-sm-9">
                                                            <select class="form-control" name="custom[{CUSTOMFIELDS.id}]" {CUSTOMFIELDS.required}>
                                                                <option value="" selected>{LANG_SELECT} {CUSTOMFIELDS.title}</option>
                                                                {CUSTOMFIELDS.selectbox}
                                                            </select>
                                                        </div>
                                                    </div>
                                                    {:IF}
                                                    IF("{CUSTOMFIELDS.type}"=="radio-buttons"){
                                                    <div class="row form-group {CUSTOMFIELDS.title}">
                                                        <label class="col-sm-3 label-title">{CUSTOMFIELDS.title}</label>
                                                        <div class="col-sm-9">{CUSTOMFIELDS.radio}</div>
                                                    </div>
                                                    {:IF}
                                                    IF("{CUSTOMFIELDS.type}"=="checkboxes"){
                                                    <div class="row form-group {CUSTOMFIELDS.title}">
                                                        <label class="col-sm-3 label-title">{CUSTOMFIELDS.title}</label>
                                                        <div class="col-sm-9">
                                                            {CUSTOMFIELDS.checkboxBootstrap}
                                                        </div>
                                                    </div>
                                                    {:IF}
                                                    {/LOOP: CUSTOMFIELDS}
                                                </div>
                                            </div>

                                            <div class="row form-group" id="quickad-price-field">
                                                <label class="col-sm-3 label-title">{LANG_PRICE} </label>
                                                <div class="col-sm-9">
                                                    <div class="input-group custom-input-group">
                                                        <span class="input-group-addon currency-adon">{USER_CURRENCY_SIGN}</span>
                                                        <input type="text" class="form-control" placeholder="e.g. 1000" name="price">
                                                    </div>
                                                    <label class="btn border-left-zero label-adon">
                                                        <input type="checkbox" name="negotiable" id="negotiable" class="FacebookSignUpModal-radio" value="1">{LANG_NEGOTIATE}
                                                    </label>
                                                     <p class="help-block">Please don't use (Dot) . for price</p>
                                                </div>
                                            </div>
                                            
                                            
                                                                                        <div>
                                                <div class="notice" style="display:none">
ඉඩමක දැන්විමක් පල කිරිමෙදි ඉඩමේ මුලු වටිනාකම අනුව දැන්වීමේ අය කල යුතු මුදල තීරණය වේ.  Price තීරුවේ ඉඩමේ මුළු වටිනාකම සදහන් කරන්න.  0778544700</div>
                                            </div>

                                            
                                            
                                            <!-- ///////////////////////////////////////////////////////////// Mobile number /////////////////////////////////////////////////////////////////////////// -->
                                            <div class="row form-group">
                                                <label class="col-sm-3 label-title">Phone number</label>
                                                <div class="col-sm-9">
                                                    <div class="input-group custom-input-group">
                                                        <span class="input-group-addon" style="padding: 4px 10px;">
                                                            <img src="{SITE_URL}templates/{TPL_NAME}/images/flags/{USER_COUNTRY}.png">
                                                        </span>
                                                        <input type="text" class="form-control" placeholder="071xxxxxxx" name="phone" required>
                                                    </div>
                                                </div>
                                            </div>

                                            <div class="row form-group">
                                                <label class="col-sm-3 label-title">Another phone number</label>
                                                <div class="col-sm-9">
                                                    <div class="input-group custom-input-group">
                                                        <span class="input-group-addon" style="padding: 4px 10px;">
                                                            <img src="{SITE_URL}templates/{TPL_NAME}/images/flags/{USER_COUNTRY}.png">
                                                        </span>
                                                        <input type="text" class="form-control" placeholder="071xxxxxxx" name="phone2">
                                                    </div>
                                                </div>
                                            </div>

                                            IF("{POST_TAGS_MODE}"=="1"){
                                            <div class="row form-group">
                                                <label class="col-sm-3 label-title">{LANG_TAGS} </label>
                                                <div class="col-sm-9">
                                                    <input name="tags" class="form-control" type="text" value="" placeholder="{LANG_TAGS}">
                                                    <span>{LANG_TAGS_DETAIL}</span>
                                                </div>
                                            </div>
                                            {:IF}
                                        </li>
                                       
                                       
                                       

                                        IF("{LOGGED_IN}"=="0"){
                                        <li>
                                            <fieldset class="PagePostProject-fieldset" style="margin-bottom: 20px">
                                                <legend class="PagePostProject-legend">{LANG_SELLER-INFO} * ඔබ අලුත්නම් ලියාපදිංචිවන්න</legend>
                                            </fieldset>
                                            <div class="row">
                                                <div class="col-md-6 col-sm-12">
                                                    <fieldset class="PagePostProject-fieldset">
                                                        <ol>
                                                            <li class="form-step">
                                                                <label>{LANG_SELLER_NAME}</label>
                                                                <input type="text" class="large-input focusable-field" placeholder="{LANG_SELLER_NAME}" name="seller_name">
                                                            </li>
                                                        </ol>
                                                    </fieldset>
                                                </div>
                                                <div class="col-md-6 col-sm-12">
                                                    <fieldset class="PagePostProject-fieldset">
                                                        <ol>
                                                            <li class="form-step">
                                                                <label>{LANG_SELLER_EMAIL}</label>
                                                                <input type="text" class="large-input focusable-field" placeholder="{LANG_SELLER_EMAIL}" name="seller_email">
                                                            </li>
                                                        </ol>
                                                    </fieldset>
                                                </div>
                                            </div>


                                        </li>
                                        {:IF}

                                        IF("{POST_PREMIUM_LISTING}"=="0"){
                                        <style>
                                            .NumberedForm-content{ display: none !important;}
                                       </style>
                                        {:IF}
                                        
                                        
                                        
                                        IF("{LOGGED_IN}"=="0"){
                                            <style>
                                            .premium_show{ display: none !important;}
                                             </style>
                                         {:IF}
                                        
                                        <!-- PACKAGE -->
                                        
                                        <li class="premium_show">
                                            <div class="NumberedForm-content">
                                                <fieldset class="PagePostProject-fieldset">
                                                    <legend class="PagePostProject-legend">{LANG_MAKE-PREMIUM}</br></br></legend>
                                                    <div class="PagePostProject-optionalTabs">
                                                        <ul class="PagePostProject-optionalTabs-list">
                                                            <li class="PagePostProject-optionalTabs-item">
                                                                <input type="radio" id="standard" name="optional-upgrades" value="free" class="PagePostProject-selectableCard-input PagePostProject-optionalTabs-input ng-valid ng-dirty ng-touched">
                                                                <label for="standard" class="PagePostProject-selectableCard-label PagePostProject-optionalTabs-label">
                                                                    <img class="PagePostProject-optionalTabs-icon" alt="decoration" src="{SITE_URL}templates/{TPL_NAME}/images/standard-project-icon.svg">
                                                                    <div class="PagePostProject-optionalTabs-copy">
                                                                        <h4 class="PagePostProject-optionalTabs-heading">{LANG_FREE-AD}</h4>
                                                                        <p class="PagePostProject-optionalTabs-intro">{LANG_CHECK_BY_TEAM}</p>
                                                                    </div>
                                                                    <div class="PagePostProject-optionalTabs-price PagePostProject-optionalTabs-price--large"><strong>{LANG_FREE}</strong></div>
                                                                </label>
                                                            </li>
                                                            <li class="PagePostProject-optionalTabs-item ">
                                                                <input type="radio" id="advanced" name="optional-upgrades" value="premium" class="PagePostProject-selectableCard-input PagePostProject-optionalTabs-input">
                                                                <label for="advanced" class="PagePostProject-selectableCard-label PagePostProject-optionalTabs-label">
                                                                    <img class="PagePostProject-optionalTabs-icon" alt="decoration" src="{SITE_URL}templates/{TPL_NAME}/images/recruiter-icon.svg">
                                                                    <div class="PagePostProject-optionalTabs-copy">
                                                                        <h4 class="PagePostProject-optionalTabs-heading">{LANG_PREMIUM} <span class="PagePostProject-optionalTabs-promotion">{LANG_RECOMMENDED}</span></span></h4>
                                                                        <p class="PagePostProject-optionalTabs-intro">{LANG_UPGRADE_TEXT_INFO}</p>

                                                                        <div class="PagePostProject-optionalTabs-content">
                                                                            <div class="PagePostProject-optionalTabs-content-inner">
                                                                                <table class="UpgradeListing">
                                                                                    <tbody class="UpgradeListing-body">
                                                                                        <!-- FEATURED UPGRADE -->
                                                                                        <tr id="project-upgrade-item-featured" class="UpgradeListing-option">
                                                                                            <td class="UpgradeListing-info">
                                                                                                <div class="Checkbox">
                                                                                                    <input type="checkbox" name="featured" class="Checkbox-input focusable-field" id="featured" onclick="fillPrice(this,{FEATURED_FEE});">
                                                                                                    <label class="UpgradeListing-checkbox Checkbox-label Checkbox-label--large" for="featured">
                                                                                                        <span class="Checkbox-addIcon"></span>
                                                                                                    </label>
                                                                                                    <div class="UpgradeListing-tags">
                                                                                                        <span class="UpgradeListing-promoTag promotion-tag has-no-icon promotion-featured">
                                                                                                            {LANG_FEATURED}
                                                                                                        </span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </td>

                                                                                            <td class="UpgradeListing-intro">
                                                                                                <p class="UpgradeListing-desc">{LANG_FEATURED_AD_TEXT}</p>
                                                                                            </td>

                                                                                            <td class="UpgradeListing-price js-upgrade-price">
                                                                                                <div id="priced_featured_upgrade_block" class="UpgradeListing-price-value">
                                                                                                    <span id="featured-upgrade-price">{CURRENCY_SIGN}{FEATURED_FEE}</span>
                                                                                                </div>
                                                                                            </td>
                                                                                        </tr>

                                                                                        <!-- URGENT UPGRADE -->
                                                                                        <tr id="project-upgrade-item-urgent" class="UpgradeListing-option" data-robots="ProjectUpgradeUrgent">
                                                                                            <td class="UpgradeListing-info">
                                                                                                <div class="Checkbox">
                                                                                                    <input type="checkbox" name="urgent" data-name="urgent" class="Checkbox-input focusable-field" id="urgent" onclick="fillPrice(this,{URGENT_FEE});">
                                                                                                    <label class="UpgradeListing-checkbox Checkbox-label Checkbox-label--large" for="urgent">
                                                                                                        <span class="Checkbox-addIcon"></span>
                                                                                                    </label>
                                                                                                    <div class="UpgradeListing-tags">
                                                                                                        <span class="UpgradeListing-promoTag promotion-tag has-no-icon promotion-assisted">
                                                                                                            {LANG_URGENT}
                                                                                                        </span>
                                                                                                    </div>
                                                                                                </div>

                                                                                            </td>

                                                                                            <td class="UpgradeListing-intro">
                                                                                                <p class="UpgradeListing-desc">{LANG_URGENT_AD_TEXT}</p>
                                                                                            </td>

                                                                                            <td class="UpgradeListing-price js-upgrade-price">
                                                                                                <div id="priced_urgent_upgrade_block" class="UpgradeListing-price-value">
                                                                                                    <span id="urgent-upgrade-price">{CURRENCY_SIGN}{URGENT_FEE}</span>
                                                                                                </div>
                                                                                            </td>
                                                                                        </tr>

                                                                                        <!-- HIGHLIGHT UPGRADE -->
                                                                                        <tr id="project-upgrade-item-private" class="UpgradeListing-option" data-robots="ProjectUpgradePrivate">
                                                                                            <td class="UpgradeListing-info">
                                                                                                <div class="Checkbox">
                                                                                                    <input type="checkbox" name="highlight" class="Checkbox-input focusable-field" id="highlight" value="" onclick="fillPrice(this,{HIGHLIGHT_FEE});">
                                                                                                    <label class="UpgradeListing-checkbox Checkbox-label Checkbox-label--large" for="highlight">
                                                                                                        <span class="Checkbox-addIcon"></span>
                                                                                                    </label>
                                                                                                    <div class="UpgradeListing-tags">
                                                                                                        <span class="UpgradeListing-promoTag promotion-tag has-no-icon promotion-private">
                                                                                                            {LANG_HIGHLIGHT}
                                                                                                        </span>
                                                                                                    </div>
                                                                                                </div>
                                                                                            </td>


                                                                                            <td class="UpgradeListing-intro">
                                                                                                <p class="UpgradeListing-desc">{LANG_HIGHLIGHT_AD_TEXT}</p>
                                                                                            </td>

                                                                                            <td class="UpgradeListing-price js-upgrade-price">

                                                                                                <div id="priced_private_upgrade_block" class="UpgradeListing-price-value">
                                                                                                    <span id="private-upgrade-price">{CURRENCY_SIGN}{HIGHLIGHT_FEE}</span>
                                                                                                </div>
                                                                                            </td>
                                                                                        </tr>
                                                                                    </tbody>

                                                                                </table>

                                                                            </div>

                                                                        </div>

                                                                    </div>
                                                                </label>
                                                            </li>
                                                        </ul>
                                                    </div>
                                                </fieldset>
                                            </div>
                                        </li>
                                     
                                        <!-- PACKAGE -->
                                        <!-- //////////////////////////////////////////////////////////////////// Other Ad Network ////////////////////////////////////////////////////////////////////////////////////////////// -->

                                                IF("{LOGGED_IN}"=="0"){
                                                   <style>
                                                       .only_reg{
                                                           display: none !important;
                                                       }
                                                   </style>
                                                 {:IF}
                                                 
                                        <li class="PagePostProject-selectableCard-label only_reg"  style="display:none;" id="other_ad_network">
                                            <div class="NumberedForm-content">
                                                IF("{SHOWTRANSACTION}"=="0"){
                                                   <style>
                                                     /*#other_ad_network{display: none;}*/
                                                       #packagetoggler{
                                                            display: block;
                                                       }
                                                       #is_guess{
                                                           display: none;
                                                       }
                                                       
                                                       .only_reg{
                                                           display: none !important;
                                                       }
                                                       
                                                       .premium_show{ display: none !important;}


                                                   </style>
                                                {:IF}
                                                
                                                IF("{ISSIYALUMA}"=="1"){
                                                   <style>
                                                       #is_guess{
                                                           display: none;
                                                       }
                                                   </style>                
                                                {:IF}
                                                <div class="PagePostProject-optionalTabs-copy">
                                                <fieldset class="PagePostProject-fieldset">
                                                    <legend class="PagePostProject-optionalTabs-heading">Other Ad Network</legend>
                                                </div>
                                                
<center><h2 style="color:green"> මිළ ගණන් වෙනස් වී ඇත. වැඩි විස්තර සදහා අමතන්න. 0702766942 - December 1st, 2022</h2></center>


                                                    <div class="row form-group">
                                                        <label class="col-sm-3 label-title">Select a Network</label>
                                                        <div class="col-sm-9">
                                                            
                                                    <ul class="pay-list guttar-20px">
                                                        
                                                     
                                                </ul>
                                                

                                                
                                                            
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <label class="col-sm-3 label-title">Payment Method</label>
                                                        <div class="col-sm-9">
                                                            <select class="form-control" id="payment" name="payment" {PAYMENTS.required}>
                                                                <option value="ezcash1_700">eZcash 1 (0778 544 700)</option>
                                                                <option value="ezcash2_232">eZcash 2 (0770 877 232)</option>
                                                                <option value="boc">BOC</option>
                                                                <!--<option value="seylan_bank">Seylan Bank</option>-->
                                                                <option value="sampath_bank">Sampath Bank</option>
                                                                <option value="mcash">mCash (0702 766 942)</option>
                                                                <option value="add_to_bill">Add To Bill</option>
                                                            </select>
                                                             <div id="pboc">
                                                               <p class="help-block">Account Holder: Ikman and Siyaluma Ads</p>
                                                               <p class="help-block">Account No: 88166264</p>
                                                               <p class="help-block">Branch: Hambantota</p>
                                                             </div>
                                                             <div id="psampath">
                                                               <p class="help-block">Account Holder: Ikman and Siyaluma Ads</p>
                                                               <p class="help-block">Account No: 1104 1402 1590</p>
                                                               <p class="help-block">Branch: Ambalantota</p>
                                                             </div>
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <label class="col-sm-3 label-title">Date</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" class="form-control" placeholder="Select date" name="datepicker" autocomplete="off" id="from-datepicker" />
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <label class="col-sm-3 label-title">time</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" class="form-control" placeholder="Select data" name="timepicker" autocomplete="off" id="from-timepicker" />
                                                        </div>
                                                    </div>
                                                    <div class="row form-group">
                                                        <label class="col-sm-3 label-title">Ref NO.</label>
                                                        <div class="col-sm-9">
                                                            <input type="text" class="form-control" placeholder="Ref No" name="ref_no">
                                                        </div>
                                                    </div>

                                                </fieldset>
                                            </div>
                                        </li>
                                         IF("{SHOWTRANSACTION}"!="0"){
                                          <style>
                                            .premium_show{display: none;}
                                          </style>
                                         {:IF}
                                        <li style="list-style: none;">

                                            <div class="PagePostProject-submit">
                                                <input type="hidden" name="submit">
                                                <button id="submit_advertise" class="btn btn-xlarge btn-info " type="submit" name="Submit"><span> {LANG_POST-Y-AD}</span></button>
                                                <div id="ad_total_cost_container" class="PagePostProject-totalCost" style="display: none;">
                                                    <strong>
                                                        {LANG_TOTAL}:
                                                        <span class="currency-sign">{CURRENCY_SIGN}</span>
                                                        <span id="totalPrice">0</span>
                                                        <span class="currency-code">{CURRENCY_CODE}</span>
                                                    </strong>

                                                </div>
                                            </div>

                                            <p class="PagePostProject-submit-terms">
                                                {LANG_CLICK-CON}
                                                <a class="PagePostProject-submit-link" target="_blank" href="{TERMCONDITION_LINK}">{LANG_TERM-CON}</a>
                                                {LANG_AND}
                                                <a class="PagePostProject-submit-link" target="_blank" href="{PRIVACY_LINK}">{LANG_PRIVACY}</a>
                                                <br>
                                            </p>
                                        </li>
                                    </ol>
                                </form>
                            </fl-project-form>
                            </div>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
            <!-- footer -->
<div class="footer-section">
    <div class="container">
        <div class="row"><!--About Us-->
            <div class="col-md-4 col-sm-12">
                <div class="ft-logo"><img src="{SITE_URL}storage/logo/{SITE_LOGO}" alt="Footer Logo"></div>
                <p>{FOOTER_TEXT}</p>
            </div>
            <!--About us End--><!--Help Support-->
            <div class="col-md-2 col-sm-6">
                <h5>{LANG_HELP_SUPPORT}</h5>
                <!--Help Support menu Start-->
                <ul class="helpMenu">
                    <li><a href="{LINK_FAQ}">{LANG_FAQ}</a></li>
                    <li><a href="{LINK_FEEDBACK}">{LANG_FEEDBACK}</a></li>
                    <li><a href="{LINK_CONTACT}">{LANG_CONTACT}</a></li>
                </ul>
            </div>
            <!--Help Support menu end--><!--Information-->
            <div class="col-md-3 col-sm-6">
                <h5>{LANG_INFORMATION}</h5>
                <!--Information menu Start-->
                <ul class="helpMenu">
                    {LOOP: HTMLPAGE}
                    <li><a href="{HTMLPAGE.link}">{HTMLPAGE.title}</a></li>
                    {/LOOP: HTMLPAGE}
                    
                    <li><a href="{LINK_SITEMAP}">{LANG_SITE-MAP}</a></li>
                </ul>
                <!--Information menu End-->
                <div class="clear"></div>
            </div>
            <!--Contact Us-->
            <div class="col-md-3 col-sm-12">
                <h5>{LANG_CONTACT-US}</h5>
                <div class="email"><a href="mailto:support@siyaluma.lk">support@siyaluma.lk</a></div>
                <!-- Social Icons -->
                <div class="social">
                    IF("{FACEBOOK_LINK}"!=""){ <a href="{FACEBOOK_LINK}" target="_blank"><i class="fa fa-facebook"></i></a>{:IF}
                    IF("{TWITTER_LINK}"!=""){ <a href="{TWITTER_LINK}" target="_blank"><i class="fa fa-twitter"></i></a>{:IF}
                    IF("{GOOGLEPLUS_LINK}"!=""){ <a href="{GOOGLEPLUS_LINK}" target="_blank"><i class="fa fa-google-plus"></i></a>{:IF}
                    IF("{YOUTUBE_LINK}"!=""){ <a href="{YOUTUBE_LINK}" target="_blank"><i class="fa fa-youtube"></i></a>{:IF}
                </div>
                <!-- Social Icons end -->
            </div>
        </div>
        <div class="col-md-12">
            <div class="copyright text-center">
                <p>{COPYRIGHT_TEXT}</p>
            </div>
        </div>
    </div>
</div>
<!-- footer -->
        </main>
    </div>
    <script src="{SITE_URL}templates/{TPL_NAME}/js/bootstrap.min.js"></script>

    <script src="{SITE_URL}templates/{TPL_NAME}/js/owl.carousel-category.min.js"></script>
    <script src="{SITE_URL}templates/{TPL_NAME}/js/select2.js"></script>
    IF("{POST_ADDRESS_MODE}"=="1"){
    <!-- If address mode enable: ADDRESS FIELD JAVASCRIPT -->
    <link href="{SITE_URL}templates/{TPL_NAME}/css/map/map-marker.css" type="text/css" rel="stylesheet">
    <script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/jquery-migrate-1.2.1.min.js'></script>
    <script type='text/javascript' src='//maps.google.com/maps/api/js?key={GMAP_API_KEY}&#038;libraries=places%2Cgeometry&#038;ver=2.2.1'></script>
    <script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/richmarker-compiled.js'></script>
    <script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/markerclusterer_packed.js'></script>
    <script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/gmapAdBox.js'></script>
    <script type='text/javascript' src='{SITE_URL}templates/{TPL_NAME}/js/map/maps.js'></script>


    <script>
        var _latitude = '{LATITUDE}';
    var _longitude = '{LONGITUDE}';
    var element = "map";
    var color = '#9C27B0';
    var zoom = '#9C27B0';
    var getCity = false;
    var path = '{SITE_URL}templates/{TPL_NAME}/';
    var Countries = '{USER_COUNTRY}';
    if(Countries != ""){
        var str = Countries;
        var str_array = str.split(',');
        var getCountry = [];
        for(var i = 0; i < str_array.length; i++)
        {
            getCountry.push(str_array[i]);

        }
    }
    else{
        var getCountry = "all";
    }
    simpleMap(_latitude, _longitude, element, true);

    $('#postadcity').on('change', function() {
        var data = $("#postadcity option:selected").val();
        var custom_data= $("#postadcity").select2('data')[0];
        var latitude = custom_data.latitude;
        var longitude = custom_data.longitude;
        $('#latitude').val(latitude);
        $('#longitude').val(longitude);
        //console.log(latitude+longitude);
        simpleMap(latitude, longitude, element, true);
    });
</script>
    <!-- If address mode enable: ADDRESS FIELD JAVASCRIPT -->
    {:IF}
    <script>
        var ajaxurl = "{APP_URL}user-ajax.php";
    var lang_edit_cat = "{LANG_EDIT_CATEGORY}";
</script>
    <script src="{SITE_URL}templates/{TPL_NAME}/js/ajaxForm/jquery.form.js"></script>
    <script src="{SITE_URL}templates/{TPL_NAME}/js/ad_post_js.js"></script>
    <script src='{SITE_URL}templates/{TPL_NAME}/js/custom2.js' type='text/javascript'></script>
    <script src="{SITE_URL}templates/{TPL_NAME}/js/custom.js"></script>
    <script src='{SITE_URL}templates/{TPL_NAME}/js/user-ajax.js'></script>
    IF("{POST_DESC_EDITOR}"=="1"){
    <!-- CRUD FORM CONTENT - crud_fields_scripts stack -->
    <link media="all" rel="stylesheet" type="text/css" href="{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/styles/simditor.css" />
    <script src="{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/scripts/mobilecheck.js"></script>
    <script src="{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/scripts/module.js"></script>
    <script src="{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/scripts/uploader.js"></script>
    <script src="{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/scripts/hotkeys.js"></script>
    <script src="{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/scripts/simditor.js"></script>
    <script>
        (function() {
            $(function() {
                var $preview, editor, mobileToolbar, toolbar, allowedTags;
                Simditor.locale = 'en-US';
                toolbar = ['bold', 'italic', 'underline', 'fontScale', '|', 'ol', 'ul', 'blockquote', 'table', 'link'];
                mobileToolbar = ["bold", "italic", "underline", "ul", "ol"];
                if (mobilecheck()) {
                    toolbar = mobileToolbar;
                }
                allowedTags = ['br', 'span', 'a', 'img', 'b', 'strong', 'i', 'strike', 'u', 'font', 'p', 'ul', 'ol', 'li', 'blockquote', 'pre', 'h1', 'h2', 'h3', 'h4', 'hr', 'table'];
                editor = new Simditor({
                    textarea: $('#pageContent'),
                    placeholder: '{LANG_AD_DESCRIPTION}...',
                    toolbar: toolbar,
                    pasteImage: false,
                    defaultImage: '{SITE_URL}templates/{TPL_NAME}/assets/plugins/simditor/images/image.png',
                    upload: false,
                    allowedTags: allowedTags
                });
                $preview = $('#preview');
                if ($preview.length > 0) {
                    return editor.on('valuechanged', function(e) {
                        return $preview.html(editor.getValue());
                    });
                }
                editor.on('valuechanged', function(e) {
                });
            });
        }).call(this);
    </script>
    {:IF}
    <script>
        $(document).ready(function() {
            
function getNetworkList(main_cat,price,sub_cat){
    console.log(sub_cat);
    let tt=$("#submit_advertise");
    if(sub_cat == "" || sub_cat == " "){
        //get direct main
        $.ajax({
            url: '',
            type: 'get',
            data: {
                action:'get_main_cat_price',
                id:main_cat,
                price:price
            },
            dataType:'json',
            beforeSend:function(){
                tt.toggleClass('disabled');
                $(".pay-list").html('');
            },
            success: function(response){
                tt.toggleClass('disabled');
                if(response.status == 1){
                    if(response.data.length > 0){
                        $.each(response.data,function(i,v){
                            let tmo_div=`
                            <li class="pay-item" id="is_guess">
                                <input type="radio" class="pay-check" name="network_option" id="pack_id_`+v.id+`" value="`+v.id+`">
                                <label class="pay-check-label" for="`+v.id+`Pkg">
                                    <img src="../`+v.image+`">
                                </label>
                                
                                <ul class="list-group" id="`+v.id+`Pkg" style="display:none">
                                    <li class="list-group-item">`+v.name+`</li>
                                    `;
                                    if(v.types.length){
                                        $.each(v.types,function(ii,vv){
                                            tmo_div+=`
                                            <li class="list-group-item">
                                                <span class="label label-`+vv.color+`">`+vv.name+`</span>
                                                `;
                                                if(vv.price.length > 0){
                                                    $.each(vv.price,function(iii,vvv){
                                                        tmo_div+=`<span>Rs. `+vvv.price+`</span>`;
                                                    });
                                                }
                                                tmo_div+=`

                                            </li>
                                            `;
                                        });
                                    }
                                    tmo_div+=`
                                </ul>
                            </li>
                            `;
                            $(".pay-list").append(tmo_div);
                        });
                        $("#other_ad_network").show();
                    }else{
                        $("#other_ad_network").hide();
                    }
                }else{
                    console.log(err);
                    $("#other_ad_network").hide();
                    alert('Error!');
                }
                
            },error:function(err){
                $("#other_ad_network").hide();
                tt.toggleClass('disabled');
                console.log(err);
                alert('Error!');
            }
        });
    }else{
        $.ajax({
            url: '',
            type: 'get',
            data: {
                action:'get_sub_cat_price',
                id:sub_cat,
                price:price
            },
            dataType:'json',
            beforeSend:function(){
                tt.toggleClass('disabled');
                $(".pay-list").html('');
            },
            success: function(response){
                tt.toggleClass('disabled');
                if(response.status == 1){ 
                    if(response.data.length > 0){
                        $.each(response.data,function(i,v){
                            let tmo_div=`
                            <li class="pay-item" id="is_guess">
                                <input type="radio" class="pay-check" name="network_option" id="pack_id_`+v.id+`" value="`+v.id+`">
                                <label class="pay-check-label" for="`+v.id+`Pkg">
                                    <img src="../`+v.image+`">
                                </label>
                                
                                <ul class="list-group" id="`+v.id+`Pkg" style="display:none">
                                    <li class="list-group-item">`+v.name+`</li>
                                    `;
                                    if(v.types.length > 0){ 
                                        $.each(v.types,function(ii,vv){ 
                                            tmo_div+=`
                                            <li class="list-group-item">
                                                <span class="label label-`+vv.color+`">`+vv.name+`</span>
                                                `;
                                                if(vv.price.length > 0){
                                                    $.each(vv.price,function(iii,vvv){
                                                        tmo_div+=`<span>Rs. `+vvv.price+`</span>`;
                                                    });
                                                }
                                                tmo_div+=`

                                            </li>
                                            `;
                                        });
                                    }
                                    tmo_div+=`
                                </ul>
                            </li>
                            `;
                            console.log(tmo_div);
                            $(".pay-list").append(tmo_div);
                            
                        });
                        $("#other_ad_network").show();
                    }else{
                        $("#other_ad_network").hide();
                    }
                }else{
                    console.log(err);
                    $("#other_ad_network").hide();
                    alert('Error!');
                }
                
            },error:function(err){
                $("#other_ad_network").hide();
                tt.toggleClass('disabled');
                console.log(err);
                alert('Error!');
            }
        });
    }
}
$(document).on('click','.pay-check-label',function(){
    let for_q=$(this).attr('for');
    $(".pay-item").find('.list-group').hide();
    $(this).parent().find('.pay-check').prop('checked',true);
    $("#"+for_q).show();
});
$(document).on('change',"input[name=price]",function(){
    let price=$("input[name=price]").val();
    let main_cat=$("#input-maincatid").val();
    let sub_cat=$("#input-subcatid").val();
    getNetworkList(main_cat,price,sub_cat);
});

$(document).on('change','#input-maincatid',function(){
    let price=$("input[name=price]").val();
    let main_cat=$("#input-maincatid").val();
    let sub_cat=$("#input-subcatid").val();
    getNetworkList(main_cat,price,sub_cat);
});

$(document).on('change','#input-subcatid',function(){
    let price=$("input[name=price]").val();
    let main_cat=$("#input-maincatid").val();
    let sub_cat=$("#input-subcatid").val();
    getNetworkList(main_cat,price,sub_cat);
});





              
        $(document).on("change",".with-gap",function(e){
            
            if($(this).val() == "503"){
              $("input[name='custom[102]']").parent("div").parent("div").show();
              $("input[name='custom[103]']").parent("div").parent("div").show();
              $("input[name='custom[104]']").parent("div").parent("div").show();
            }else{
              $("input[name='custom[102]']").parent("div").parent("div").hide();
              $("input[name='custom[103]']").parent("div").parent("div").hide();
              $("input[name='custom[104]']").parent("div").parent("div").hide();
            }
        })
    
        $('#pboc, #psampath').css("display", "none");
        $('.user-menu').on('click', function () {
           $(this).toggleClass('active');
        });
         
         if($('#payment').val() === "boc"){
              $('#pboc').css("display", "block");
              $('#psampath').css("display", "none");
         }
         
          $("#payment").change(function () {
              var selected_option = $('#payment').val();
              if (selected_option === 'boc') {
                 $('#pboc').css("display", "block");
              }else if(selected_option === 'sampath_bank'){
                  $('#psampath').css("display", "block");
                  $('#pboc').css("display", "none");
              }else{
                  console.log("boom");
              }
          });
          
          $('input[name="network_option"]').change(function() {
              packageSelector(this.value);
              console.log(this.value);
          });
          
          function packageSelector(selector){
              if (selector === "ikmanPkg"){
                  $("#"+selector+".list-group").slideDown('slow');
              }else{
                  $("#ikmanPkg.list-group").slideUp('slow');
              }
              if (selector === "budgetwebsites"){
                  $("#"+selector+".list-group").slideDown('slow');
              }else{
                  $("#budgetwebsites.list-group").slideUp('slow');
              }
              if (selector === "lankadeepa"){
                  $("#"+selector+".list-group").slideDown('slow');
              }else{
                  $("#lankadeepa.list-group").slideUp('slow');
              }
              if (selector === "sundaytimeshitad"){
                  $("#"+selector+".list-group").slideDown('slow');
              }else{
                  $("#sundaytimeshitad.list-group").slideUp('slow');
              }
              if (selector === "silumina"){
                  $("#"+selector+".list-group").slideDown('slow');
              }else{
                  $("#silumina.list-group").slideUp('slow');
              }
              if (selector === "sundayobserver"){
                  $("#"+selector+".list-group").slideDown('slow');
              }else{
                  $("#sundayobserver.list-group").slideUp('slow');
              }
              if (selector === "facebookad"){
                  $("#"+selector+".list-group").slideDown('slow');
              }else{
                  $("#facebookad.list-group").slideUp('slow');
              }
          }
          
        });
    </script>
</body>

</html>
