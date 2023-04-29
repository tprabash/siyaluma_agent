$(document).ready(function() {
    // -------------------------------------------------------------
    //  prepare the form when the DOM is ready
    // -------------------------------------------------------------
    $('#submit_advertise').on('click', function (e) {
        e.stopPropagation();
        e.preventDefault();
        post_advertise();
    });
});
var payment_uri = '';

function post_advertise(){
    $('#submit_advertise').addClass('bookme-progress').prop('disabled', true);

    // submit the form
    $('#post-advertise-form').ajaxSubmit(function(data) {
        data = JSON.parse(data);

        if(data.status == "error"){
            if(data["errors"].length > 0){
                for(var i=0;i<data["errors"].length;i++){
                    var $message = data["errors"][i]["message"];
                    if(i == 0){
                        $('#post_error').html('<article class="byMsg byMsgError" id="formErrors">! '+$message+'</article>');
                    }else{
                        $('#post_error').append('<article class="byMsg byMsgError" id="formErrors">! '+$message+'</article>');
                    }
                }
                $('html, body').animate({
                    scrollTop: $("#post_error").offset().top
                }, 2000);
            }
            $('#submit_advertise').removeClass('bookme-progress').prop('disabled', false);
        }
        else if(data.status == "success"){
            if(data.ad_type == "package"){
                //window.location = data.redirect;
                payment_uri = data.redirect;
                $('#post_ad_email_exist').removeClass('show').addClass('hide');
                $('#ad_post_title').hide();
                $('#ad_post_form').hide();
                $('#post_success_uploaded').show();
                var delay = 2000;
                setTimeout(function(){ window.location = data.redirect; }, delay);
                $('#submit_advertise').removeClass('bookme-progress').prop('disabled', false);
                /*$('#premium_ad_modal #display_premium_tpl').html(data.tpl);
                $('#premium_ad_modal').removeClass('hide').addClass('show');
                $('#submit_advertise').removeClass('bookme-progress').prop('disabled', false);*/
            }else{
                $('#post_ad_email_exist').removeClass('show').addClass('hide');
                $('#ad_post_title').hide();
                $('#ad_post_form').hide();
                $('#post_success_uploaded').show();
                var delay = 2000;
                setTimeout(function(){ window.location = data.redirect; }, delay);
                $('#submit_advertise').removeClass('bookme-progress').prop('disabled', false);
            }

        }
        else if(data.status == "email-exist"){

            $('#post_ad_email_exist #quickad_email_already_linked').html(data.errors);
            $('#post_ad_email_exist #quickad_username_display').html(data.username);
            $('#post_ad_email_exist #quickad_email_display').html(data.email);
            $('#post_ad_email_exist #username').val(data.username);
            $('#post_ad_email_exist #email').val(data.email);
            $('#post_ad_email_exist').removeClass('hide').addClass('show');
            $('#submit_advertise').removeClass('bookme-progress').prop('disabled', false);

        }

    });
    // return false to prevent normal browser submit and page navigation
    return false;
}

