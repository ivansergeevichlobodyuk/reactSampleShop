jQuery(document).ready(function () {

    $("[data-load]").click(function(e){
        e.preventDefault();
        console.log("e prevent defualt ");

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


    $("#repeat-button").click(function(e){
        $.ajax({
            url: url_create_order,
            type: "GET",
        }).success(function (data) {
            $("#loader").addClass("uk-hidden");
            UIkit.notification({"message": msg_order_created})
            setTimeout(function () {
                window.location = offline_checkout_success_page + "?order_id=" + data.order_id;
            }, 3000);
        });
    });
})
