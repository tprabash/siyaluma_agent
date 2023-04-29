
<div class="footer-section">
    <div class="container">
        <div class="row">
            <div class="col-md-4 col-sm-12">
                <div class="ft-logo"><img src="{SITE_URL}storage/logo/{SITE_LOGO}" alt="Footer Logo"></div>
                <p>{FOOTER_TEXT}</p>
                <a href="https://play.google.com/store/apps/details?id=mobilab.webview.siyalumaapplication">
                    <img src="{SITE_URL}templates/{TPL_NAME}/images/android.png" alt="{SITE_URL}templates/{TPL_NAME}/images/android.png">
                </a>
            </div>

            <div class="col-md-2 col-sm-6">
                <h5>{LANG_HELP_SUPPORT}</h5>
                <ul class="helpMenu">
                    <li><a href="{LINK_FAQ}">{LANG_FAQ}</a></li>
                    <li><a href="{LINK_FEEDBACK}">{LANG_FEEDBACK}</a></li>
                    <li><a href="{LINK_CONTACT}">{LANG_CONTACT}</a></li>
                </ul>
            </div>
            <div class="col-md-3 col-sm-6">
                <h5>{LANG_INFORMATION}</h5>
                <ul class="helpMenu">
                    {LOOP: HTMLPAGE}
                    <li><a href="{HTMLPAGE.link}">{HTMLPAGE.title}</a></li>
                    {/LOOP: HTMLPAGE}
                    
                    <li><a href="{LINK_SITEMAP}">{LANG_SITE-MAP}</a></li>
                </ul>
                <div class="clear"></div>
            </div>
            <div class="col-md-3 col-sm-12">
                <h5>{LANG_CONTACT-US}</h5>
 
                IF("{EMAIL}"!=""){
                <div class="email"><a href="mailto:{EMAIL}">{EMAIL}</a></div>
                {:IF}
                <div class="phone"><a href="tel:0702766942">0702766942</a></div>
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
                <p>(C) <?php echo date("Y"); ?> Siyaluma.lk, All right reserved.</p>
            </div>
        </div>
    </div>
</div>

<script>
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
<script src="{SITE_URL}templates/{TPL_NAME}/js/sweetalert/sweetalert.min.js"></script>
<script src="{SITE_URL}templates/{TPL_NAME}/js/sweetalert/jquery.sweet-alert.custom.js"></script>
<script src='{SITE_URL}templates/{TPL_NAME}/js/user-ajax.js?v=1.27'></script>
<script src='{SITE_URL}templates/{TPL_NAME}/js/jquery.twism.js'></script>
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/jquery-cookie/1.4.1/jquery.cookie.min.js"></script>
<script>

if($('#countryMap').length > 0){
				$('#countryMap').css('cursor', 'pointer');
				$('#countryMap').twism("create",	{
					map: "custom",
					customMap: 'storage/lk.svg',
					backgroundColor: 'rgba(0,0,0,0)',
					border: '#ffffff',
					hoverBorder: '#4682B4',
					borderWidth: 4,
					color: '#3b5998',
					width: '500px',
					height: '500px',
					hover: function(regionId) {
						if (typeof regionId == "undefined") {
							return false;
						}
						var selectedIdObj = document.getElementById(regionId);
						if (typeof selectedIdObj == "undefined") {
							return false;
						}
						selectedIdObj.style.fill = '#0074ba';
						//console.log(document.getElementById(regionId).getAttribute('name'));
					    var c_name = $('#'+regionId).attr('name');
						$('#'+regionId).popover({
                            placement:'right',
                            trigger:'hover',
                            html:true,
                            content: c_name
                        });
						return;
					},
					unhover: function(regionId) {
						if (typeof regionId == "undefined") {
							return false;
						}
						var selectedIdObj = document.getElementById(regionId);
						if (typeof selectedIdObj == "undefined") {
							return false;
						}
						selectedIdObj.style.fill = '#3b5998';
						return;
					}
				});

                $(".siyalumaMapSelector").hover(function(){
                    var selectedIdObj = document.getElementById($(this).attr("data-regionid"));
                        if (typeof selectedIdObj == "undefined") {
                            return false;
                        }
                        selectedIdObj.style.fill = '#0074ba';
                        return;
                }, function(){
                    var selectedIdObj = document.getElementById($(this).attr("data-regionid"));
                        if (typeof selectedIdObj == "undefined") {
                            return false;
                        }
                        selectedIdObj.style.fill = '#3b5998';
                        return;
                });
        }
			
</script>


</div>
</body></html>