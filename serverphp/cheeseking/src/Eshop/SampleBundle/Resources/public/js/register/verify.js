jQuery(document).ready(function () {

    $("#resend").click(function(e){
        e.preventDefault();

        if ( isLoggedIn ){
            $("#token").removeClass("uk-hidden");
            $("#code").removeClass("uk-hidden");
            $("#code-label").removeClass("uk-hidden");
            $("#verify").removeClass("uk-hidden");
        }

        $.ajax({
            type: "POST",
            url: SMS_VERIFICATION_URL,
            data: {'verify': hash},
        }).success(function(dataSuccess){
            console.log('dataSuccess', dataSuccess)
            UIkit.notification({'message':dataSuccess.message});
            hideLoader( );
        }).fail(function(dataFail){
            UIkit.notification({'message':dataFail.responseJSON.message, 'status':'danger'});
            hideLoader( );
            console.log('dataSuccess', dataFail.responseJSON);
            setTimeout(function () {
                window.location = dataFail.responseJSON.redirect;
            }, 2800);
        });
    });

    $("#verify").click(function(e){
        e.preventDefault();
        showLoader();

        $.ajax({
            type: 'POST',
            data: {"code":$("#code").val(),'hash':hash},
            url: urlCheckCode
        }).success(function(dataSuccess){
            console.log('dataSuccess', dataSuccess)
            UIkit.notification({'message':dataSuccess.message});
            setTimeout(function () {
                window.location = dataSuccess.redirect;
            }, 2800);
            hideLoader( );
        }).fail(function(dataFail){
            UIkit.notification({'message':dataFail.responseJSON.message, 'status':'danger'});
            hideLoader( );

            console.log('dataSuccess', dataFail.responseJSON);
            setTimeout(function () {
                if ( dataFail.responseJSON.redirect ){
                    window.location = dataFail.responseJSON.redirect;
                }
            }, 2800);
        });

    });

    function hideForm(){

    }

    function showLoader() {
        $('#loader, .loader-overlay').removeClass('uk-hidden');
    }
    function hideLoader() {
        $('#loader, .loader-overlay').addClass('uk-hidden');
    }

});