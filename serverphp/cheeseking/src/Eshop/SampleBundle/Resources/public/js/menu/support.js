jQuery(document).ready(function () {
    $("#submit-btn").click(function(e){
        alert(12222);
        e.preventDefault( );
        $.ajax({
            type: 'POST',
            data: {
                'phone':$("#callback-tel").val(),
                'description': $('#callback-commit').val(),
                'name':$("#callback-name").val()
            },
            url: supportPath
        }).success(function(data){
            UIkit.notification(supportMessageOk);
        }).fail(function(data){
            UIkit.notification(supportMessageFail);
        })
    })
});