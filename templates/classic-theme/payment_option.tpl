{OVERALL_HEADER}
<!-- Payment-Method-page -->
 <script type="text/javascript" src="{SITE_URL}templates/{TPL_NAME}/js/jquery.validate.js"></script>
<section id="main" class="clearfix  ad-profile-page">
    <div class="container">
        <div class="breadcrumb-section">
            <!-- breadcrumb -->
            <ol class="breadcrumb">
                <li><a href="{LINK_INDEX}"><i class="fa fa-home"></i> {LANG_HOME}</a></li>
                <li class="active">{LANG_PAYMENT_METHOD}</li>
                <div class="pull-right back-result"><a href="{LINK_LISTING}"><i class="fa fa-angle-double-left"></i>
                        {LANG_BACK-RESULT}</a></div>
            </ol>
            <!-- breadcrumb -->
        </div>
        <!-- Main Content -->
    
        <div class="row">
            <!-- Page-Content -->
            <div class="col-lg-8 col-md-8 page-content">
                <div class="boxed-widget opening-hours summary">
                <form method="post" action="https://www.payhere.lk/pay/checkout" id="paymentForm">   
                <div class="row">
                  <div class="col-xs-6">
                    <label for="first_name">Your Name: </label>
                    <input type="hidden" name="merchant_id" value="210919">
                    <input type="hidden" name="last_name" value="Siyaluma">
                    <input type="hidden" name="city" value="Colombo">
                    <input type="hidden" name="country" value="Sri Lanka">
                    <input type="hidden" name="order_id" value="{ORDER_ID}">
                    <input type="hidden" name="items" value="{ORDER_TITLE}">
                    <input type="hidden" name="custom_1" value="{TOKEN}">
                    <input type="hidden" name="currency" value="LKR">
                    <input type="hidden" name="amount" value="50">            <!-- {AMOUNT} -->
                    <input type="hidden" name="return_url" value="https://www.siyaluma.lk/payment-middleware">
                    <input type="hidden" name="cancel_url" value="https://www.siyaluma.lk/cancel">
                    <input type="hidden" name="notify_url" value="https://www.siyaluma.lk/payment.php">
                    <input type="text" class="form-control required" id="first_name" name="first_name" value="{NAME}">
                  </div>
                  <div class="col-xs-6">
                    <label for="email">Email: </label>
                    <input type="email" class="form-control required" id="email" name="email" value="{EMAIL}">
                  </div>
                  <div class="col-xs-6">
                      <label for="phone">Phone: </label>
                      <input type="text" class="form-control required" id="phone" name="phone" value="{PHONE}">
                  </div>
                  <div class="col-xs-6">
                    <label for="address">Address: </label>
                    <input type="text" class="form-control required" id="address" name="address" value="{ADDRESS}">
                  </div>
                  <div class="col-xs-12">
                      <button type="submit" class="btn btn-primary" style="margin-top: 20px;">Proceed To Payment</button>
                  </div>
                </div>
               </form> 
               </div>
            </div>

            <div class="col-lg-4 col-md-4 margin-bottom-30">
                <div class="boxed-widget opening-hours summary margin-top-0">
                    <h3><i class="fa fa-calendar-check-o"></i> Payment Summary</h3>
                    <ul>
                        <li>{LANG_TITLE} <span>{ORDER_TITLE}</span></li>
                        <li>Package<span>{PACKAGE}</span></li>
                        <li class="total-costs">{LANG_TOTAL_COST} <span>{CURRENCY_SIGN}{AMOUNT} {CURRENCY_CODE}</span></li>
                    </ul>

                </div>
            </div>
        </div>
    </div>
</section>
<script type="text/javascript">
    $(document).ready(function() {
        $("#paymentForm").validate();
    });
</script>
{OVERALL_FOOTER}

