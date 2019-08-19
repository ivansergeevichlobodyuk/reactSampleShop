jQuery(document).ready(function () {
    function showLoader() {
        $('#loader, .loader-overlay').removeClass('uk-hidden');
    }
    function hideLoader() {
        $('#loader, .loader-overlay').addClass('uk-hidden');
    }
    $("#create_order").click(function(e){
        e.preventDefault();
       // alert("111");
       var stop = validate();
       if ( !stop ){
       showLoader();
        $.ajax({
            url: url_create_order,
            type: "POST",
            data: {
                'name':$("#form-name").val(),
                'second_name':$("#form-second-name").val(),
                'city':$("#form-city").val(),
                'address': $("#form-address1").val(),
                'phone': $("#form-phone").val(),
                'email': $('#form-email').val(),
                'description': $("#description").val(),
                'is_offline': 0
            }
        }).success(function(data){
            hideLoader();
            UIkit.notification({"message":msg_order_created})
            setTimeout(function(){
                window.location = url_payment_type+"?order_id="+data.order_id;
                },3000);
            });
        }
    });

    $("#checkout-start input").change(function(){
        $(this).removeClass('uk-form-danger');
    });

    function validate(){
        var stop = false;
        $("#checkout-start input").each(function(inx,itm){
            if ( $(itm).val() ){

            }else{
                $(itm).addClass("uk-form-danger uk-text-emphasis");
                stop = true;
            }
        });

        return stop;
    }


    $("#create_offline_order").click(function(e){
        e.preventDefault();
        var stop = validate();
        if ( !stop ) {
            showLoader();
            $.ajax({
                url: url_create_order,
                type: "POST",
                data: {
                    'name': $("#form-name").val(),
                    'second_name': $("#form-second-name").val(),
                    'city': $("#form-city").val(),
                    'address': $("#form-address1").val(),
                    'phone': $("#form-phone").val(),
                    'email': $('#form-email').val(),
                    'description': $("#description").val(),
                    'is_offline': 1
                }
            }).success(function (data) {
                hideLoader();
                UIkit.notification({"message": msg_order_created})
                setTimeout(function () {
                    window.location = offline_checkout_success_page + "?order_id=" + data.order_id;
                }, 3000);
            });
        }
    });


});
