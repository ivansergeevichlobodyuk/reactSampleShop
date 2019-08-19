jQuery(document).ready(function () {

    $(".plus").click(function(e){
        var goodId = $(e.currentTarget).data("good");
        var count = parseFloat($("#good"+"_"+goodId).val( ));
        var qtyInPack = $(".qty-in-pack-"+ goodId).attr("data-pack");
        var countNew = count + 1;
        $.ajax({
            data: {'good_id': goodId, 'action':'add', 'count': count  },
            type: 'POST',
            url: cartChange
        }).success(function(data){
            updateCartDom(data, goodId);
            $("#good"+"_"+goodId).val( count +1 );
            $("#good_total_"+ goodId).html(qtyInPack * countNew);
           
        })
    });

    $(".minus").click(function(e){
        var goodId = $(e.currentTarget).data("good");
        var count = parseFloat($("#good"+"_"+goodId).val( ));
        var qtyInPack = $(".qty-in-pack-"+ goodId).attr("data-pack");
        var countNew = count - 1;
        if ( count != 0 ){
            $.ajax({
                data: {'good_id': goodId, 'action':'remove', 'count': $("#good"+"_"+goodId).val( )  },
                type: 'POST',
                url: cartChange
            }).success(function(data){
                console.log("data success ", data);
                updateCartDom(data,goodId);
                $("#good"+"_"+goodId).val( count - 1 );
                $("#good_total_"+ goodId).html(qtyInPack * countNew);
            })
        } 
    })
    $("[data-id-remove]").click(function(e){

        var id = $(this).data("id-remove");
        var goodName = $("#name-"+id).text();
        console.log()
         e.preventDefault();
           e.target.blur();
           UIkit.modal.confirm( confirmMessage +' - '+ goodName + '', { labels: { ok: confirmYes, cancel: confirmNo } } ).then(function () {
            $.ajax({
             data: {'good_id': id, "action":'removeAll'},
             type: "POST",
             url: cartChange
         }).success(function(data){
             console.log(" this data id remove ", id );
             $("#row-"+id).remove();
             updateCartDom(data,0);
         });
           }, function () {
               console.log('Rejected.')
           });
       
    });

    // $("input").blur(function(e){
    //     var goodId = this.id.replace("good_","");
    //     $.ajax({
    //         data: {'good_id': goodId, 'action':'update', 'count': $(e.currentTarget).val()},
    //         type: "POST",
    //         url: cartChange
    //     }).success(function(data){
    //         updateCartDom(data,goodId);
    //     })
    // })

$('.checklist__qty').click(function(){
    var getVal = $(this).val();
    var goodId = $(this).attr('id').replace("good_","");
    var goodName = $("#name-"+goodId).text()
    UIkit.modal('#cart-modal').show();
    $(".checklist__modal-title").html(goodName);
    $('.checklist__modal-qty').val(getVal);
    $('.checklist__modal-save-btn').attr('data-modal', goodId);
    $('.minus-btn').click(function(){
        var count = $('.checklist__modal-qty').val();
        var countMinus = count-1;
        if (countMinus != 0) {
            $('.checklist__modal-qty').val(countMinus--)
        }else{
            return false;
        }
    })
    $('.plus-btn').click(function(){
        var count = $('.checklist__modal-qty').val();
        var countPlus = Number(count)+1;
        $('.checklist__modal-qty').val(countPlus++)
    })
})

$('.checklist__modal-save-btn').click(function(){
    UIkit.modal('#cart-modal').hide();
    var newCount  = $('.checklist__modal-qty').val();
    var goodId = $(this).attr('data-modal');
    var setNewVal = $('#good_'+ goodId);
    var qtyInPack = $(".qty-in-pack-"+ goodId).attr("data-pack");
    $.ajax({
        data: {'good_id': goodId, 'action':'update', 'count': newCount},
        type: "POST",
        url: cartChange
    }).success(function(data){
        updateCartDom(data,goodId);
        setNewVal.val(newCount);
        $("#good_total_"+ goodId).html(qtyInPack * newCount);
    }).error(function(data){
      UIkit.notification("Sorry some error", {status:'danger'});
      setTimeout( function(){
        location.reload();
      }, 3000 );
    })
})

$("[data-load]").click(function(e){
   $.ajax({
     type: "GET",
     url: $(this).data("load")
   }).success(function(data){
       $("#loaded-modal-data").html(data);
       $(".good-img, .good-item__img, .good-item__img-small").error(function () {
           $(this).unbind("error").attr("src", "/eshoplead/web/bundles/eshopledaagro/img/not-image.png");
       });
       UIkit.modal($("#cart-modal-item")).show();
   });
});

function updateCartDom(data,goodId){
    console.log("data success ", data);
    console.log("data good id ", goodId);
    UIkit.notification.closeAll();
    if (goodId){
        $("#total_good_"+goodId).html(data.newPrice);
    }
    var total = 0;
    $("[data-total]").each(function(inx,itm){
        total+=parseFloat($(itm).html());
    });

    var totalCount = 0;
    $("input.checklist__qty").each(function(inx,itm){
        var tmp_ = parseFloat($(itm).val());
        totalCount+=parseFloat($(itm).val());
    });

    console.log("count ", totalCount);

    $("#total-cart").html(total);
    $("#price").html(total);
    $("#cart-count").find("span").html(totalCount);
    UIkit.notification({"message":messageCartUpdated, pos: 'top-right', status: 'danger'});
}
})
