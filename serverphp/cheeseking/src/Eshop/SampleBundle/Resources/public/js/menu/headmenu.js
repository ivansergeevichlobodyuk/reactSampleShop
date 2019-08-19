/**
 * Created by ivanlobodyuk on 10.12.18.
 */
jQuery(document).ready(function () {
    $(".currency").click(function(e){
        e.preventDefault();
        var redirect = $(this).data('redirect');
        $.ajax({
            type: 'POST',
            data: { 'cur_id':$(this).data('cur-id') },
            url: $(this).attr("href")
        }).success(function(data){
            console.log("data ", data);
            UIkit.notification(data.message,  {status: 'primary'});
            setTimeout( function(){
                if ( redirect ){
                    window.location = redirect;
                }
            }, 1500 );

        })
    })
    
});