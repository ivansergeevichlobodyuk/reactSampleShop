/**
 * Created by ivanlobodyuk on 10.12.18.
 */


 jQuery(document).ready(function () {
    var url = $("#menu").data("url-load");
    var sortingGl;
    window.viewType = 3;
    init();
    function addLoader(){

    }
    function changePath( regexp, fieldName, newValue ){
        if ( window.history.state != null ){
            if ( window.history.state.path != null ) {
                var url = window.history.state.path;
            }
        }else{
            var url = window.location.href;
            console.log("url first ",url);
            console.log("window ", window);
        }
        var concat = (url.indexOf("?")===-1)?"?":"&"

        if ( url.indexOf(fieldName) === -1 ){
            pathUrl = url + concat+fieldName+newValue;
        }else{
            console.log("regexp  ", regexp);
            console.log(" field name ", fieldName);
            console.log(" new value  ", newValue);

            var pathUrl = url.replace(regexp, fieldName+newValue);
        }
        return pathUrl;
    }
    $(window).on("popstate", function (e) {
        location.reload();
    });
    $("#limit-paginator").change(function(e){

        console.log("window history 1", window.location.pathname);
        console.log("windows history 2",window.history.state);
        console.log( "this value ", this.value );
        var regex = new RegExp('(limit=).*?(?=&|$)','gm');
        var pathUrl = changePath( regex,"limit=",this.value );
        console.log("pathURL ", pathUrl);
        window.history.replaceState({path:pathUrl},'',pathUrl);

        var regex = new RegExp('(page=).*?(?=&|$)','gm');
        var pathUrl = changePath( regex,"page=",1 );
        window.history.replaceState({path:pathUrl},'',pathUrl);
        $("#loader, #loader-overlay").removeClass("uk-hidden");
        $("#loaded-data").addClass("uk-hidden");
        $.ajax({
            type: 'GET',
            url: pathUrl
        }).success(function(data){
            $("#loaded-data").html(data);
            init();
            $("#loader, #loader-overlay").addClass("uk-hidden");
            $("#loaded-data").removeClass("uk-hidden");
        })
    });


     // here we put
     function delay(callback, ms){
         var timer = 0;
         // return function because keyup require function
         return function ()
         {
             var context = this;
             var args = arguments;
             // if we put something again clear timer (do not wait for result function below) amd start timer again
             clearTimeout(timer);
             timer = setTimeout(function(){
                 // runs function on key up ajax send format url etc...
                 callback.apply(context,args);
             }, ms || 0);
         }
     }

    // if we put new serch filed all previous filters removed
    $("#search-field").keyup(delay(function(e){
        console.log("searched field ",$("#search-field").val());
        if (sortingGl){
            var sortingString = "&sorting="+sortingGl;
        }else{
            var sortingString = "";
        }
        var url = window.location.pathname+"?search="+$("#search-field").val()+"&limit="+$("#limit-paginator option:selected").val()+sortingString+"&view_type="+window.viewType;
        console.log("window.location ", window.location);
        window.history.replaceState({path:url},'',url);
        $("#loader, #loader-overlay").removeClass("uk-hidden");
        $.ajax({
            type: 'GET',
            url: url
        }).success(function(data){
            $("#loader, #loader-overlay").addClass("uk-hidden");
            $("#loaded-data").html(data);
            init();
        }).fail(function(data){
            var response = JSON.parse(data.responseText);
            UIkit.notification(JSON.parse(data.responseText).error);
            setTimeout( function(){
                if ( response.redirect ){
                    window.location = response.redirect;
                }
            }, 3000 );
        })
    },950));

     $("[data-view]").click(function(e){
        $.removeCookie("view_type");
        var viewType = $(e.currentTarget).data('view');
        $("#view-type-wrapper li").removeClass("active");
        window.viewType = viewType;
        $.cookie("view_type",viewType, {expires: 10, path: '/catalog', domain: 'http://localhost:8083', secure: false} );

        var reg = new RegExp('(view_type=).*?(?=&|$)','gm');
        var newPath = changePath(reg,"view_type=",window.viewType);
        window.history.pushState({path:newPath},'',newPath);
         $.ajax({
             type: 'GET',
             url: newPath
         }).success(function(data){
             $("#loader, #loader-overlay").addClass("uk-hidden");
             $("#loaded-data").html(data);
             init();
         }).fail(function(data){
             var response = JSON.parse(data.responseText);
             UIkit.notification(JSON.parse(data.responseText).error);
             setTimeout( function(){
                 if ( response.redirect ){
                     window.location = response.redirect;
                 }
             }, 3000 );
         })
     });

    categoriesLoader();
    function categoriesLoader(){
        $("[data-categories]").click(function(e){
            e.preventDefault();
            $("#search-field").val("");
            $('li').removeClass("current");
            $(this).parent().addClass("current");
            if (sortingGl){
                var sortingString = "&sorting="+sortingGl;
            }else{
                var sortingString = "";
            }
            var newurl = url.replace("_category_",$(e.currentTarget).data('categories')) + "?limit=" +$("#limit-paginator option:selected").val( )+sortingString+"&view_type="+window.viewType;
            window.history.pushState({path:newurl},'',newurl);
            $("#loader, #loader-overlay").removeClass("uk-hidden");
            $("#loaded-data").addClass("uk-hidden");

            $.ajax({
                type: 'GET',
                url: newurl
            }).success(function(data){
                $('.header-navbar__main .uk-nav-sub').attr('hidden', 'true');
                $("#loaded-data").html(data);
                $("#loader, #loader-overlay").addClass("uk-hidden");
                $("#loaded-data").removeClass("uk-hidden");
                $.ajax({
                    type: 'GET',
                    url: pathSmartFilters.replace("_category_",$(e.currentTarget).data('categories'))
                }).success((dataFilters) => {
                    $("#smart-filters").html(dataFilters);
                    init();
                    showFilters();
                })
            }).fail(function(data){
                var response = JSON.parse(data.responseText);
                UIkit.notification(JSON.parse(data.responseText).error);
                setTimeout( function(){
                    if ( response.redirect ){
                        window.location = response.redirect;
                    }
                }, 3000 );
            })
        });
    }


    function addToWishList( ){
        $("[data-wish-id]").click(function(e){
            console.log("e.e.currentTarget.hasAttribute('disabled')", e.currentTarget.hasAttribute('disabled'));
            if ( !e.currentTarget.hasAttribute('disabled') ){
                $.ajax({
                    type: "POST",
                    url: path_add_wish_list,
                    data: {"product_id":  $(e.currentTarget).data("wish-id")}
                }).success(function(data){
                    UIkit.notification.closeAll();
                    UIkit.notification({"message":message_added_wish_list});
                    console.log("data" , data);
                    $("#wish-count").html(data.countItem);
                    $(e.currentTarget).attr('disabled','disabled');
                    $(e.currentTarget).addClass('added-to-wishlist');
                })
            }else{
                $.ajax({
                        data: {'good_id': $(e.currentTarget).data("wish-id")},
                        type: "POST",
                        url: wishlistRemove
                }).success(function(data){
                    $(e.currentTarget).removeAttr('disabled');
                    $(e.currentTarget).removeClass('added-to-wishlist');
                })
            }
            countWish();
        });
    }

    function countWish(){

        $.ajax({
            type: "GET",
            url: path_get_count,
        }).success(function(data){
            console.log("data count tem" , data);
            $("#wish-count").html(data.countItem);
        })
    }

     function showFiltersWraps(){
         $("#search-wrapper").removeClass("uk-hidden");
         $("#smart-filters-header").removeClass("uk-hidden");
         $("#smart-filters").removeClass("uk-hidden");
         $("#smart-filter-wrap").removeClass("uk-hidden");
         $("#ar-filters").removeClass("uk-hidden");
     }

    function showFilters(){
        $("[data-filter]").each(function(ind,item){
            $(item).removeClass("uk-hidden");
        });
        $("[data-view="+window.viewType+"]").addClass("active");
    }

    var dataSortingTable = [];

     /**
      * Sorts buttons on the gridf ntf f s
      *
      */
     function sortByColumn(){
        $("[data-column-sorting]").off();
        $(".order-table__sort--item").click(function(e){
            $(".order-table__loader").removeClass("uk-hidden");
            $("order-table__data").addClass("uk-hidden");
            //console.log("loader showing start");
            $("[data-column-sorting]").removeClass("active");
            var target = $(e.currentTarget);
            var sortId = $(this).data('column-sorting');
            console.log(dataSortingTable[sortId]);

            if (dataSortingTable[sortId] != 'desc'){
                dataSortingTable[sortId] = 'desc';
            }else{
                dataSortingTable[sortId] = 'asc';
            }

            var property = sortId + "+" + dataSortingTable[sortId];
            var reg = new RegExp('(sorting=).*?(?=&|$)','gm');
            var newPath = changePath(reg,"sorting=",property);
            window.history.pushState({path:newPath},'',newPath);
            $.ajax({
                type: 'GET',
                url: newPath,
            }).success(function(data){
                //console.log("loader showing end");
                $("#loaded-data").html(data);
                init();
            });
        });
    }

    sortingPanelInit( );

     /**
      * Sort button on filters panel
      *
       */
     function sortingPanelInit(){
         $("[data-sorting]").click(function(e){
             var target = $(e.currentTarget);
             console.log("target ", target);
             var sortingField = $(target).data("sorting");
             var sortingAsceting = '';
             console.log("I.  sorting field clicked", sortingField);
             console.log("I. sorting field global ", sortFieldGlobal );
             console.log("I. asceting global", sortingAscetingGlobal );
             //rewrite sorting filed global if clicked is not equal to global var
             if ( sortingField != window.sortFieldGlobal ){
                 window.sortFieldGlobal = sortingField;
             }
             //reverse asceting from the global var
             window.sortingAscetingGlobal = sortingAsceting = (window.sortingAscetingGlobal=='desc')?"asc":"desc";

             console.log( "II. sorting field global ", window.sortFieldGlobal );
             console.log( "II. asceting global", window.sortingAscetingGlobal );


             $("[data-sorting]").removeClass("active");
             $("#loaded-data").addClass('uk-hidden');
             target.addClass("active");

             sortingGl = sortingField + "+" + sortingAsceting;
             var reg = new RegExp('(sorting=).*?(?=&|$)','gm');
             var newPath = changePath(reg,"sorting=",sortingGl);
             window.history.pushState({path:newPath},'',newPath);
             $("#loader, #loader-overlay").removeClass("uk-hidden");

             $.ajax({
                 type: 'GET',
                 url: newPath,
             }).success(function(data){
                 $("#loader, #loader-overlay").addClass("uk-hidden");
                 $("#loaded-data").removeClass('uk-hidden');
                 console.log("loaded data container ", $("#loaded-data"));
                 $("#loaded-data").html(data);

                 if ( sortingAsceting == 'asc' ){
                     target.removeClass('desc');
                     target.addClass(sortingAsceting);
                 }else{
                     target.removeClass('asc');
                     target.addClass(sortingAsceting);
                 }
                 init();
             }).fail(function(data){
                 var response = JSON.parse(data.responseText);
                 UIkit.notification(JSON.parse(data.responseText).error);
                 setTimeout( function(){
                     if ( response.redirect ){
                         window.location = response.redirect;
                     }
                 }, 3000 );
             })
         })
     }


     /**
      *  Add to cart from the list
      *
      * @param e - event
      */
      function addToCartFromList(e){
        $('.nav-default__loader').removeClass('uk-hidden');
        $('.header-nav__basket-qty').addClass('cart-anim');
        UIkit.notification.closeAll();
        $.ajax({
            data:{'good_id': $(e.currentTarget).data("product-id")},
            type: 'POST',
            url: $("[data-add]").data("add")
        }).success(function(data){
            $('.nav-default__loader').addClass('uk-hidden');
            setTimeout( function(){
               $('.header-nav__basket-qty').removeClass('cart-anim');
           }, 1000 );

            var response = JSON.parse( data );
            UIkit.notification({"message":"Added to cart", pos: 'top-right', status: 'primary'});
            // $("#cart-count-adaptive").find("span").html(response.countItem);
            $("#cart-count").html(response.countItem);
            // $("#price").html(response.total);
            // $("#price-adaptive").html(response.total);
        }).error(function(data){
            $('.nav-default__loader').addClass('uk-hidden');
            var response = JSON.parse(data.responseText);
            if ( response.error ){
                UIkit.notification(response.error, {status: 'primary'});
                setTimeout( function(){
                    if ( response.redirect ){
                        window.location = response.redirect;
                    }
                }, 3000 );
            }
        })
    }


     /**
      * Update cart in header of the shop
      *
      */
      function updateCart( ){
        $('.nav-default__loader').removeClass('uk-hidden');
        if ( (typeof cartRouteUpdate !== 'undefined') ){
            $.ajax({
                type: "GET",
                url: cartRouteUpdate
            }).success(function(data){
                $('.nav-default__loader').addClass('uk-hidden');
                var response = JSON.parse( data );
                //UIkit.notification({"message":"Addded"});
                console.log( "response ", $("#cart-count").find("span") );
                // $("#cart-count-adaptive").find("span").html(response.countItem);
                // $("#cart-count").find("span").html(response.countItem);
                $("#cart-count").html(response.countItem);
                // $("#price-adaptive").html(response.total);
            }).error(function(data){
                $('.nav-default__loader').addClass('uk-hidden');
                var response = JSON.parse(data.responseText);
                if ( response.error ){
                    UIkit.notification(response.error, {status: 'primary'});
                    setTimeout( function(){
                        if ( response.redirect ){
                            window.location = response.redirect;
                        }
                    }, 3000 );
                }
            })
        }

    }

    submitFilters();
    clearFilters();

    function clearFilters(){
        $("#clear").click(function(e){

            $("#smart-filter-wrap input[type=checkbox]").each(function(inx,item){
                $(item).removeAttr("checked");
            });

            $("#smart-filter-wrap input[type=text]").each(function(inx,item){
               var name = $(item).attr('name');
               var filterId = item.id.replace(name+'-','');
               console.log("index ",inx, " filter ID ", filterId);
               console.log("NAME ", name);
               console.log(" min max allowed  ", $("#"+name+"-allowed-"+filterId));
               console.log(" min max allowed  value", $("#"+name+"-allowed-"+filterId).val());
               console.log("item ", $(item));
               $(item).val($("#"+name+"-allowed-"+filterId).val());
               if ( name == 'min' ){
                   $("#"+filterId).slider('values',0,$("#"+name+"-allowed-"+filterId).val());
               }else{
                   $("#"+filterId).slider('values',1,$("#"+name+"-allowed-"+filterId).val());
               }
            });

        });
    }

    function submitFilters(){
        $("#submit").off();
        $("#submit").click(function(e){
            var filters = [];
            $("input:checked").each(function(inx,itm){
                filters.push($(itm).data("value-fiter_id")+"-"+$(itm).data("value-id"));
            });

            $("[data-filter-id]").each(function(inx,itm){
                console.log( 'itm >> ', $(itm) );
                filters.push( $(itm).data('filter-id')+'-'+$(itm).attr('name')+'-'+$(itm).val( ));
            });
            console.log(" item ", filters);
            var reg = new RegExp('(filter=).*?(?=&|$)','gm');
            var newPath = changePath(reg,"filter=",filters.join("+"));
            window.history.pushState({path:newPath},'',newPath);
            $.ajax({
                type: 'GET',
                url: newPath,
            }).success(function(data){
                $("#loaded-data").html(data);
                $("#loader, #loader-overlay").addClass("uk-hidden");
                $("#loaded-data").removeClass("uk-hidden");
                console.log($("#breadcrumbs-destination"));
                init( );
            })
        });
    }



    function initFiltersRange() {
       $(".ranger").each(function (index) {
           $(this).slider({
               range: true,
               min: parseFloat($("#min-hidden-" + $(this)[0].id).val()),
               max: parseFloat($("#max-hidden-" + $(this)[0].id).val()),
               values: [$("#min-" + $(this)[0].id).val(), $("#max-" + $(this)[0].id).val()],
               slide: function (event, ui) {
                   $("#min-" + $(this)[0].id).val(ui.values[0]);
                   $("#max-" + $(this)[0].id).val(ui.values[1]);
               }
           });
       });


       $("[data-filter-id]").keyup(function(e){
           setTimeout(()=>{
                 // console.log("im here");
                 // console.log( "1 ", $(this).val() );
                 // console.log(" 2 ",$("#min-hidden-"+$(this).data("filter-id")).val());
                 // console.log( "3 ",$("#max-hidden-"+$(this).data("filter-id")).val());

                 if ( $(e.currentTarget).attr("name") == 'min' ){
                   if (
                       parseFloat($(this).val()) > parseFloat($("#min-hidden-"+$(this).data("filter-id")).val())
                       &&
                       parseFloat($(this).val()) < parseFloat($("#max-hidden-"+$(this).data("filter-id")).val())
                       ){
                       $("#"+$(this).data("filter-id")).slider('values',0,$(this).val());
               }else if( parseFloat($(this).val()) < parseFloat($("#min-hidden-"+$(this).data("filter-id")).val()) ){
                $("#min-"+$(this).data("filter-id")).val($("#min-hidden-"+$(this).data("filter-id")).val());
                UIkit.modal.alert('Значение меньше допустимого').then(function () {

                });

            }else if ( parseFloat($(this).val()) > parseFloat($("#max-hidden-"+$(this).data("filter-id")).val()) ){
               $("#min-"+$(this).data("filter-id")).val($("#min-hidden-"+$(this).data("filter-id")).val());
               UIkit.modal.alert('Значение больше допустимого').then(function () {

               });
           }
       }else{
           if (
               parseFloat($(this).val()) > parseFloat($("#min-hidden-"+$(this).data("filter-id")).val())
               &&
               parseFloat($(this).val()) < parseFloat($("#max-hidden-"+$(this).data("filter-id")).val())
               )
           {
               $("#" + $(this).data("filter-id")).slider('values', 1, $(this).val());
           }else if ( parseFloat($(this).val()) > parseFloat($("#max-hidden-"+$(this).data("filter-id")).val()) ){
            $("#max-"+$(this).data("filter-id")).val($("#max-hidden-"+$(this).data("filter-id")).val());
              UIkit.modal.alert('Значение больше допустимого').then(function () {

               });
           }else if ( parseFloat($(this).val()) < parseFloat($("#min-hidden-"+$(this).data("filter-id")).val()) ){
               $("#max-"+$(this).data("filter-id")).val($("#max-hidden-"+$(this).data("filter-id")).val());
              UIkit.modal.alert('Значение меньше допустимого').then(function () {

               });
           }
       }
   },500);


       });
   }


     getCartInfo();
     function getCartInfo(){
         $(".basket").click(function(e){

            $.ajax({
                type: 'GET',
                url: cartListRpute
            }).success(function(data){
                $("#basket-modal").html(data);
            })
         });
     }

     function copyTags(){

         console.log(" COPY SEO  ", $("#copy-seo").find("input"));
         $("#copy-seo").find("input").each(function(inx,itm){
             $('meta[name='+$(itm).attr('name')+']'). remove();
            $('head').append( '<meta name="'+$(itm).attr('name')+'" content=\''+$(itm).val()+'\'>' );
         });
     }

     /**
      *  Checks url have category
      *
      * @returns {boolean}
      */
     function checkUrlHaveCategory(){
         return window.location.href.match( /shop\/[0-9a-zA-Z]{2,}/gm ) == null ? false: true;
     }

     /**
      * Re-init after load data
      *
      */
      function init( ){
       console.log("view ", window.viewType);
       imageDef();
       initFiltersRange();
       submitFilters();
       clearFilters();
       updateCart();
       copyTags();
       addToWishList();
       countWish();
       initCookiesforView(getViewType);
       sortByColumn();

       $("[data-product-id]").click(function(e){
        addToCartFromList(e);
        });

         if (checkUrlHaveCategory() ){
             console.log("alert ");
             showFiltersWraps();
         }

        $("#breadcrumbs-destination").html($("#breadcrumbs-for-clone").html());

        $(".pagination a").off();
        $(".pagination a").click(function(e) {
            e.preventDefault();
            $("#loader, #loader-overlay").removeClass("uk-hidden");
            $("#loaded-data").addClass("uk-hidden");
            var attr = decodeURI(decodeURI($(e.currentTarget).attr("href")));
            console.log( "attribute attr", attr );
            window.history.pushState({path:attr}, '', attr);
            $.ajax({
                type: 'GET',
                url: attr,
            }).success(function(data){
                $("#loaded-data").html(data);
                $("#loader, #loader-overlay").addClass("uk-hidden");
                $("#loaded-data").removeClass("uk-hidden");
                console.log($("#breadcrumbs-destination"));
                 init();
            })
        });
    }
    function goodsAdaptive(){
        $('.goods-list').removeAttr('uk-grid');
        $('.goods-list').removeClass('uk-child-width-1-4@l uk-child-width-1-2@s uk-margin-remove goods-list-grid uk-grid');
        $('.goods-list').addClass('uk-list uk-list-divider');
        $('.goods-list li>div').removeClass();
        $('.goods-list li>div').addClass(' uk-flex uk-flex-middle uk-flex-wrap uk-child-width-1-3@s uk-child-width-1-1');
        $('.goods-list .uk-first-column').css('margin-left', '0');
        $('.goods-list li>div>a').removeClass("uk-text-center");
    }

    var getViewType = $.cookie('view_type');

    function initCookiesforView(viewId){
        if ($.cookie('view_type')) {
            $('#'+viewId).addClass('active');
            if ($.cookie('view_type') == 'cart') {
                $('.goods-list').attr('uk-grid', true);
                $('.good-img').css({
                    'display': 'block',
                    'width': '150px',
                    'height': 'auto',
                    'margin': '0 auto'
                });
                $('.goods-list').addClass('uk-child-width-1-4@l uk-child-width-1-2@s uk-margin-remove goods-list-grid');
                $('.goods-list').removeClass('uk-list uk-list-divider')
                $('.goods-list li>div').removeClass();
                $('.goods-list li>div').addClass('uk-card uk-card-default uk-card-hover uk-padding-small');
                $('.goods-list li>div>a').addClass("uk-text-center");
            }

            if($.cookie('view_type') == 'listcart'){
                $('.good-img').css('display', 'inline-block')
                $('.goods-list-grid').is(":visible")
                goodsAdaptive()
            }

        }
        $("#loaded-data").removeClass("uk-hidden");
    }

    initCookiesforView(getViewType);
    sortByColumn();


$('.main-content-view__item').click(function(){
    var viewId = $(this).attr('data-view');
    $('.main-content-view__tabs > li').removeClass('active')
    $(this).addClass('active');
    $.cookie("view_type", viewId, { path: '/' });
})
    /**
    * end sort and view active tab for cookie
    *
    */
    function imageDef(){
        $(".good-img, .good-item__img, .good-item__img-small").error(function () {
            $(this).unbind("error").attr("src", "/furnitire/web/bundles/eshopsample/img/not-image.png");
        });
    };

    $('.main-content-view__listcard').click(function(){
        $('.good-img').css('display', 'inline-block');
        imageDef();
        if($('.goods-list-grid').is(":visible")){

            $('.good-img').css({
                'display': 'inline-block',
                'width': '50px',
                'height': '50px',
                'margin': 'auto'
            });
            goodsAdaptive()
        }
    });
    $('.main-content-view__list').click(function(){
        if ($('.good-img').is(":visible")) {
         $('.good-img').css('display', 'none')
     }
     if($('.goods-list-grid').is(":visible")){
        goodsAdaptive()
    }
});
    $('.main-content-view__card').click(function(){
        imageDef()
        $('.goods-list').attr('uk-grid', true);
        $('.good-img').css({
            'display': 'block',
            'width': '150px',
            'height': 'auto',
            'margin': '0 auto'
        });
        $('.goods-list').addClass('uk-child-width-1-4@l uk-child-width-1-2@s uk-margin-remove goods-list-grid');
        $('.goods-list').removeClass('uk-list uk-list-divider')
        $('.goods-list li>div').removeClass();
        $('.goods-list li>div').addClass('uk-card uk-card-default uk-card-hover uk-padding-small');
        $('.goods-list li>div>a').addClass("uk-text-center");
        // $('.goods-card__item').addClass('uk-margin-top')
    });
    function addOffcanvas(){
        if ($(this).width() <= 640) {
            $('.menu-default').attr('uk-offcanvas', true);

        }else{
            $('.menu-default').removeAttr('uk-offcanvas')
            $('.menu-default').removeClass('uk-offcanvas')
        }
    };
    addOffcanvas()
    $(window).resize(function() {
        addOffcanvas()

    });
    $('.subnav-list-adaptive').click(function(){
        $('.adaptive-bg').addClass('adaptive-blur');
    })
    $('.menu-default__adaptive-close').click(function(){
        $('.adaptive-bg').removeClass('adaptive-blur')
    })
    $('.to-top').click(function(){
        $(this).fadeOut(200);
        $("html").scrollTop(0);
        return false;
    });
    $(window).scroll(function(){
        if  ($(window).scrollTop() > 300){
            $('.to-top').fadeIn(500);

        }
        else{
            $('.to-top').fadeOut(500);
        }
    });

})