$(document).ready(function() {

    
    $('.quickad-template .modal .close').on('click', function () {
        $('#post_ad_email_exist').removeClass('show').addClass('hide');
        $('#premium_ad_modal').removeClass('show').addClass('hide');
    });

    $("#premium_ad_modal #paymentModalConfirmButton").click(function () {
        $('#premium_ad_modal #post_loading').show();
        $('#premium_ad_modal .ModalPayment-figure').hide();
        window.location = payment_uri;
    });
    $("#post_ad_email_exist #link_account").click(function () {
        $('#post_ad_email_exist #post_loading').show();
        var action = "ajaxlogin";
        var $formData = {
            action: action,
            username: $("#username").val(),
            password: $("#password").val(),
            is_ajax: 1
        };

        $.ajax({
            type: "POST",
            url: ajaxurl,
            data: $formData,
            success: function (response) {
                if (response == "success") {
                    $('#post_ad_email_exist #link_account_welcome').hide();
                    $('#post_ad_email_exist #link_account_success').show();
                    $('#post_ad_email_exist #link_account_error').html('').hide();

                    post_advertise();
                }
                else {
                    $('#post_ad_email_exist #link_account_error').html(response).show();
                    post_advertise();
                }
                $('#post_ad_email_exist #post_loading').hide();
            }
        });
        return false;
    });

    /* Get and Bind cities */
    $('#postadcity').select2({
        ajax: {
            url: ajaxurl + '?action=searchCityFromCountry',
            dataType: 'json',
            delay: 50,
            data: function (params) {
                var query = {
                    q: params.term, /* search term */
                    page: params.page
                };

                return query;
            },
            processResults: function (data, params) {
                /*
                // parse the results into the format expected by Select2
                // since we are using custom formatting functions we do not need to
                // alter the remote JSON data, except to indicate that infinite
                // scrolling can be used
                */
                params.page = params.page || 1;

                return {
                    results: data.items,
                    pagination: {
                        more: (params.page * 10) < data.totalEntries
                    }
                };
            },
            cache: true
        },
        escapeMarkup: function (markup) { return markup; }, /* let our custom formatter work */
        minimumInputLength: 2,
        templateResult: function (data) {
            return data.text;
        },
        templateSelection: function (data, container) {
            return data.text;
        }
    });

    $('.file-upload-previews').on('click','#removeAdImg', function(e) {
        // Keep ads item click from being executed.
        e.stopPropagation();
        // Prevent navigating to '#'.
        e.preventDefault();
        // Ask user if he is sure.

        var id = $(this).data('item-id');
        var img = $(this).data('img-name');
        var action = 'removeAdImg';
        var $item = $(this).closest('.MultiFile-label');
        var delPrevImg = $('#deletePrevImg').val();
        if(delPrevImg != ""){
            $('#deletePrevImg').val(delPrevImg+','+img);
        }else{
            $('#deletePrevImg').val(img);
        }
        $('.file-upload').show();
        $item.remove();
    });
});


$('#premium_ad_modal form').bind("keypress", function(e) {
    if (e.keyCode == 13) {
        e.preventDefault();
        return false;
    }
});
$('#post_ad_email_exist form').bind("keypress", function(e) {
    if (e.keyCode == 13) {
        e.preventDefault();
        return false;
    }
});


/*--------------------------------------
			POST SLIDER
	--------------------------------------*/
