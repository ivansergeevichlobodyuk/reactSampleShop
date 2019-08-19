/**
 * Created by ivanlobodyuk on 10.12.18.
 */
jQuery(document).ready(function(){
    $("#language").change(function(e){
        $.removeCookie("languageSite");
        $.cookie("languageSite", this.value, {expires: 365, path: '/'} ) ;

        $.ajax({
            data: {"lang":this.value},
            type: 'POST',
            url: updateLang
        }).success(function(data){
            window.location.reload( );
        })

    })
});