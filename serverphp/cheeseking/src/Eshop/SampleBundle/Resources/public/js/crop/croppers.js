jQuery(document).ready(function () {
    var cropper = null;
    var editors = initEditor();
    initCropper();
    $("#image").change(function(e){
        readURL(this);
    });
    function readURL(input) {
        if ( cropper != null ){
            cropper.destroy();
        }
        if (input.files && input.files[0]) {
            var reader = new FileReader();
            reader.onload = function (e) {
                $('#blah').attr('src', e.target.result)
            };
            reader.readAsDataURL(input.files[0]);
            setTimeout(initCropper, 1000);
        }
    }

    function initEditor(){
        var data = [];
        if ( typeof  CKEDITOR !== "undefined"  ){
            CKEDITOR.disableAutoInline = true;
            CKFinder.setupCKEditor( CKEDITOR.instances["form_article_ru"] );
            CKFinder.setupCKEditor( CKEDITOR.instances["form_article_ua"] );
            data = [{'fieldName':"article_ru","data":CKEDITOR.instances["form_article_ru"]},{'fieldName':"article_ua","data":CKEDITOR.instances["form_article_ua"]}];
        }
        return data;
    }

    $("[data-remove]").click(function(e){
        UIkit.modal.confirm(msg_remove).then(function() {
            UIkit.modal.confirm(msg_remove2).then(function() {
                var id = $(e.currentTarget).data("remove");
                $.ajax({
                    type: "DELETE",
                    url: urlDeleteItem,
                    data: {id: $(e.currentTarget).data("remove"), "token":$("#token").val()}
                }).success(function (data) {
                    window.location = redirectAfterRemoveItem;
                })
            }), function(){
                console.log("rejected from 2");
            }
        }, function () {
            console.log('Rejected.')
        });
    })


    function initCropper(){
        console.log("Came here")
        var image = document.getElementById('blah');
        cropper = new Cropper(image, {
            //aspectRatio: 960 / 642,
            aspectRatio: 16 /9,
            autoCropArea: 1,
            crop: function(e) {
                console.log(e.detail.x);
                console.log(e.detail.y);
            }
        });
        $("#crop_button").off();
        // On crop button clicked
        document.getElementById('crop_button').addEventListener('click', function(){
            if ( $("#firstImage") != undefined ){
                $("#firstImage").remove();
            }
            var imgurl =  cropper.getCroppedCanvas().toDataURL();
            var img = document.createElement("img");
            $(img).attr("id", "firstImage");
            img.src = imgurl;
            document.getElementById("cropped_result").appendChild(img);
        })
        $("#save").off();
        $("#save").click(function(e){
            cropper.getCroppedCanvas().toBlob(function (blob) {
                var formData = new FormData();
                formData.append('croppedImage', blob);
                formData.append("id", $("#id").val());
                formData.append('token', $("#token").val())
                var datKeys = Object.keys(editors);
                for(var i = 0; i < datKeys.length; i++){
                    console.log( " editors[i].fieldName ", editors[i].fieldName,  editors[i].data.getData() );
                    formData.append(editors[i].fieldName,editors[i].data.getData())
                }
                formData.append("is_active",$("#isActive").prop("checked")?1:0);
                console.log( "formData ", $("#isActive").prop("checked")?1:0 );
                $.ajax( urlUpdate, {
                    method: "POST",
                    data: formData,
                    processData: false,
                    contentType: false,
                    success: function () {
                        location.reload();
                    },
                    error: function (data) {
                        UIkit.notification({message:data.responseJSON.message})
                    }
                });
            });
        })
    }
});