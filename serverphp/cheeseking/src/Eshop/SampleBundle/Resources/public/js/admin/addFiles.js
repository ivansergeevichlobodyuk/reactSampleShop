jQuery(document).ready(function () {
    function hideDropzinePlaceholder() {

        if($('.ch-dz-remove-btn').length < 1 ){
            $('#dropzone').addClass('ch-dropzone');

        }else {
            $('#dropzone').removeClass('ch-dropzone');
        }
        console.log('lelelelee', $('.ch-dz-remove-btn').length)
    }
    function showLoader() {
        $('#loader, .loader-overlay').removeClass('uk-hidden');
    }
    function hideLoader() {
        $('#loader, .loader-overlay').addClass('uk-hidden');
    }
    var dropzone = $("#dropzone").dropzone({
        url: urlPath,
        paramName: "file",
        maxFilesize: 2,
        acceptedFiles: ".jpeg,.jpg,.png,.gif",
        maxFiles: 5,
        uploadMultiple: true,
        autoProcessQueue: false,
        // addRemoveLinks: true,
        previewTemplate: document
            .querySelector('#tpl')
            .innerHTML,


        init: function() {
            this.on("addedfile", function(file) {

                // Create the remove button
                var removeButton = Dropzone.createElement("<button class='simple-btn ch-dz-remove-btn uk-button'>"+msg_remove_button+"</button>");

                // Capture the Dropzone instance as closure.
                var _this = this;

                // Listen to the click event
                removeButton.addEventListener("click", function(e) {
                    // Make sure the button click doesn't submit the form:
                    e.preventDefault();
                    e.stopPropagation();
                    // Remove the file preview.
                    _this.removeFile(file);
                    hideDropzinePlaceholder();
                    // If you want to the delete the file on the server as well,
                    // you can do the AJAX request here.
                });

                // Add the button to the file preview element.
                file.previewElement.appendChild(removeButton);
                hideDropzinePlaceholder();
            });

            this.on("complete", function(file,response) {
                 var _this = this;
                _this.removeFile(file);
               //  UIkit.notification({message:msg_added});
            });

            this.on("sending",function(file, xhr, formData) {
                formData.append("token", $("#token").val());
            });

            this.on("error", function(file,response) {
                 console.log( " response ", response );
                 var _this = this;
                _this.removeFile(file);
                 UIkit.notification({"message":response});
            });

            this.on( "complete", function(file, response){
                showLoader();
                $.ajax({
                    type: 'GET',
                    url: urlUpdate
                }).success((data) =>{

                   $("#update").html(data);
                    initChangeOrdering();
                    initChangeActive();
                    initRemoveItem();
                    initDraggeble();
                    hideLoader();
                })
            })
        }
    });

    $("#add-file").click((e) => {
        e.preventDefault();
        dropzone[0].dropzone.processQueue();
    });

    initChangeOrdering();

    initDraggeble( );
    function initDraggeble( ){
        $("#draggable").sortable(
            {
                stop: function( event, ui ) {
                    //alert("done");
                    var arr = [];
                    $("#draggable tr").each(function(index, item){
                         arr.push({id:$(item).attr('id').replace('news-item-',''), ordering: index+1})
                    })
                    console.log( "array ", arr );
                    showLoader();
                    $.ajax({
                        type: "POST",
                        url: urlUpdateOrdering,
                        data: {'data':arr, token: $("#token").val()}
                    }).success(function(data){
                        $.ajax({
                            type: 'GET',
                            url: urlUpdate
                        }).success((data) =>{
                            $("#update").html(data);
                            initChangeOrdering();
                            initChangeActive();
                            initRemoveItem();
                            initDraggeble();
                            hideLoader();
                        })
                    })
                }
            }
        );
      //  $("#draggable").disableSelection();
    }

    function initChangeOrdering(){
        $("[data-action]").click(function(e){
            var action = $(e.currentTarget).data("action");
            var id = $(e.currentTarget).data("id");
            console.log("$(#ordering-id).val() ",$("#ordering-"+id).val());
            if ( action == 'plus' ){
                $("#ordering-"+id).val( parseInt($("#ordering-"+id).val( )) +1 );
            }else{
                if (parseInt($("#ordering-"+id).val( )) > 1){
                    $("#ordering-"+id).val( parseInt($("#ordering-"+id).val( )) -1 );
                }
            }

            $.ajax({
                type: "POST",
                url: urlUpdateOrdering,
                data: {"id":id,'ordering':$("#ordering-"+id).val(), token: $("#token").val()}
            }).success(function(data){
                UIkit.notification({"message": msg_updated});

            })
        });
    }

    initChangeActive();
    function initChangeActive(){
        $("[data-active-id]").change(function(e){
            var checked = this.checked;
            $.ajax({
                type: "POST",
                url: urlUpdateActive,
                data: {id:$(this).data("active-id"), active: this.checked?1:0, token: $("#token").val() }
            }).success(function(data){
                console.log("DATAAA A",$("#news-item-"+$(e.currentTarget).data("active-id")) );
                if ( !checked ){
                    $("#news-item-"+$(e.currentTarget).data("active-id")).addClass( "inactive" );
                }else{
                    $("#news-item-"+$(e.currentTarget).data("active-id")).removeClass( "inactive" );
                }
            })
        })
    }

    initRemoveItem();
    function initRemoveItem(){
        $("[data-remove]").click(function(e){


            UIkit.modal.confirm(msg_remove).then(function() {
                UIkit.modal.confirm(msg_remove2).then(function() {
                    var id = $(e.currentTarget).data("remove");
                    $.ajax({
                        type: "DELETE",
                        url: urlDeleteItem,
                        data: {id: $(e.currentTarget).data("remove"), token: $("#token").val()}
                    }).success(function (data) {
                        $("#news-item-" + id).remove();

                    })
                }), function(){
                    console.log("rejected from 2");
                }
            }, function () {
                console.log('Rejected.')
            });


        })
    }

});
