jQuery(document).ready(function () {

    $("[data-add]").click(function(e){
        console.log(" good val ", $("#good-id").val( ));
        console.log(" count val ", $("#count").val( ));
        $('.nav-default__loader').removeClass('uk-hidden');
        $.ajax({
            data:{'good_id': $("#good-id").val( ), 'count': $("#count").val( ) },
            type: 'POST',
            url: $("[data-add]").data("add")
        }).success(function(data){
          $('.nav-default__loader').addClass('uk-hidden');
            var response = JSON.parse( data );
            UIkit.notification({"message":message_added_cart_list});
            $("#cart").html(response.countItem);

        }).fail(function(data){
          $('.nav-default__loader').addClass('uk-hidden');
            var response = JSON.parse(data.responseText);
            UIkit.notification(JSON.parse(data.responseText).error);
            setTimeout( function(){
                if ( response.redirect ){
                    window.location = response.redirect;
                }
            }, 3000 );
        })
    });

    $("#minus").click(function(e){
      if ($("#count").val() <= 0) {

      }else {
        $("#count").val(parseInt($("#count").val())-1);
      }
    });

    $("#plus").click(function(e){
        $("#count").val(parseInt($("#count").val())+1);
    });



})