if(jQuery('#tg-dbcategoriesslider').length > 0){

    if ($("body").hasClass("rtl")) var rtl = true;
    else rtl = false;
    var _tg_postsslider = jQuery('#tg-dbcategoriesslider');
    _tg_postsslider.owlCarousel({
        items : 4,
        rows: 3,
        nav: true,
        rtl: rtl,
        loop: false,
        dots: false,
        autoplay: false,
        dotsClass: 'tg-sliderdots',
        navClass: ['tg-prev', 'tg-next'],
        navContainerClass: 'tg-slidernav',
        navText: ['<span class="icon-chevron-left"></span>', '<span class="icon-chevron-right"></span>'],
        responsive:{
            0:{ items:2, },
            640:{ items:3, rows: 2, },
            768:{ items:4, rows: 3, },
        }
    });
}
// -------------------------------------------------------------
//  select-main-category Change
// -------------------------------------------------------------
$('.select-category.post-option .tg-category').on('click', function () {
    $('.select-category.post-option .tg-category.selected').removeClass('selected');
    $(this).addClass('selected');
    $('#sub-category-loader').css("visibility", "visible");
    $("#sub_category").html('');
    var catid = $(this).data('ajax-catid');
    var action = $(this).data('ajax-action');
    var data = {action: action, catid: catid};
    $('#main-category-text').html($(this).data('cat-name'));
    $('#input-maincatid').val(catid);
    getsubcat(catid, action, "");
    $(".tg-subcategories").show();
    $('#input-subcatid').val('');
    $('#sub-category-text').html('--');
});
// -------------------------------------------------------------
//  select-sub-category Change
// -------------------------------------------------------------
$('#sub_category').on('click', 'li', function (e) {

    var $item = $(this).closest('li');
    $('#sub_category li.selected').removeClass('selected active');
    $item.addClass('selected');
    var subcatid = $item.data('ajax-subcatid');
    var photoshow = $item.data('photo-show');
    var priceshow = $item.data('price-show');
    $('#input-subcatid').val(subcatid);
    $('#sub-category-text').html($item.text());

    $('#change-category-btn').show();
    // -------------------------------------------------------------
    //  Get custom fields
    // -------------------------------------------------------------
    var catid = $('#input-maincatid').val();
    var action = 'getCustomFieldByCatID';
    var data = { action: action, catid: catid , subcatid: subcatid };
    $.ajax({
        type: "POST",
        url: ajaxurl+"?action="+action,
        data: data,
        success: function(result){
            if(result!=0){
                $("#ResponseCustomFields").html(result);
                $('#custom-field-block').show();
            }
            else{
                $('#custom-field-block').hide();
                $("#ResponseCustomFields").html('');
            }

        }
    });
    if(photoshow == 1){
        $('#quickad-photo-field').show();
    }else{
        $('#quickad-photo-field').hide();
    }
    if(priceshow == 1){
        $('#quickad-price-field').show();
    }else{
        $('#quickad-price-field').hide();
    }
    $('#choose-category').text(lang_edit_cat);
    $( "#dismiss-modal" ).trigger( "click" );
});

function getsubcat(catid, action, selectid) {
    var data = {action: action, catid: catid, selectid: selectid};
    $.ajax({
        type: "POST",
        url: ajaxurl + '?action=' + action,
        data: data,
        success: function (result) {
            $("#sub_category").html(result);
            $('#sub-category-loader').css("visibility", "hidden");
        }
    });
}

function fillPrice(obj, val) {
    if ($(obj).is(':checked')) {
        var a = $('#totalPrice').text();
        var c = parseInt(a, 10) + parseInt(val, 10);
    }
    else {
        var a = $('#totalPrice').text();
        var c = parseInt(a, 10) - parseInt(val, 10);
    }

    $('#ad_total_cost_container').show();
    if(c==0){
        $('#ad_total_cost_container').hide();
    }
    $('#totalPrice').html(c);
}


// $('.user-menu').on('click', function () {
//         $(this).toggleClass('active');
//     });

