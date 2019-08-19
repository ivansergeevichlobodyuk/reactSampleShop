jQuery(document).ready(function () {

    function showLoader() {
        $('#loader, .loader-overlay').removeClass('uk-hidden');
    }
    function hideLoader() {
        $('#loader, .loader-overlay').addClass('uk-hidden');
    }

    function validatePass( ){
        var res = 1;
        if ( $("#password1").val() != $("#password2").val()  ){
            res = wrongPassEqual;
        }else{
            if ( $("#password1").val().match(/^(?=.*[0-9])(?=.*[a-z])([a-zA-Z0-9]{5,})$/) ){

            }else{
                res = messageWrongFormat;
            }
        }
        return res;
    }

    $("#change").click(function (e) {
        var res = validatePass();
        showLoader();
        if ( res == 1){
            $.ajax({
                url: urlChange,
                type: "POST",
                data: {password:$("#password1").val(), hash: hash, token: $("#token").val()}
            }).success(function(data){
                UIkit.notification({message:messageOkChanged});
                hideLoader();
                setTimeout(function() {
                    window.location = redirect;
                }, 2000);
            }).error( function (data){
                hideLoader();
                UIkit.notification({message:data.responseJSON.message});
            })
        }else{
            UIkit.notification({message:res});
            hideLoader();
        }
    })
})