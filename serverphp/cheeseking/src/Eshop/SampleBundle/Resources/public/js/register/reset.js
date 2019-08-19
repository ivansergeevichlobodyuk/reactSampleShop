jQuery(document).ready(function () {

    function validateEmail(email) {
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(String(email).toLowerCase());
    }

    /**
     * Validates phone number
     *
     * @param phone
     * @returns {boolean}
     */
    function validatePhone(phone){
        var re = /\+?\d{12,16}/;
        return re.test(String(phone).toLowerCase());
    }

    function showLoader() {
        $('#loader, .loader-overlay').removeClass('uk-hidden');
    }
    function hideLoader() {
        $('#loader, .loader-overlay').addClass('uk-hidden');
    }

    $('input[type=radio][name=choose]').change(function(e) {
        console.log(" this id ", this.id);
        var choosed = this.id.replace('-choose','');
        console.log(" choosed ", choosed);
        if (choosed == 'email'){
            $("#email").removeClass('uk-hidden');
            $("#phone").addClass('uk-hidden');
        }else{
            $("#email").addClass('uk-hidden');
            $("#phone").removeClass('uk-hidden');
        }
    });

    $("#reset").click(function (e) {
        e.preventDefault();
        showLoader();
        console.log( "SHIT ", $('input[name=choose]:checked').val() );
        if ( $('input[name=choose]:checked').val() == 'email' ){
            if ( validateEmail( $("#email").val() ) ){
                $.ajax({
                    url: urlReset,
                    type: "POST",
                    data: {email: $("#email").val(), token: $("#token").val()}
                }).success(function(data){
                    UIkit.notification({"message":messageOk});
                    hideLoader();
                    setTimeout( function(){
                        window.location = redirect;
                    }, 2000 );
                }).error(function (data) {
                    UIkit.notification({"message":data.responseJSON.message});
                    hideLoader();
                    setTimeout(function(){
                        window.location.reload();
                    },2000);
                })
            }else{
                $("#email").addClass("uk-danger");
                UIkit.notification({"message":wrongEmail});
                hideLoader();
            }
        }else{
            if ( validatePhone( $("#phone").val() ) ){
                $.ajax({
                    url: urlReset,
                    type: "POST",
                    data: {phone: $("#phone").val(), token: $("#token").val()}
                }).success(function(data){
                    UIkit.notification({"message":messageOkPhone});
                    hideLoader();
                    setTimeout( function(){
                        window.location = redirect;
                    }, 2000 );
                }).error(function (data) {
                    UIkit.notification({"message":data.responseJSON.message});
                    hideLoader();
                    setTimeout(function(){
                        window.location.reload();
                    },2000);
                })
            }else{
                $("#phone").addClass("uk-danger");
                UIkit.notification({"message":wrongPhone});
                hideLoader();
            }
        }
    })
});
