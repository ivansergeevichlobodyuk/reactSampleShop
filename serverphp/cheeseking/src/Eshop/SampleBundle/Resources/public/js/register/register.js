var _captchaTries = 0;
function recaptchaOnload() {
    _captchaTries++;
    if (_captchaTries > 9)
        return;
    if ($('.g-reCAPTCHA').length > 0) {
        grecaptcha.render("iden-rec", {
            sitekey: '6Ld44KkUAAAAAH79ZQKSv4K3RkejgILydCbXVCM5',
            callback: function() {
                console.log('recaptcha callback');
            }
        });
        return;
    }
    window.setTimeout(recaptchaOnload, 1000);
}
jQuery(document).ready(function () {
    function showLoader() {
        $('#loader, .loader-overlay').removeClass('uk-hidden');
    }
    function hideLoader() {
        $('#loader, .loader-overlay').addClass('uk-hidden');
    }

    $("#register").submit(function(e){
        e.preventDefault();
        // var fields = $("#register :input[type=text], #register :input[type=password], #register :input[type=email]");
        var fields = $("#register :input");
        var data = [];
        console.log( "data DATA ", data );
        fields.each(function(inx,itm){
           data[itm.name]=$(itm).val();
        });
        data['captcha'] = grecaptcha.getResponse();
        var data = $.extend({},data);
        console.log("data FROM FORM!!! ",data);
        $(e.currentTarget).find('ul').remove();
        showLoader();
        $.ajax({
          type: 'POST',
          data: data,
          url: $(e.currentTarget).attr("action")
        }).success(function(data){
            console.log( "data LLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLLL", data );
//            UIkit.notification({'message':MSG_OK_REG});
            // send sms verification
                $.ajax({
                    type: "POST",
                    url: SMS_VERIFICATION_URL,
                    data: {'verify': data.hash},
                }).success(function(dataSuccess){
                    console.log('dataSuccess', dataSuccess)
                    UIkit.notification({'message':dataSuccess.message});
                    hideLoader( );
                    setTimeout(function () {
                        window.location = dataSuccess.redirect;
                    }, 2800);
                }).fail(function(dataFail){
                    UIkit.notification({'message':dataFail.responseJSON.message, 'status':'danger'});
                    hideLoader( );
                    console.log('dataSuccess', dataFail.responseJSON);
                    setTimeout(function () {
                        window.location = dataFail.responseJSON.redirect;
                    }, 2800);
                });
            // end block

        }).fail(function(data){
            var json = JSON.parse(data.responseText);
            console.log("json json ", json);
            for ( var key in json ){
                $("#"+"user_"+key).addClass("uk-danger");
                var parent = $("#"+"user_"+key.replace(".","_")).parent( );
                $(parent).find("ul").remove();
                parent.append('<ul class="uk-list"><li class="ch-simle-text uk-text-small" style="border-bottom: 2px solid red;">'+json[key]+'</li></ul>');
            }
            grecaptcha.reset();
            hideLoader();
        })
    })
    $('#register input').blur(function(){
        if ($(this).val().length <= 0) {
            $(this).css('border', '1px solid #ff0000');
            $(this).attr('placeholder', 'The field is not be empty');
        }else{
            $(this).css('border', '1px solid #597884');
            $(this).removeAttr('placeholder');
        }

    })
    function validateEmail(email) {
        var re = /^(([^<>()[\]\\.,;:\s@\"]+(\.[^<>()[\]\\.,;:\s@\"]+)*)|(\".+\"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
    }
});
