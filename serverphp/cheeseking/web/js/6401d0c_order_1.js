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
})
