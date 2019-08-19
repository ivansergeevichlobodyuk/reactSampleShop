jQuery(document).ready(function () {

    $("[data-link]").click(function (e) {
        e.preventDefault();
        window.location = $(this).data("link");
    })
})