$(document).ready(function() {

    
    var dispatch = '';
    var expected_sale_price = '';
    var current_vlue = '';
    
    $('.tg-thememodal').on('hidden.bs.modal', function () {
       current_vlue = parseInt($("#input-subcatid").val());
       //var expected_sale_price = parseInt(("input[name='price']").val());
      //current_vlue == 51;
    });


 
 
  $("input[name='price']").on('change keyup paste', function () {
      
    var unit_price = $("select[name='custom[4]']").val();
    
    var land_size =   $("input[name='custom[3]']").val();
    
    $("input[name='custom[3]']").on('change keyup paste', function () {
        land_size = parseInt(this.value);
    });
    
    $("select[name='custom[4]").on('change', function() {
        unit_price = parseInt(this.value);
    });    
     
        var checkVal = parseInt($("input[name='price']").val());
         //Lorries > Vans > Buses > Cars > Heavy Machinery & Tractors
        if(current_vlue == parseInt(143) || current_vlue == parseInt(142) || current_vlue == parseInt(51) || current_vlue == parseInt(47) ||  current_vlue == parseInt(53)){
            if(checkVal <= parseInt(7999999)){
                 $("#ikman").text("Rs." +3000);
                 $("#cikman").text("Rs." +2550);
            }else if(checkVal >= parseInt(7999999) && checkVal <= parseInt(14999999)){
                 $("#ikman").text("Rs." +3800);
                 $("#cikman").text("Rs." +3300);
            }else if(checkVal > parseInt(14999999)){
                  $("#ikman").text("Rs." +4800);
                  $("#cikman").text("Rs." +4200);
            }else{
                return false;
            }
            //Motorbikes > Auto Parts
        }else if(current_vlue == parseInt(48)){
         $("#ikman").text("Rs." +1050);
         $("#cikman").text("Rs." +1200);             
        }else if(current_vlue == parseInt(49) || current_vlue == parseInt(55)){
            if(checkVal <= parseInt(99999)){
                 $("#ikman").text("Rs." +150);
                 $("#cikman").text("Rs." +300); 
            }else if(checkVal >= parseInt(99999)){
                 $("#ikman").text("Rs." +1050);
                 $("#cikman").text("Rs." +1200); 
            }else{
                return false;
            }
            //Push Cycles > Boats
        }else if(current_vlue == parseInt(50) || current_vlue == parseInt(56)){
            $("#ikman").text("Rs." +500);
            $("#cikman").text("Rs." +600); 
            //Auto Services 
        }else if(current_vlue == parseInt(54)){
            if(checkVal <= parseInt(99999)){
                 $("#ikman").text("Rs." +150);
                 $("#cikman").text("Rs." +300); 
            }else if(checkVal >= parseInt(99999)){
                 $("#ikman").text("Rs." +1350);
                 $("#cikman").text("Rs." +1600); 
            }else{
                return false;
            }
            //Property > Houses > Commercial Property > Apartments
        }else if( current_vlue == parseInt(58) ||  current_vlue == parseInt(63) ||  current_vlue == parseInt(61) ||  current_vlue == parseInt(67) ||  current_vlue == parseInt(64) ||  current_vlue == parseInt(59)){                
            if(checkVal <= parseInt(7999999)){
                 $("#ikman").text("Rs." +3000);
                 $("#cikman").text("Rs." +2550);
                 //fixed
            }else if(checkVal >= parseInt(7999999) && checkVal <= parseInt(14999999)){
                 $("#ikman").text("Rs." +3800);
                 $("#cikman").text("Rs." +3300);
            }else if(checkVal > parseInt(14999999)){
                  $("#ikman").text("Rs." +4800);
                  $("#cikman").text("Rs." +4200);
            }else{
                return false;
            }
            //Portions & Rooms
        }else if(current_vlue == parseInt(65)){
                 $("#ikman").text("Rs." +2400);
                 $("#cikman").text("Rs." +2800); 
        //} 
            //Holiday & Short-Term Rental
        }else if(current_vlue == parseInt(66)){
                       //bug fixed
            if(checkVal <= parseInt(99999)){
                 $("#ikman").text("Rs." +150);
                 $("#cikman").text("Rs." +300); 
            }else if(checkVal >= parseInt(99999)){
                 $("#ikman").text("Rs." +2050);
                 $("#cikman").text("Rs." +2400); 
            }else{
                return false;
            } 
            //Land 
            //bug fixed
        }else if(current_vlue == parseInt(57) || current_vlue == parseInt(62) ){
                var total = land_size * checkVal;
                 //4M
                 if(total <= parseInt(4999999)){
                     $("#ikman").text("Rs." +3000);
                     $("#cikman").text("Rs." +2550); 
                     $('.notice').show();
                 }else if(total >= parseInt(4999999) && total <= parseInt(7999999)){
                    $("#ikman").text("Rs." +3200);
                    $("#cikman").text("Rs." +2750); 
                    $('.notice').show(); 
                 }else if(total >= parseInt(7999999) && total <= parseInt(1999999)){
                    $("#ikman").text("Rs." +4000);
                    $("#cikman").text("Rs." +3500); 
                    $('.notice').show(); 
                 }else if(total >= parseInt(1999999) && total <= parseInt(4999999)){
                    $("#ikman").text("Rs." +4500);
                    $("#cikman").text("Rs." +3900); 
                    $('.notice').show(); 
                }else if(total > parseInt(4999999)){
                  $("#ikman").text("Rs." +5100);
                  $("#cikman").text("Rs." +4400);
                  $('.notice').show();
                }else{
                    $('.notice').hide();
                    return false;
                }    
            // if(total <= parseInt(3999999)){
            //      $("#ikman").text("Rs." +2400);
            //      $("#cikman").text("Rs." +2800); 
            //      $('.notice').show();
            //      //4M - 8M
            // }else if(total >= parseInt(3999999) && total <= parseInt(7999999)){
            //      $("#ikman").text("Rs." +2600);
            //      $("#cikman").text("Rs." +3000);
            //      $('.notice').show();
            //      //8M - 12M
            // }else if(total >= parseInt(7999999) && total <= parseInt(11999999)){
            //      $("#ikman").text("Rs." +3400);
            //      $("#cikman").text("Rs." +3800);
            //      $('.notice').show();
            //      //12M - 20M
            // }else if(total >= parseInt(11999999) && total <= parseInt(19999999)){
            //      $("#ikman").text("Rs." +3800);
            //      $("#cikman").text("Rs." +4200);
            //      $('.notice').show();
            //      //20M - 30M
            // }else if(total >= parseInt(19999999) && total <= parseInt(29999999)){
            //      $("#ikman").text("Rs." +4000);
            //      $("#cikman").text("Rs." +4400);
            //      $('.notice').show();
            //      //30M ++
            // }else if(total > parseInt(29999999)){
            //       $("#ikman").text("Rs." +4400);
            //       $("#cikman").text("Rs." +4800);
            //       $('.notice').show();
            // }else{
            //     $('.notice').hide();
            //     return false;
            // }
                 //Electronics
                 //Mobile Phones
        }else if(current_vlue == parseInt(68)){
            if(checkVal <= parseInt(49999)){
                 $("#ikman").text("Rs." +150);
                 $("#cikman").text("Rs." +300); 
            }else if(checkVal >= parseInt(49999) && checkVal <= parseInt(99999)){
                 $("#ikman").text("Rs." +800);
                 $("#cikman").text("Rs." +900);
            }else if(checkVal > parseInt(99999)){
                  $("#ikman").text("Rs." +1050);
                  $("#cikman").text("Rs." +1200);
            }else{
                return false;
            }
            //Mobile Phone Accessories
        }else if(current_vlue == parseInt(69)){
            if(checkVal <= parseInt(49999)){
                 $("#ikman").text("Rs." +150);
                 $("#cikman").text("Rs." +300); 
            }else if(checkVal >= parseInt(49999) && checkVal <= parseInt(99999)){
                 $("#ikman").text("Rs." +500);
                 $("#cikman").text("Rs." +600);
            }else if(checkVal > parseInt(99999)){
                  $("#ikman").text("Rs." +800);
                  $("#cikman").text("Rs." +900);
            }else{
                return false;
            }
             //Computers & Tablets > Cameras & Camcorders > Air Conditions & Electrical fittings
        }else if(current_vlue == parseInt(70) || current_vlue == parseInt(74) || current_vlue == parseInt(77) ||  current_vlue == parseInt(79)){
            if(checkVal <= parseInt(49999)){
                 $("#ikman").text("Rs." +150);
                 $("#cikman").text("Rs." +300); 
            }else if(checkVal >= parseInt(49999) && checkVal <= parseInt(99999)){
                 $("#ikman").text("Rs." +800);
                 $("#cikman").text("Rs." +900);
            }else if(checkVal > parseInt(99999)){
                  $("#ikman").text("Rs." +1050);
                  $("#cikman").text("Rs." +1200);
            }else{
                return false;
            }
            //Computer Accessories > Audio & MP3  > Electronic Home Appliances > Video Games & Consoles
        }else if(current_vlue == parseInt(71) || current_vlue == parseInt(75) || current_vlue == parseInt(76) || current_vlue == parseInt(78)){
            if(checkVal <= parseInt(49999)){
                 $("#ikman").text("Rs." +150);
                 $("#cikman").text("Rs." +300); 
            }else if(checkVal >= parseInt(49999) && checkVal <= parseInt(99999)){
                 $("#ikman").text("Rs." +500);
                 $("#cikman").text("Rs." +600);
            }else if(checkVal > parseInt(99999)){
                  $("#ikman").text("Rs." +800);
                  $("#cikman").text("Rs." +900);
            }else{
                return false;
            }
            //TV & Video Accessories > TV
        }else if(current_vlue == parseInt(72) || current_vlue == parseInt(73)){
            if(checkVal <= parseInt(49999)){
                 $("#ikman").text("Rs." +150);
                 $("#cikman").text("Rs." +300);  
            }else if(checkVal >= parseInt(49999) && checkVal <= parseInt(99999)){
                 $("#ikman").text("Rs." +500);
                 $("#cikman").text("Rs." +600);
            }else if(checkVal > parseInt(99999)){
                  $("#ikman").text("Rs." +800);
                  $("#cikman").text("Rs." +900);
            }else{
                return false;
            }
                 //Home & Garden  Home & Garden >> Furniture
        }else if(current_vlue == parseInt(80)){
            if(checkVal <= parseInt(49999)){
                 $("#ikman").text("Rs." +300);
                 $("#cikman").text("Rs." +150); 
            }else if(checkVal >= parseInt(49999) && checkVal <= parseInt(99999)){
                 $("#ikman").text("Rs." +500);
                 $("#cikman").text("Rs." +600);
            }else if(checkVal > parseInt(99999)){
                  $("#ikman").text("Rs." +800);
                  $("#cikman").text("Rs." +900);
            }else{
                return false;
            }
                 //Home & Garden 
        }else if(current_vlue == parseInt(81) || current_vlue == parseInt(82) || current_vlue == parseInt(83) || current_vlue == parseInt(84) || current_vlue == parseInt(85) || current_vlue == parseInt(86)){
            if(checkVal <= parseInt(99999)){
                 $("#ikman").text("Rs." +150);
                 $("#cikman").text("Rs." +300); 
            }else if(checkVal >= parseInt(99999)){
                 $("#ikman").text("Rs." +1200);
                 $("#cikman").text("Rs." +1400); 
            }else{
                return false;
            } 
            //Hobby, Sport & Kids -> Musical Instruments -> Sports Equipment
        }else if(current_vlue == parseInt(96) || current_vlue == parseInt(97)){
            if(checkVal <= parseInt(49999)){
                 $("#ikman").text("Rs." +150);
                 $("#cikman").text("Rs." +300); 
            }else if(checkVal >= parseInt(49999) && checkVal <= parseInt(99999)){
                 $("#ikman").text("Rs." +500);
                 $("#cikman").text("Rs." +600);
            }else if(checkVal > parseInt(99999)){
                  $("#ikman").text("Rs." +800);
                  $("#cikman").text("Rs." +900);
            }else{
                return false;
            }
             //Hobby, Sport & Kids
        }else if(current_vlue > parseInt(97) && current_vlue < parseInt(103)){
            if(checkVal <= parseInt(99999)){
                 $("#ikman").text("Rs." +150);
                 $("#cikman").text("Rs." +300); 
            }else if(checkVal >= parseInt(99999)){
                 $("#ikman").text("Rs." +1200);
                 $("#cikman").text("Rs." +1400); 
            }else{
                return false;
            } 
                 //Animals 
        }else if(current_vlue > parseInt(120) && current_vlue < parseInt(127)){
                 if(checkVal <= parseInt(19999)){
                    $("#ikman").text("Rs." +150); 
                    $("#cikman").text("Rs." +300);
                 }
                 if(checkVal >= parseInt(19999)){
                     $("#cikman").text("Rs." +1200);
                     $("#ikman").text("Rs." +1050);
                 }
                 //Services & Education
        }else if(current_vlue > parseInt(109) && current_vlue < parseInt(121)){
                 $("#ikman").text("Rs." +1550);
                 $("#cikman").text("Rs." +1800);
                 //jobs sri lanka
        }else if(current_vlue == parseInt(131)){
                 $("#ikman").text("Rs." +2050);
                 $("#cikman").text("Rs." +2400); 
                    //jobs sri lanka
        }else if(current_vlue == parseInt(132)){
                 $("#ikman").text("Rs." +2500);
                 $("#cikman").text("Rs." +2900); 
                 //Solar & Generators
        }else if(current_vlue == parseInt(104)){
                 $("#ikman").text("Rs." +1550);
                 $("#cikman").text("Rs." +1800);
                 //Industry Tools & Machinery
        }else if(current_vlue == parseInt(105)){
                 $("#ikman").text("Rs." +1550);
                 $("#cikman").text("Rs." +1800);          
        }else if(current_vlue == parseInt(105)  || current_vlue == parseInt(106) || current_vlue == parseInt(107) || current_vlue == parseInt(108) || current_vlue == parseInt(109)){
                 $("#ikman").text("Rs." +150);
                 $("#cikman").text("Rs." +300);  
                //Food & Agriculture(common)
        }else if( current_vlue == parseInt(126) || current_vlue == parseInt(127) || current_vlue == parseInt(128) || current_vlue == parseInt(130) || current_vlue == parseInt(131)){
            if(checkVal <= parseInt(99999)){
                 $("#ikman").text("Rs." +150);
                 $("#cikman").text("Rs." +300); 
            }else if(checkVal >= parseInt(99999)){
                 $("#ikman").text("Rs." +1200);
                 $("#cikman").text("Rs." +1400); 
            }else{
                return false;
            } 
               //Farming Tools & Machinery
        }else if( current_vlue == parseInt(129)){
            if(checkVal <= parseInt(49999)){
                 $("#ikman").text("Rs." +150);
                 $("#cikman").text("Rs." +300); 
            }else if(checkVal >= parseInt(49999) && checkVal <= parseInt(99999)){
                 $("#ikman").text("Rs." +500);
                 $("#cikman").text("Rs." +600);
            }else if(checkVal > parseInt(99999)){
                  $("#ikman").text("Rs." +800);
                  $("#cikman").text("Rs." +900);
            }else{
                return false;
            } 
        }else if( current_vlue == parseInt(54)) {
                 $("#ikman").text("Rs." +1350);
                 $("#cikman").text("Rs." +1600);  
               //Other         
        }else if(current_vlue == parseInt(140) || current_vlue == parseInt(144)){
            if(checkVal <= parseInt(49999)){
                 $("#ikman").text("Rs." +150);
                 $("#cikman").text("Rs." +300);
            }else if(checkVal >= parseInt(49999) && checkVal <= parseInt(99999)){
                 $("#ikman").text("Rs." +500);
                 $("#cikman").text("Rs." +600);
            }else if(checkVal > parseInt(99999)){
                  $("#ikman").text("Rs." +800);
                  $("#cikman").text("Rs." +900);
            }else{
                return false;
            }            
        }else{
            console.log("boom");
        }
       //expected_sale_price = parseInt($("input[name='price']").val());
    });
    

    
    $('.tg-thememodal').on('hidden.bs.modal', function (e) {
        if($("ul#sub_category li.selected").attr('data-ajax-subcatid') === "134" || $("ul#sub_category li.selected").attr('data-ajax-subcatid') === "135"){
           $('.notice').css("display", "block"); 
        }else{
           $('.notice').css("display", "none");  
        }
    });
    
    

    

});
