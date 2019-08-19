jQuery(document).ready(function () {
    $("#register").submit(function(e){
        e.preventDefault();
        var fields = $("#register :input[type=text], #register :input[type=password], #register :input[type=email]");
        var data = [];
        console.log( "data DATA ", data );
        // var data = {};
        fields.each(function(inx,itm){
           data[itm.name]=$(itm).val();
        });
        var data = $.extend({},data);
        console.log(data);
        $(e.currentTarget).find('ul').remove()
        $.ajax({
          type: 'POST',
          data: data,
          url: $(e.currentTarget).attr("action")
        }).success(function(data){
            window.location = $(e.currentTarget).data("redirect");
        }).fail(function(data){
            var json = JSON.parse(data.responseText);
            console.log("json json ", json);
            for ( var key in json ){
                $("#"+"user_"+key).addClass("uk-danger");
                var parent = $("#"+"user_"+key.replace(".","_")).parent( );
                $(parent).find("ul").remove();
                parent.append('<ul class="uk-list"><li class="uk-text-danger uk-text-small">'+json[key]+'</li></ul>');
            }
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
