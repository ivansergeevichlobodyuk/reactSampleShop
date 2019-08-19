/**
 * Created by ivanlobodyuk on 10.12.18.
 */


 jQuery(document).ready(function () {
    var url = $("#menu").data("url-load");
    var sortingGl;
    init();
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

    // if we put new serch filed all previous filters removed
    $("#search-field").keyup(function(e){
        console.log("searched field ",$("#search-field").val());

        if (sortingGl){
            var sortingString = "&sorting="+sortingGl;
        }else{
            var sortingString = "";
        }


        var url = window.location.pathname+"?search="+$("#search-field").val()+"&limit="+$("#limit-paginator option:selected").val()+sortingString;
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

            var newurl = url.replace("_category_",$(e.currentTarget).data('categories')) + "?limit=" +$("#limit-paginator option:selected").val( )+sortingString;

            window.history.pushState({path:newurl},'',newurl);


            $("#loader, #loader-overlay").removeClass("uk-hidden");
            $("#loaded-data").addClass("uk-hidden");

            $.ajax({
                type: 'GET',
                url: newurl
            }).success(function(data){
                $("#loaded-data").html(data);
                $("#loader, #loader-overlay").addClass("uk-hidden");
                $("#loaded-data").removeClass("uk-hidden");
                init();
                showFilters();
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



    function showFilters(){
        $("[data-filter]").each(function(ind,item){
            console.log("data filter", item);
            $(item).removeClass("uk-hidden");
        })
    }

    var dataSortingTable = [];

     /**
      * Sorts buttons on the grids
      *
      */
     function sortByColumn(){
        $("[data-column-sorting]").off();
        $(".order-table__sort--item").click(function(e){
            $(".order-table__loader").removeClass("uk-hidden");
            $("order-table__data").addClass("uk-hidden");
            //alert("loader showing start");
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
                //alert("loader showing end");
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
            UIkit.notification({"message":"Addded", pos: 'top-right', status: 'primary'});
            $("#cart-count-adaptive").find("span").html(response.countItem);
            $("#cart-count").find("span").html(response.countItem);
            $("#price").html(response.total);
            $("#price-adaptive").html(response.total);
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
        $.ajax({
            type: "GET",
            url: cartRouteUpdate
        }).success(function(data){
          $('.nav-default__loader').addClass('uk-hidden');
          var response = JSON.parse( data );
            //UIkit.notification({"message":"Addded"});
            console.log( "response ", $("#cart-count").find("span") );
            $("#cart-count-adaptive").find("span").html(response.countItem);
            $("#cart-count").find("span").html(response.countItem);
            $("#price").html(response.total);
            $("#price-adaptive").html(response.total);
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
      * Re-init after load data
      *
       */
     function init( ){
        imageDef();
        if ( isLogged ) {
            updateCart();
        }

        initCookiesforView(getViewType);
        sortByColumn();
        $("[data-product-id]").click(function(e){
            addToCartFromList(e);
        });

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
            $(this).unbind("error").attr("src", "/eshoplead/web/bundles/eshopledaagro/img/not-image.png");
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
