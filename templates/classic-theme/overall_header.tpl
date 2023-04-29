<!DOCTYPE html>
<html lang="{LANG_CODE}" dir="{LANGUAGE_DIRECTION}">
<head><meta http-equiv="Content-Type" content="text/html; charset=utf-8">
    
    <title>IF("{PAGE_TITLE}"!=""){ {PAGE_TITLE} - {:IF}{SITE_TITLE}</title>
    
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="author" content="Siyaluma.lk">
    <meta name="keywords" content="{PAGE_META_KEYWORDS}">
    <meta name="description" content="{PAGE_META_DESCRIPTION}">
    <meta name="google-site-verification" content="kgzU4hYp8Dxp_ZLVYGiJErx7NwQCCQpSO9e7666EepM" />
    <meta name="msvalidate.01" content="2AF0F645A14B31E97D9267A4C27C7B71" />
    <meta name="yandex-verification" content="6e34b613ef9f5a51" />
    <meta name="theme-color" content="#5e2ced"/>
    <meta property="fb:app_id" content="{FACEBOOK_APP_ID}" />
    <meta property="og:site_name" content="Siyaluma.lk" />
    <meta property="og:locale" content="en_US" />
    <meta property="og:url" content="{PAGE_LINK}" />
    <meta property="og:title" content="Siyaluma.lk" />
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
l
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
                        <!--<span class="hotline"><i class="fa fa-phone"></i> 0702766942</span>-->
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
    
    
<!--<center>නව නියෝජිතභාවය ලබා දීම සම්පූර්ණයෙන්ම අත්හිටුවා ඇත. අලෙවි නියෝජිතයන් ලෙස පෙනී සිටිමින් ලබා දෙන නියෝජිතභාවයන් සදහා අප වග කියනු නොලැබේ. මේ සම්බන්ධව විමසීම් සදහා 0778544700 අමතන්න - 25/12/2020</center>
-->
<center><h2 style="color:green"> මිළ ගණන් වෙනස් වී ඇත. වැඩි විස්තර සදහා අමතන්න. 0702766942 - December 1st, 2022</h2></center>



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