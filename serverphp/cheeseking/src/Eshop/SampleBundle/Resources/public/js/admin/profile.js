jQuery(document).ready(function () {
    function showLoader() {
        $('#loader, .loader-overlay').removeClass('uk-hidden');
    }
    function hideLoader() {
        $('#loader, .loader-overlay').addClass('uk-hidden');
    }
    $("#generate").click(function(e){
        console.log("loader start");
        showLoader();
        $.ajax({
            url: urlGenerateCode,
            data: {token: $("#token").val()},
            type: "POST"
        }).success(function(data){
            $("#update").html(data);
            hideLoader();
            console.log("loader stop");
            initSave();
        }).error(function ( data ) {
            UIkit.notification({message: data.message});
        })
    });

    initSave();
    function initSave(){
        $("#save").click(function(e){
            console.log( "loader start" );
            showLoader();
            var error = false;
            $("#form").find("input").each(function(inx,itm){
                console.log("itm ", itm, " inx ", inx);
                if ( !$(itm).val() ){
                    $(itm).addClass("uk-danger");
                }
            });
            if (!error){
                $.ajax({
                    url: urlSaveProfile,
                    type: "POST",
                    data: {
                        "name":$("#name").val(),
                        'surname':$("#surname").val(),
                        "email":$("#email").val(),
                        "address":$("#address").val(),
                        token: $("#token").val()
                    }
                }).success(function (data) {
                    hideLoader();
                    console.log("loader stop2");
                }).error(function ( data ) {
                    UIkit.notification({message: data.message});
                })
            }
        })
    }


});
