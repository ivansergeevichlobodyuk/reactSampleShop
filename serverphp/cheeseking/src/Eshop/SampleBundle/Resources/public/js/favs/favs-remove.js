/**
 * Created by ivanlobodyuk on 10.12.18.
 */
jQuery(document).ready(function () {
    $("[data-remove-favs]").click(function(e){
        var id = $(this).data("remove-favs");
        var goodName = $("#name-"+id).text();
        e.preventDefault();
        e.target.blur();
        UIkit.modal.confirm( confirmMessage +' - '+ goodName + '', { labels: { ok: confirmYes, cancel: confirmNo } } ).then(function () {
            $.ajax({
                data: {'good_id': id},
                type: "POST",
                url: wishlistRemove
            }).success(function(data){
                $("#row-"+id).remove( );
                $.ajax({
                    type: "GET",
                    url: path_get_count,
                }).success(function(data){
                    console.log("data count tem" , data);
                    $("#wish-count").html(data.countItem);
                })
            });
        }, function () {
            console.log('Rejected.')
        });
    })
});