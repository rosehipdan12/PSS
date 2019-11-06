(function($) {
  // General Element
  var doc         = $(document),
      body        = $('body'),
      w       = window.innerWidth,
      dropdownCart    = $('#dropdown-cart');



  var selectCallbackQuickview = function(variant, selector) {

    var productItem = $('#quick-view-popup .product-item'),
        btnAddToCart = productItem.find('.add-to-cart-btn'),
        productPrice = productItem.find('.price'),
        comparePrice = productItem.find('.compare-price'),
        totalPrice = productItem.find('.total-price .total-money'),
        priceSaving = productItem.find('.price-save');

    if(!variant){
      btnAddToCart.text(window.inventory_text.unavailable).addClass('disabled').attr('disabled', 'disabled');
    } 
    else 
    {
      if(variant.available) {
        btnAddToCart.removeClass('disabled').removeAttr('disabled').text(window.inventory_text.add_to_cart);
      }
      else {
        btnAddToCart.addClass('disabled').attr('disabled', 'disabled').text(window.inventory_text.sold_out);
      };

      // -----    Price
      productPrice.html(Shopify.formatMoney(variant.price, window.shop_money_format ));

      if(variant.compare_at_price > variant.price) {
        comparePrice
        .html(Shopify.formatMoney(variant.compare_at_price, window.shop_money_format ))
        .show();
        productPrice.addClass('on-sale');

        priceSaving.html(Shopify.formatMoney(variant.compare_at_price - variant.price, window.shop_money_format));
        priceSaving.parent().show();
      }
      else {
        comparePrice.hide();
        productPrice.removeClass('on-sale');
        priceSaving.parent().hide();
      };

      // ------  Color Swatch
      if(window.use_color_swatch) {
        var form = $('#' + selector.domIdPrefix).closest('form');

        for (var i = 0, length = variant.options.length; i < length; i++) {
          var radioButton = form.find('.swatch[data-option-index="' + i + '"] :radio[value="' + variant.options[i] +'"]');

          if (radioButton.size()) {
            radioButton.get(0).checked = true;
          }
        }
      };

      // ------   variant inventory
      if(window.display_quickview_availability) {
        var inventoryInfo = productItem.find('.product-inventory span');

        if (variant.available) {
          if (variant.inventory_management != null) {
            inventoryInfo.text(window.inventory_text.in_stock);
          }
          else {
            inventoryInfo.text(window.inventory_text.many_in_stock);
          }
        }
        else {
          inventoryInfo.text(window.inventory_text.out_of_stock);
        }
      };

      // ------   variant inventory
      if(window.display_quickview_sku) {
        var sku = productItem.find('.sku-product span');

        if(variant) {
          sku.text(variant.sku);
        }
        else {
          sku.empty();
        };
      };


      // ----   price calculation
      var regex = /([0-9]+[.|,][0-9]+[.|,][0-9]+)/g;
      var unitPriceTextMatch = jQuery('.quick-view .price').text().match(regex);

      if (!unitPriceTextMatch) {
        regex = /([0-9]+[.|,][0-9]+)/g;
        unitPriceTextMatch = jQuery('.quick-view .price').text().match(regex);     
      }

      if (unitPriceTextMatch) {
        var unitPriceText = unitPriceTextMatch[0];     
        var unitPrice = unitPriceText.replace(/[.|,]/g,'');
        var quantity = parseInt(jQuery('.quick-view input[name=quantity]').val());
        var totalPrice = unitPrice * quantity;

        var totalPriceText = Shopify.formatMoney(totalPrice, window.money_format);
        regex = /([0-9]+[.|,][0-9]+[.|,][0-9]+)/g;     
        if (!totalPriceText.match(regex)) {
          regex = /([0-9]+[.|,][0-9]+)/g;
        } 
        totalPriceText = totalPriceText.match(regex)[0];

        var regInput = new RegExp(unitPriceText, "g"); 
        var totalPriceHtml = $('.quick-view .price').html().replace(regInput ,totalPriceText);

        $('.quick-view .total-price .total-money').html(totalPriceHtml);
      };

      // ------  Currency
      if(window.show_multiple_currencies) {
        Currency.convertAll(window.shop_currency, $(".currency-toggle").first().text(), 'span.money', 'money_format');
      };

      // -----    variant image
      if (variant && variant.featured_image) {

        var originalImage = $('#quick-view-popup .quickview-featured-image img');
        var newImage = variant.featured_image;
        var element = originalImage[0];


        Shopify.Image.switchImage(newImage, element, function (newImageSizedSrc, newImage, element) {


          $('#quick-view-popup .slider-nav img').each(function() {

            var grandSize = $(this).attr('src');

            grandSize = grandSize.replace('70x70','1024x1024');

            if (grandSize == newImageSizedSrc) {
              $(this).parent().trigger('click'); 
              return false;
            };
          });
        });        
      };
    };
  }//selectCallbackQuickview




  // Color swatch

  if (window.use_color_swatch) {

    var changeSwatch = function(swatch) {

      swatch.change(function() {
        var optionIndex = $(this).closest('.swatch').attr('data-option-index');
        var optionValue = $(this).val();

        $(this)
        .closest('form')
        .find('.single-option-selector')
        .eq(optionIndex)
        .val(optionValue)
        .trigger('change');
      });
    };

    changeSwatch($('.swatch :radio'));

    Shopify.productOptionsMap = {};
    Shopify.quickViewOptionsMap = {};

    Shopify.updateOptionsInSelector = function(selectorIndex, wrapperSlt) {

      Shopify.optionsMap = wrapperSlt === '.product' ? Shopify.productOptionsMap : Shopify.quickViewOptionsMap;

      switch (selectorIndex) {
        case 0:
          var key = 'root';
          var selector = $(wrapperSlt + '.single-option-selector:eq(0)');
          break;
        case 1:
          var key = $(wrapperSlt + ' .single-option-selector:eq(0)').val();
          var selector = $(wrapperSlt + ' .single-option-selector:eq(1)');
          break;
        case 2:
          var key = $(wrapperSlt + ' .single-option-selector:eq(0)').val();
          key += ' / ' + $(wrapperSlt + ' .single-option-selector:eq(1)').val();
          var selector = $(wrapperSlt + ' .single-option-selector:eq(2)');
      }

      var initialValue = selector.val();

      selector.empty();

      var availableOptions = Shopify.optionsMap[key];

      if (availableOptions && availableOptions.length) {
        for (var i = 0; i < availableOptions.length; i++) {
          var option = availableOptions[i];

          var newOption = $('<option></option>').val(option).html(option);

          selector.append(newOption);
        }

        $(wrapperSlt + ' .swatch[data-option-index="' + selectorIndex + '"] .swatch-element').each(function() {
          if ($.inArray($(this).attr('data-value'), availableOptions) !== -1) {
            $(this).removeClass('soldout').find(':radio').removeAttr('disabled', 'disabled').removeAttr('checked');
          }
          else {
            $(this).addClass('soldout').find(':radio').removeAttr('checked').attr('disabled', 'disabled');
          }
        });

        if ($.inArray(initialValue, availableOptions) !== -1) {
          selector.val(initialValue);
        }

        //         selector.trigger('change');
      };
    };

    Shopify.linkOptionSelectors = function(product, wrapperSlt) {
      // Building our mapping object.
      Shopify.optionsMap = wrapperSlt === '.product' ? Shopify.productOptionsMap : Shopify.quickViewOptionsMap;

      for (var i = 0; i < product.variants.length; i++) {
        var variant = product.variants[i];

        if (variant.available) {
          // Gathering values for the 1st drop-down.
          Shopify.optionsMap['root'] = Shopify.optionsMap['root'] || [];

          Shopify.optionsMap['root'].push(variant.option1);
          Shopify.optionsMap['root'] = Shopify.uniq(Shopify.optionsMap['root']);

          // Gathering values for the 2nd drop-down.
          if (product.options.length > 1) {
            var key = variant.option1;
            Shopify.optionsMap[key] = Shopify.optionsMap[key] || [];
            Shopify.optionsMap[key].push(variant.option2);
            Shopify.optionsMap[key] = Shopify.uniq(Shopify.optionsMap[key]);
          }

          // Gathering values for the 3rd drop-down.
          if (product.options.length === 3) {
            var key = variant.option1 + ' / ' + variant.option2;
            Shopify.optionsMap[key] = Shopify.optionsMap[key] || [];
            Shopify.optionsMap[key].push(variant.option3);
            Shopify.optionsMap[key] = Shopify.uniq(Shopify.optionsMap[key]);
          }
        }
      };

      // Update options right away.
      Shopify.updateOptionsInSelector(0, wrapperSlt);

      if (product.options.length > 1) Shopify.updateOptionsInSelector(1, wrapperSlt);
      if (product.options.length === 3) Shopify.updateOptionsInSelector(2, wrapperSlt);

      // When there is an update in the first dropdown.
      $(wrapperSlt + " .single-option-selector:eq(0)").change(function() {
        Shopify.updateOptionsInSelector(1, wrapperSlt);
        if (product.options.length === 3) Shopify.updateOptionsInSelector(2, wrapperSlt);
        return true;
      });

      // When there is an update in the second dropdown.
      $(wrapperSlt + " .single-option-selector:eq(1)").change(function() {
        if (product.options.length === 3) Shopify.updateOptionsInSelector(2, wrapperSlt);
        return true;
      });

    };
  };



  $(document).ready(function() {

    pet.init();

    doc.ajaxStart(function() {
      pet.isAjaxLoading = true;
    });

    doc.ajaxStop(function() {
      pet.isAjaxLoading = false;
    });
  });


  var pet = {

    petTimeout: null,
    isSidebarAjaxClick: false,
    init: function(){
      //header function
      this.initScrollTop();
      if(window.multi_lang){
        this.langSwitch();
      }
      if(window.show_multiple_currencies){
        this.currencySwitch();
      }
      if($('#dropdown-cart').length > 0){
        this.initDropdownCart();
      }
      if($('#customer_login_link').length > 0){
        this.initDropdownCustomer();
      }
      this.closeDropdownClickOut();
      if(window.ajax_cart){
        this.initAddToCart();
      }
      if(window.newsletterPopup){
        this.newsletterPopup();
      }

      if($('#accept-cookies').length > 0){
        this.acceptCookiePopup();
      }
      if($('.mega-feature-product-slider .product-item').length > 1){
      	this.megaFeaturedProductSlider();
      }
      if( w < 768){
        this.footerCollapse();
      }
      if( w < 1025){
        this.headerMobile();
      }
      if(w > 1024 && window.fixtop_menu){
        this.fixedTopMenu();
      }

      if($('.template-index').length > 0){
        if($('.home-slideshow').length > 0){
          this.homeSlideshow();
        }
        if($('.widget-trending-product').length > 0){
          this.productTab();
        }

        if($('.homepage-brand-slider').length > 0){
          this.brandSlider();
        }

        if($('.widget-countdown-product').length > 0){
          this.countdown();
        }

        if($('.homepage-testimonial').length > 0){
          this.testimonial();
        }

        if($('.hompage-category').length > 0){
          this.homepageCategory();
        }
      }

      if($('.item-swatch').length > 0){
        this.itemSwatch();
      }

      if($('.template-collection').length || $('.template-product').length || $('.template-blog').length || $('.template-article').length) {
        this.initProductSidebarSlider();
        this.dropDownSubCategory();
        this.sidebarInitToggle();
        this.wrapVideo();
      };

      if($('.template-collection').length) {
        this.initSidebar();
        this.initToolbar();
        this.collectionMapPaging();
        this.initInfiniteScrolling();
        this.initAddToCart();
      };

      if($('.template-product').length) {
        this.sidebarInitToggle();
        this.initProductImageGallery($('.pro-page'));
        this.productZoom();
        this.initProductAddToCart();
        this.initAddToCart();
        this.initQuickView();
        if(window.enable_sticky_add_to_cart){
          this.initStickyAddtoCart();
        }

        if($('.qty-group').length > 0){
          this.qtyChanger($('#shopify-section-product-template'));
        }
        if(window.related_product){
          this.initRelatedProductSlider();
        }
      }

      if($('.template-cart').length) {
        if($('.qty-group').length > 0){
          this.qtyChanger($('.cart-list'));
        }
        if($('.widget-also-like-product').length > 0){
          this.initCartProductSlider();
        }
      };
      if($('.brands-page').length > 0){
        this.pageBrand();
        this.pageBrandCarousel();
      }
      if($('.lookbook_page').length > 0){
        this.addEventLookbookModal();
        this.lookbookSlideshow();
      }
      if($('.wishlist-content').length > 0){
      	this.initWishListPage();
      }
      if( $('.addwishlist').length ){
        this.initWishList();
      }
      
      
      if($('.quickview-button').length){
        this.initQuickView();
      }
      if($('.template-list-collections .widget-featured-product').length > 0){
        this.initFeatureProduct();
      }
      if($('.search-page').length > 0){
        this.initInfiniteScrolling();
      }
    },//init

    headerDesktop : function(){
      body.css('padding-top', 0).removeClass('show-mm show-mu show-dc open-sb');
      $('.wrapper-navigation .quicklink-menu .top-link').appendTo('.header-top .top-link-area .col-right');
      $('.header-promotion ').insertBefore('.site-header .header-bottom .dt-search');
      $('.header-mb').removeClass('fixed');
    },//headerDesktop
    initScrollTop : function(){
      $(window).scroll(function() {
        if ($(this).scrollTop() > 220) {
          $('#back-top').fadeIn(400);
        }

        else {
          $('#back-top').fadeOut(400);
        }
      });

      $('#back-top').off('click.scrollTop').on('click.scrollTop', function(e) {
        e.preventDefault();
        e.stopPropagation();

        $('html, body').animate({scrollTop: 0}, 400);
        return false;
      });
    },//initScrollTop

    Toggle : function(target){
      target.off('click').on('click', function(){
        $(this).next().toggle();
      })
    },
    CloseDropdownItSelf : function(drop){
      drop.off('click').on('click',function(){
        $(this).hide();
      })
    },

    closeDropdownClickOut : function(){
      var langContainer = $('.header-top .lang-block '),
          currencyContainer = $('.currency '),
          dropdownCartContainer = dropdownCart.parent(),
          filterSortby = $('.filter-sortby'),
          dropdownSortBy = filterSortby.find('.dropdown-menu'),
          searchMobile = $('.header-bottom .dt-search'),
          searchIcon = $('#mobile-search-toggle'),
          lookbookProduct = $('.ajax-lookbook-modal'),
          lookbookIcon = $('.lookbook-item'),
          toggleCustomer = $('#customer_login_link .dropdown-customer'),
          toggleCustomerContainer = $('#customer_login_link'),
          langDrop      = $('.lang-dropdown'),
          currencyDrop    = $('.currency-dropdown'),
          headerLangDrop = $('.header-top .lang-dropdown ');


      doc.off('click.closeDropdown touchstart.closeDropdown').on('click.closeDropdown touchstart.closeDropdown', function(e) {
        if(langDrop.is(':visible') && !langContainer.is(e.target) && langContainer.has(e.target).length === 0){
          headerLangDrop.hide();
        }
        if(currencyDrop.is(':visible') && !currencyContainer.is(e.target) && currencyContainer.has(e.target).length === 0){
          currencyDrop.hide();
        }
        if(dropdownCart.is(':visible') && !dropdownCartContainer.is(e.target) && dropdownCartContainer.has(e.target).length === 0){
          dropdownCart.hide();
        }
        if(dropdownSortBy.is(':visible') && !filterSortby.is(e.target) && filterSortby.has(e.target).length === 0){
          dropdownSortBy.hide();
        }
        if(searchMobile.is(':visible') && !searchIcon.is(e.target) && searchIcon.has(e.target).length === 0){
          searchMobile.removeClass('show');
          searchIcon.removeClass('close')
        }

        if(lookbookProduct.is(':visible') && !lookbookIcon.is(e.target) && !lookbookProduct.is(e.target) && lookbookIcon.has(e.target).length === 0 && lookbookProduct.has(e.target).length === 0){
          lookbookProduct.fadeOut(500);
        }


        if(toggleCustomer.is(':visible') && !toggleCustomerContainer.is(e.target) && !toggleCustomer.is(e.target) && toggleCustomerContainer.has(e.target).length === 0 && toggleCustomer.has(e.target).length === 0){
          toggleCustomer.hide();
        }
      });
    },

    translateBlock : function(blockSelector) {
      if (window.multi_lang && translator.isLang2()) {
        translator.doTranslate(blockSelector);
      }
    },//translateBlock

    showModal : function(selector) {
      $(selector).fadeIn(500);

      pet.petTimeout = setTimeout(function() {
        $(selector).fadeOut(500);
      }, 5000);
    },//showModal

    closeModal : function() {
      $('.close-modal, .overlay').click(function(e) {
        e.preventDefault();
        e.stopPropagation();

        clearTimeout(pet.petTimeout);

        $('.ajax-success-modal, .modal').fadeOut(500);
      });
    },//closeModal
    convertToSlug : function(text) {
      return text
      .toLowerCase()
      .replace(/[^a-z0-9 -]/g, '') // remove invalid chars
      .replace(/\s+/g, '-')
      .replace(/-+/g, '-');
    },//convertToSlug


    showLoading : function() {
      $('.loading-modal').show();
    },//showLoading

    hideLoading : function() {
      $('.loading-modal').hide();
    },//hideLoading

    langSwitch : function(){

      var currentLang = $.cookie("language") != null ? $.cookie("language") : 1,
          langDrop      = $('.lang-dropdown'),
          currentLangText = langDrop.find('li[data-lang=' + currentLang + ']').first().text(),
          langToggle    = $('.lang-toggle'),
          headerLangDrop = $('.header-top .lang-dropdown ');
      //  console.log(currentLang);
      //function  
      //Change lang toggle to cookie language when pageload
      doc.ready(function(){
        langToggle.text(currentLangText);
        langToggle.attr('data-lang',currentLang);
        langDrop.find('li[data-lang=' + currentLang + ']').addClass('selected');
      });

      //toggle 
      pet.Toggle(langToggle);
      //hide after select
      pet.CloseDropdownItSelf(headerLangDrop);

      //select lang item then change language
      langDrop.find('li.item').on('click',function(){
        var langIndex = $(this).data('lang');
        if($(this).hasClass('selected')){
          return false;
        }else{
          $(this).addClass('selected');
          jQuery.cookie('language', langIndex , {expires:10, path:'/'});
          location.reload();
        }
      });
    },
    currencySwitch : function(){
      var currencyToggle  = $('.currency-toggle'),
          currencyDrop    = $('.currency-dropdown');
      //toggle 
      pet.Toggle(currencyToggle);
      //select lang item
      pet.CloseDropdownItSelf(currencyDrop);
    },//currencySwitch

    initDropdownCustomer : function(){
      var target = $('#customer_login_link > a');
      pet.Toggle(target);
    },//initDropdownCustomer

    initDropdownCart : function() {
      var cartToggle = $('.top-cart');
      if(window.dropdowncart_type == 'click') {
        pet.Toggle(cartToggle);
      }
      else {
        if(!('ontouchstart' in document)) {
          cartToggle.parent().hover(function() {
            dropdownCart.toggle();                                      
          });

        }
        //for Mobile
        else {
          pet.Toggle(cartToggle);
        };
      };

      pet.checkItemsInDropdownCart();
      pet.removeItemDropdownCart();
    },//initDropdownCart


    checkItemsInDropdownCart : function() {
      var cartNoItems     = dropdownCart.find('.no-items'),
          cartHasItems    = dropdownCart.find('.has-items'),
          miniProductList   = dropdownCart.find('.mini-products-list');
      if(miniProductList.children().length) {
        cartHasItems.show();
        cartNoItems.hide();
      }
      else {
        cartHasItems.hide();
        cartNoItems.show();
      }
    },//checkItemsInDropdownCart
    removeItemDropdownCart :  function(cart) {
      var btnRemove = dropdownCart.find('.btn-remove');

      btnRemove.off('click.removeCartItem').on('click.removeCartItem', function(e) {
        e.preventDefault();
        e.stopPropagation();

        var productId = $(this).parents('.item').attr('id');
        productId = productId.match(/\d+/g);

        Shopify.removeItem(productId, function(cart) {
          pet.doUpdateDropdownCart(cart);
        });
      });
    },//removeItemDropdownCart

    updateDropdownCart : function() {
      Shopify.getCart(function(cart) {
        pet.doUpdateDropdownCart(cart);
      });
    },//updateDropdownCart

    doUpdateDropdownCart : function(cart) {
      var miniProductList   = dropdownCart.find('.mini-products-list');
      var template = '<li class="item" id="cart-item-{ID}">';
      template += '<a href="{URL}" title="{TITLE}" class="product-image">';
      template += '<img src="{IMAGE}" alt="{TITLE}"></a>';
      template += '<div class="product-details">';
      template += '<a href="javascript:void(0)" title="Remove This Item" class="btn-remove">';
      template += '<svg viewBox="0 0 24 24" class="icon-close" width="100%" height="100%"><path d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg></a>';
      template += '<p class="product-name"><a href="{URL}">{TITLE}</a></p>';
      template += '<div class="option"><span>{VARIANT_TITLE}</span></div>';
      template += '<div class="cart-collateral"><span class="qtt">{QUANTITY} x </span><span class="price">{PRICE}</span></div>';
      template += '</div>';
      template += '</li>';

      $('.cartCount').text(cart.item_count);

      dropdownCart.find('.summary .price').html(Shopify.formatMoney(cart.total_price, window.money_format));

      //Update total price at header-cart
      $('.header-cart .cart-text .price').html(Shopify.formatMoney(cart.total_price, window.money_format));

      miniProductList.html('');

      if (cart.item_count > 0) {
        for (var i = 0; i < cart.items.length; i++) {
          var item = template;

          item = item.replace(/\{ID\}/g, cart.items[i].id);
          item = item.replace(/\{URL\}/g, cart.items[i].url);
          item = item.replace(/\{TITLE\}/g, translateText(cart.items[i].product_title));
          if(cart.items[i].variant_title == null){
            item = item.replace(/\{VARIANT_TITLE\}/g, '');
          }else{
            item = item.replace(/\{VARIANT_TITLE\}/g, cart.items[i].variant_title);
          }
          item = item.replace(/\{QUANTITY\}/g, cart.items[i].quantity);
          item = item.replace(/\{IMAGE\}/g, Shopify.resizeImage(cart.items[i].image, '70x'));
          item = item.replace(/\{PRICE\}/g, Shopify.formatMoney(cart.items[i].price, window.money_format));

          miniProductList.append(item);
        }

        pet.removeItemDropdownCart(cart);

        if (pet.checkNeedToConvertCurrency()) {
          Currency.convertAll(window.shop_currency, $('.currency-toggle').first().text(), '#dropdown-cart span.money', 'money_format');
        }
      }

      pet.checkItemsInDropdownCart();
    },//doUpdateDropdownCart

    countdown : function(){
      var widget = $('.widget-countdown-product');
      var timer = $('.countdown .counter');

      widget.each(function(){
        pet.carousel($(this));
      })

      timer.each(function(){

        var $this = $(this), finalDate = $(this).data('countdown');
        var endText = $(this).data('end');
        $this.countdown(finalDate, function(event) {
          $this.html(event.strftime('%Dd, %Hh : %Mm : %Ss'));
        }).on('finish.countdown', function(){
          $this.html(endText);
        });

      });//end each
    },
    newsletterPopup : function(){

      var $modalParent        = $('div.newsletterwrapper'),
          delayTime 			= $modalParent.data('delay'),
          emailModal          = $modalParent.find('#email-modal'),
          modalPageURL        = window.location.pathname; 



      if(jQuery.cookie('emailSubcribeModal') != 'closed') {
        setTimeout(pet.openEmailModalWindow, delayTime);

        $('#email-modal .close-window, #email-modal .modal-overlay').click(function(e) {
          e.preventDefault();
          pet.closeEmailModalWindow();
        });

        $('body').keydown(function(e) {
          if( e.which == 27) {
            pet.closeEmailModalWindow();
            jQuery('body').unbind('keydown');
          }
        });

        emailModal.find('#mc_embed_signup form').submit(function() {
          if ($('#mc_embed_signup .email').val() != '') {
            pet.closeEmailModalWindow();
          }
        });

      };
    },//newsletterPopup

    closeEmailModalWindow : function() {
      $('#email-modal .modal-window').fadeOut(600, function() {
        $('#email-modal .modal-overlay').fadeOut(600, function() {
          $('#email-modal').hide();
          if ($('#email-modal').find('input[name="dismiss"]').prop('checked'))
            jQuery.cookie('emailSubcribeModal', 'closed', {expires:1, path:'/'});
        });
      })
    },//closeEmailModalWindow

    openEmailModalWindow : function() {
      $('#email-modal').fadeIn(600, function() {
        $('#email-modal .modal-window').fadeIn(600);
      });
    },//openEmailModalWindow
    acceptCookiePopup : function(){
      if ($.cookie('cookieMessage') != 'closed') {
        $('#accept-cookies').fadeIn();
      }


      $('#accept-cookies .btn').bind('click',function(){
        $('#accept-cookies').fadeOut();
        $.cookie('cookieMessage', 'closed', {expires:1, path:'/'});
      });

      $('#accept-cookies .close').bind('click',function(){
        $('#accept-cookies').fadeOut();
      });
    },//acceptCookiePopup

    footerCollapse : function(){
      var  footerTitle = $('.col-footer .foot-title');

      footerTitle.off('click.footerCollapse').on('click.footerCollapse', function(e){
        e.stopPropagation();
        $(this).toggleClass('active');
        $(this).next().slideToggle();
      })

    },//footerCollapse
    megaFeaturedProductSlider: function(){
      $('.mega-feature-product-slider:not(.slick-initialized)').slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        dots:false,
        nextArrow: '<button type="button" class="slick-next"><i class="fa fa-angle-right"></i></button>',
        prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-angle-left"></i></button>'
      })
    },
    headerMobile : function(){
      $('.site-header .header-mb').addClass('fixed');
      body.css('padding-top',$('.site-header .header-mb').outerHeight());
      $('.header-promotion').appendTo($('#dropdown-customer'));
      pet.openMenu();
      pet.showChidMenu();
      pet.backChidMenu();
      pet.searchToggle();
      pet.openUser();
      pet.openDropdownCart();
      //       pet.homepageCatMenuToggle();

      body.off('click.closeMenu', '.wrapper-overlay , .close-mm' ).on('click.closeMenu', '.wrapper-overlay, .close-mm' , function(e) {
        e.preventDefault();
        e.stopPropagation();
        pet.closeMenu();
      });

    },//headerMobile

    openMenu : function(){
      var menuToggle = $('#showLeftPush');
      var menuToggleSlt = '#showLeftPush';
      var searchMobile = $('.header-bottom .dt-search'),
          searchIcon = $('#mobile-search-toggle'),
          menuMobile = $('.wrapper-navigation');
      body.off('click.openMenu', menuToggleSlt).on('click.openMenu', menuToggleSlt, function(e) {
        e.preventDefault();
        e.stopPropagation();
        body.removeClass('show-mu show-dc').toggleClass('show-mm');
        searchMobile.removeClass('show');
        searchIcon.removeClass('close');
        if(!$('.wrapper-navigation .top-link-area').length > 0){
          $('.header-top .top-link').appendTo('.wrapper-navigation .quicklink-menu');
        }
        menuMobile.find('lang-list').off('click touchstart');
        
      });
    },//openMenu

    closeMenu : function(){
      body.removeClass('show-mm show-mu show-dc open-sb');
    },//closeMenu


    showChidMenu : function(){
      var childMenu = $('.site-nav .dropdown-mm'),
          iconDropdown = childMenu.find('.icon-dropdown');

      childMenu.off('click.childMenu').on('click.childMenu' , function(e) {
        e.stopPropagation();
        $(this).children('.site-nav-dropdown').addClass('open');

      });

      childMenu.find('a').off('click.childMenu').on('click.childMenu' , function(e) {
        e.stopPropagation();

      });

      iconDropdown.off('click.childMenu').on('click.childMenu' , function(e) {
        e.stopPropagation();
        e.preventDefault();
        $(this).parents('.dropdown-mm').children('.site-nav-dropdown').addClass('open');

      });
    },//showChidMenu

    backChidMenu : function(){
      var backChidMenu = $('.site-nav .submenu-title');

      backChidMenu.off('click.backChidMenu').on('click.backChidMenu' , function(e) {
        e.stopPropagation();
        $(this).parent('.site-nav-dropdown').removeClass('open');

      });
    },//backChidMenu

    searchToggle : function(){
      var searchToggle = $('#mobile-search-toggle');

      searchToggle.off('click.searchToggle').on('click.searchToggle', function(){
        $('.search-pop').fadeToggle();
        $(this).toggleClass('show');
      });

      body.off('click.closeSearchMobile','.icon-close').on('click.closeSearchMobile','.icon-close', function(){
        $('.search-pop').fadeOut();
      })
    },


    openUser : function(){
      var iconUser = $('#icon-user-mb');


      iconUser.off('click.openUser').on('click.openUser', function(){
        body.removeClass('show-mm show-dc').toggleClass('show-mu');
      })
    },
    openDropdownCart : function(){
      var iconCart = $('#cartToggle-mb');

      iconCart.off('click.openDropdownCart').on('click.openDropdownCartopenUser', function(){
        body.removeClass('show-mm show-mu').toggleClass('show-dc');
      })
    },//openDropdownCart

    homepageCatMenuToggle : function(){
      var catMenuToggle = $('.homepage-cat-toggle');
      catMenuToggle.off('click.homepageCatMenuToggle').on('click.homepageCatMenuToggle',function(){
        $(this).next().slideToggle();
      });
    },//homepageCatMenuToggle

    fixedTopMenu : function(){
      var menu = $('.wrapper-navigation'),
          menuHeight = menu.outerHeight(),
          menuPos = menu.offset().top,
          searchPop = $('.search-pop');


      $(window).on('scroll.fixedTopMenu',function(){
        var sroll = $(this).scrollTop();

        if(sroll > menuPos){
          menu.addClass('fixed-top');
          body.addClass('fixed-menu');
          $('.main-content').css('padding-top',menuHeight);
        }else{
          menu.removeClass('fixed-top');
          body.removeClass('fixed-menu');
          $('.main-content').css('padding-top',0);
        }
      })


      $('#search-fix').off('click.showSearchPop').on('click.showSearchPop', function(){
        searchPop.fadeIn(300);
      })

      $('#close-search-pop').off('click.showSearchPop').on('click.showSearchPop', function(){
        searchPop.fadeOut(300);
      });
    },//fixedTopMenu

    slideshow : function(selector){
      var fade = selector.data('fade'),
          auto = selector.data('auto'),
          speed = selector.data('speed');

      selector.each(function(){
        $(this).find('.slideshow').slick({
          dots: true,
          slidesToScroll: 1,
          verticalSwiping: false,
          fade: fade,
          cssEase: "ease",
          speed: 500,
          autoplay: auto,
          autoplaySpeed: speed,
          adaptiveHeight: true,
          nextArrow: '<button type="button" class="slick-next"><i class="fa fa-angle-right"></i></button>',
          prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-angle-left"></i></button>'
        })
      })

    },//slideshow

    homeSlideshow : function(){
      pet.slideshow($('.home-slideshow'));
      if(w > 991){
        $(window).load(function(){
          pet.resizeMenuCate();
        })
      }

      $('.home-slideshow').each(function(){
        var styleMb = $(this).data('stylemb');
        if(styleMb == "slider"){
          pet.catMenuSlider($(this));
        }
      })

      if(window.auto_playvideo){

        if($('.slide_video').length || $('.slide_mp4').length  ) {

          function onYouTubeIframeAPIReady(){
            $('.home-slideshow .slide_video').each(function() {
              var iframe = $(this).find('iframe').attr("id");
              var videoId = $(this).find('iframe').attr("data-video-id");
              player = new YT.Player(iframe, {
                videoId: videoId,
                events: {
                  'onStateChange':onPlayerStateChange
                }
              });
            });
          }

          var tag = document.createElement('script');
          tag.src = "https://www.youtube.com/iframe_api";
          var firstScriptTag = document.getElementsByTagName('script')[0];
          firstScriptTag.parentNode.insertBefore(tag, firstScriptTag);

          $('.slideshow').on('reInit', function() {
            $('.slideshow').on('afterChange', function(event, slick, currentSlide){
              var yt = $(this).find('.slide_video');
              if(yt.length > 0){
                if (yt.hasClass('slick-active')) {

                  yt.find('.youtube-player')[0].contentWindow.postMessage('{"event":"command","func":"' + 'playVideo' + '","args":""}', '*');
                  $(this).slick('slickPause');

                } else {

                  yt.find('.youtube-player')[0].contentWindow.postMessage('{"event":"command","func":"pauseVideo","args":""}', '*');
                  $(this).slick('slickPlay');

                }
              }

              if ($(this).find('.slide_mp4.slick-active').length > 0) {
                $(this).find(".slide_mp4.slick-active .video").get(0).play();
                $(this).slick('slickPause');
              } else if (!$(this).find('.slick-active').hasClass('.slide_mp4')) {
                //             $(this).find(".slide_mp4 .video").get(0).pause();
              }

            });
          });

          $('.slideshow').on('afterChange', function(event, slick, currentSlide){
            var yt = $(this).find('.slide_video');
            if(yt.length > 0){
              if (yt.hasClass('slick-active')) {

                yt.find('.youtube-player')[0].contentWindow.postMessage('{"event":"command","func":"' + 'playVideo' + '","args":""}', '*');
                $(this).slick('slickPause');

              } else {

                yt.find('.youtube-player')[0].contentWindow.postMessage('{"event":"command","func":"pauseVideo","args":""}', '*');
                $(this).slick('slickPlay');

              }
            }

            if ($(this).find('.slide_mp4.slick-active').length > 0) {
              $(this).find(".slide_mp4.slick-active .video").get(0).play();
              $(this).slick('slickPause');
            } else if (!$(this).find('.slick-active').hasClass('.slide_mp4')) {
              //             $(this).find(".slide_mp4 .video").get(0).pause();
            }

          });
        }

        function onPlayerStateChange(event) {

          if(event.data === 0) {  
            $('.slideshow').slick('slickPlay');

          }else{
            player.playVideo();
            $('.slideshow').slick('slickPause');
          } 
        }

        function myFunction() {
          $('.slideshow').slick('slickPlay');
        }

      }
    },
    catMenuSlider: function(selector){
      var slider = selector.find('.menu-slider-container');
      slider.slick({
        slidesToShow: 2,
        slidesToScroll: 1,
        mobileFirst:true,
        loop:false,
        dots: true,
        arrows: false,
        responsive: [
         
          {
            breakpoint: 767,
            settings: {
              slidesToShow: 3
            }
          },
          {
            breakpoint: 991,
            settings: "unslick"
          }
        ]
      })
    },//catMenuSlider
    brandSlider : function(){
      var brandSliderSec = $('.homepage-brand-slider');

      if(brandSliderSec.length > 0){
        brandSliderSec.each(function(){

          var brandSlider = $(this).find('.hl-carousel');
          var items = brandSlider.data('items');
          var loop = brandSlider.data('loop');

          if(items == 4){
            var arg = {
              slidesToShow: items,
              slidesToScroll: 1,
              infinite:loop,
              variableWidth: true,
              prevArrow: '<button class="slick-prev"><i class="fa fa-angle-left"></i></button>',
              nextArrow: '<button class="slick-next"><i class="fa fa-angle-right"></i></button>',
              responsive:[
                {
                  breakpoint: 1025,
                  settings: {
                    slidesToShow: 3,
                    slidesToScroll: 1,
                    variableWidth: false,
                  }
                },
                {
                  breakpoint: 992,
                  settings: {
                    slidesToShow: 2,
                    slidesToScroll: 1,
                    variableWidth: false,
                  }
                }
              ]
            }
            }else{
              var arg = {
                slidesToShow: items,
                slidesToScroll: 1,
                infinite:loop,
                prevArrow: '<button class="slick-prev"><i class="fa fa-angle-left"></i></button>',
                nextArrow: '<button class="slick-next"><i class="fa fa-angle-right"></i></button>',
                responsive:[
                  {
                    breakpoint: 1025,
                    settings: {
                      slidesToShow: 4
                    }
                  },
                  {
                    breakpoint: 992,
                    settings: {
                      slidesToShow: 3
                    }
                  },
                  {
                    breakpoint: 768,
                    settings: {
                      slidesToShow: 2
                    }
                  },
                  {
                    breakpoint: 480,
                    settings: {
                      slidesToShow: 1
                    }
                  }
                ]
              }
              }

          $('.slide_brand').slick(arg);
        });
      }
    },//brandSlider

    productTab : function(){
      var productTab = $('.widget-trending-product');
      if(productTab.length > 0){
        productTab.each(function(){
          var tabContent = $(this).find('.tab-pane');

          pet.carousel(tabContent.first());
        });

        var collectionNav = productTab.find('.nav-tabs .nav-link');
        collectionNav.off('click').on('click', function(){

          var $this = $(this),
              thisTab = $this.attr('href'),
              productContainer = $(thisTab).find('.products-grid '),
              itemLoad = $this.data('item-load'),
              ajaxUrl = $this.data('ajax'),
              loading = $(thisTab).find('.loading') ;
          if(!$(this).hasClass('loaded')){
            $.ajax({
              type: 'GET',
              url:ajaxUrl,
              success: function(data) {
                $this.addClass('loaded');

                var dataProduct = $(data).find('.grid-item:lt('+ itemLoad +')');

                loading.remove();
                dataProduct.appendTo(productContainer);
                pet.translateBlock('.widget-trending-product');
                pet.carousel($(thisTab));
                pet.itemSwatch();
                
                if (pet.checkNeedToConvertCurrency()) {
                  Currency.convertAll(window.shop_currency, jQuery('.currency-toggle').first().text(), 'span.money', 'money_format');
                };
                
                if ($('.shopify-product-reviews-badge').length && $('.spr-badge').length) {
                  return window.SPR.registerCallbacks(), window.SPR.initRatingHandler(), window.SPR.initDomEls(), window.SPR.loadProducts(), window.SPR.loadBadges();
                };
                
                

              },
              error: function(err) {
                console.log(err);
              },
              dataType: "html"
            })
          }
        });
      }
    },//productTab

    itemSwatch : function(){
      var thumb = $('.item-swatch li label');

      thumb.off('click').on('click',function(){
        //         debugger;
        var bigImg = $(this).data('imgie'),
            mainImg = $(this).parents('.product-item').find('.change-image'),
            mainImgMb = $(this).parents('.product-item').find('.change-image-mb');
        if(!$(this).hasClass('active')){
          if(window.innerWidth > 1024){
            mainImg.attr('src',bigImg);
          }else{
            mainImgMb.attr('src',bigImg);
          }
          thumb.removeClass('active');
          $(this).addClass('active');
        }
      })
    },

    testimonial : function(){
      var testimonial = $('.homepage-testimonial');

      testimonial.each(function(){
        pet.carousel($(this));
      })
    },//testimonial

    homepageCategory: function(){
      var homepageCategory = $('.hompage-category');

      homepageCategory.each(function(){



        $(this).find('.widget-content').not('.slick-initialized').slick({
          infinite: true,
          slidesToShow: 1,
          slidesToScroll: 1,
          dots:true,
          mobileFirst: true,
          arrows:false,
          responsive: [
            {
              breakpoint: 480,
              settings: {
                slidesToShow: 2,
                slidesToScroll: 1
              }
            },
            {
              breakpoint: 992,
              settings: 'unslick'
            }
          ]
        })

      });

    },//homepageCategory

    initAddToCart : function(){
      var btnAddToCartSlt = '.add-to-cart-btn';
      var btnAddToCart = $(btnAddToCartSlt);

      if(btnAddToCart.length) {
        body.off('click.addToCart', btnAddToCartSlt).on('click.addToCart', btnAddToCartSlt, function(e) {
          e.preventDefault();
          e.stopPropagation();
          var self = $(this),
              data = self.closest('form').serialize();
          
          if($(this).attr('disabled') != 'disabled') {
            var productItem = $(this).closest('.product-item');
            var productId = $(productItem).attr('id');
            var form = productItem.find('form[data-id|="product-actions"]');

            productId = productId.match(/\d+/g);

            if(!window.ajax_cart) {
              form.submit();
            }

            else {

//               var variant_id = form.find('select[name=id]').val();
//               if(!variant_id) {
//                 variant_id = form.find('input[name=id]').val();
//               }

//               var quantity = form.find('input[name=quantity]').val();

//               if(!quantity) {
//                 quantity = 1;
//               }
              
              var title = $(productItem).find('.product-title h2 a').html()|| $(productItem).find('.product-title').html();
              if ($('#quick-view-popup').is(':visible')) {
                var image = $('#quick-view-popup #more_view .slick-current img').attr('src');
              } else {
                var image = $(productItem).find('.product-grid-image img').attr('src') || $('#more_view .slick-current img').attr('src');
              }

              pet.doAjaxAddToCart(data, title, image);
            }
          }

          return false;

        });
      }
    },//initAddToCart

    doAjaxAddToCart : function(data, title, image) {
      $.ajax({
        type: "post",
        url: "/cart/add.js",
        data: data,
        dataType: 'json',

        beforeSend: function() {
          pet.showLoading();
        },

        success: function(msg) {
          pet.hideLoading();

          $('.ajax-success-modal').find('.ajax-product-title').html(translateText(title));
          //         $('.ajax-success-modal').find('.ajax-product-vendor').html(vendor);
          $('.ajax-success-modal').find('.ajax-product-image').attr('src', image);
          $('.ajax-success-modal').find('.message-added-cart').show();

          pet.showModal('.ajax-success-modal');
          pet.closeModal();
          pet.updateDropdownCart();
        },

        error: function(xhr, text) {
          pet.hideLoading();

          $('.ajax-error-message').text($.parseJSON(xhr.responseText).description);

          pet.showModal('.ajax-error-modal');
        }
      });
    },//doAjaxAddToCart

    carousel : function(target){
      var carousel = target.find('.hl-carousel');
      var item = carousel.data('items');
      var loop = carousel.data('loop') == true ? true : false;
      var breakpointItem = [item,4,3,2,1];


      if(target.hasClass('homepage-testimonial')){
        var breakpointItem = [item,4,3,1,1];
      }
      if(window.related_product){
        var breakpointItem = [item,3,3,2,1];
      }
      for(var i = 1; i < breakpointItem.length ; i++){
        breakpointItem[i] = breakpointItem[i] >= item ? item : breakpointItem[i];
      }


      var arg = {
        infinite: loop,
        slidesToShow: item,
        slidesToScroll: 1,
        verticalSwiping: false,
        dots: false,
        arrows:true,
        speed: 500,
        nextArrow: '<button type="button" class="slick-next"><i class="fa fa-angle-right"></i></button>',
        prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-angle-left"></i></button>',
        responsive: [
          {
            breakpoint: 1200,
            settings: {
              slidesToShow: breakpointItem[1],
              slidesToScroll: 1,
              dots: true
            }
          },
          {
            breakpoint: 992,
            settings: {
              dots: true,
              slidesToShow: breakpointItem[2],
              slidesToScroll: 1
            }
          },
          {
            breakpoint: 768,
            settings: {
              dots: true,
              slidesToShow: breakpointItem[3],
              slidesToScroll: 1
            }
          },
          {
            breakpoint: 350,
            settings: {
              dots: true,
              slidesToShow: breakpointItem[4],
              slidesToScroll: 1
            }
          }                    
        ]
      }

      if(carousel.length && !carousel.hasClass('slick-initialized')) {
        carousel.slick(arg);
      }  

    },//productCarousel

    initQuickView : function(){
      var qvButton = '.quickview-button a',
          quickview = $('#quick-view-popup');

      body.off('click.initQuickView', qvButton).on('click.initQuickView', qvButton, function(e) {
        e.preventDefault();
        e.stopPropagation();
        var productUrl = $(this).data('href'),
            dataUrl = productUrl + '?view=quickview',
            product_handle = $(this).attr('id');;

        $.ajax(
          dataUrl, 
          {
            success: function(data) {

              quickview.find('.content .body').html($(data));

              Shopify.getProduct(product_handle, function(product) {
                // ------------swatch
                if(product.available && product.variants.length > 1){

                  new Shopify.OptionSelectors("product-select-" + product.id, {
                    product: product,
                    onVariantSelected: selectCallbackQuickview
                  });


                  quickview.find('.selector-wrapper').show();
                  quickview.find('form.variants .selector-wrapper label').each(function(i,v) {
                    $(this).html('<span class="required">*</span>' + product.options[i].name);

                  });

                  if (window.use_color_swatch) {

                    changeSwatch(quickview.find('.swatch :radio'));

                    Shopify.quickViewOptionsMap = {};
                    Shopify.linkOptionSelectors(product, '#quick-view-popup');

                    var OptArr = window.color_swatch_option.split(';')

                    for (var i = 0 ; i < OptArr.length ; i++ ){
                      quickview.find('.selector-wrapper label:contains('+OptArr[i]+')').parent().hide();
                    }
                  }


                }

                pet.translateBlock('#quick-view-popup');   
                quickview.fadeIn(500);  
                pet.initProductImageGallery($('#quick-view-popup'));
                pet.productZoom();
                pet.countdownQuickview();
                pet.wrapVideo();
                pet.initWishList();
                //quantity
                if(quickview.find('.qty-group').length > 0){
                  pet.qtyChanger(quickview);
                }


                if (window.show_multiple_currencies) {
                  Currency.convertAll(window.shop_currency, $('.currency-toggle').first().text(), 'span.money', 'money_format');
                }


                pet.closeModal();

              });
            },
            error: function() {
              $('#notification-bar').text('An error occurred');
            }
          }
        );
      });

    },//initQuickView

    initProductImageGallery : function(selector) {
      var imgContainer = selector.find('.product-img-box'),
          mainImage = imgContainer.find('.slider-for'),
          navImage = imgContainer.find('.slider-nav'),
          isVertical = imgContainer.hasClass('vertical') ? true : false,
          item = imgContainer.data('item');

      mainImage.slick({
        slidesToShow: 1,
        slidesToScroll: 1,
        arrows: false,
        fade: true,
        verticalSwiping: false,
        asNavFor: navImage
      });

      navImage.slick({
        slidesToShow: item,
        slidesToScroll: 1,
        vertical: isVertical,
        asNavFor: mainImage,
        verticalSwiping: false,
        focusOnSelect: true,
        nextArrow: '<button type="button" class="slick-next"><i class="fa fa-angle-right"></i></button>',
        prevArrow: '<button type="button" class="slick-prev"><i class="fa fa-angle-left"></i></button>',
        responsive:[
          {
            breakpoint: 1025,
            settings: {
              vertical: false,
              slidesToShow: 5
            }
          }
        ]
      });
    },//initProductImageGallery

    productZoom : function(){

      if ($(window).width() >= 1025 ) {
        $('.product-photo-container .thumb a.fancybox').zoom();
      }
      else {    
        $('.product-photo-container .thumb a.fancybox').trigger('zoom.destroy');
      } 
    },//productZoom

    qtyChanger : function(container){
      var button = container.find('.qty-group .button');

      button.off('click.changeQuantity').on('click.changeQuantity', function(e) {
        e.preventDefault();
        e.stopPropagation();

        var oldValue = $(this).siblings('input.qty-input').val(),
            newVal = 1;

        if($(this).hasClass('inc')) {
          newVal = parseInt(oldValue) + 1;
        }
        else if(oldValue > 1) {
          newVal = parseInt(oldValue) - 1;
        }

        $(this).siblings('input.qty-input').val(newVal);

        if($('.sticky_form').length > 0){
          $('.sticky_form').find('.qty-input').val(newVal);
          $('.product-shop').find('.qty-input').val(newVal);
        }
        container.find('input[name=quantity]').trigger('change');
      });

      container.find('input[name=quantity]').on('change', function(){

        pet.updatePricing(container);
      });

    },//qtyChanger

    updatePricing : function(container){
      var regex = /([0-9]+[.|,][0-9]+[.|,][0-9]+)/g;
      var unitPriceTextMatch = container.find('.price').text().match(regex);

      if (!unitPriceTextMatch) {
        regex = /([0-9]+[.|,][0-9]+)/g;
        unitPriceTextMatch = container.find('.price').text().match(regex);
      }

      if (unitPriceTextMatch) {
        var unitPriceText = unitPriceTextMatch[0];
        var unitPrice = unitPriceText.replace(/[.|,]/g, '');
        var quantity = parseInt(container.find('input[name=quantity]').val());
        var totalPrice = unitPrice * quantity;

        var totalPriceText = Shopify.formatMoney(totalPrice, window.money_format);
        regex = /([0-9]+[.|,][0-9]+[.|,][0-9]+)/g;     
        if (!totalPriceText.match(regex)) {
          regex = /([0-9]+[.|,][0-9]+)/g;
        } 
        totalPriceText = totalPriceText.match(regex)[0];

        var regInput = new RegExp(unitPriceText, "g");
        var totalPriceHtml = container.find('.price').html().replace(regInput, totalPriceText);

        container.find('.total-price span.money').html(totalPriceHtml);
      }; 
    },//updatePricing

    dropDownSubCategory : function(){
      var iconDropdownSlt = '.sidebar-links .icon-dropdown';
      var iconDropdown = $(iconDropdownSlt);

      //onclick
      body.off('click.dropDownSubCategory', iconDropdownSlt).on('click.dropDownSubCategory', iconDropdownSlt, function(e) {
        e.preventDefault();
        e.stopPropagation();

        var self = $(this);
        var parent = self.parent();

        if(parent.hasClass('open')) {
          parent.removeClass('open');
          self.prev('a').removeClass('active');
          self.next().hide();
        }
        else {
          parent.addClass('open');
          self.prev('a').addClass("active");
          self.next().show();
        }
      });
    },//dropDownSubCategory

    initProductSidebarSlider : function(){
      var sideProduct = $('#sidebar-product-block');
      pet.carousel(sideProduct);

    },//initProductSidebarSlider

    sidebarInitToggle : function() {
      var sidebarLabelSlt = '.sidebar-label';
      var sidebarLabel = $(sidebarLabelSlt);

      if(sidebarLabel.is(':visible')) {
        body.off('click.showSidebar', sidebarLabelSlt).on('click.showSidebar', sidebarLabelSlt, function(e) {
          body.addClass('open-sb');

        });
      };

      var widgetTitleSlt = '.sidebar .widget-title';
      var widgetTitle = $(widgetTitleSlt);


      widgetTitle.removeClass('open'); 
      widgetTitle.next().show();


      body.off('click.slideToogle', widgetTitleSlt).on('click.slideToogle', widgetTitleSlt, function(e) {
        clearTimeout(pet.petTimeout);

        pet.petTimeout = setTimeout(function() {
          $('.widget-product .products-grid').slick('unslick');    
          $('.widget-product .products-grid').find('.slick-list').removeAttr('style');

          pet.initProductSidebarSlider();
        }, 50);

        $(this).toggleClass('open');
        $(this).next().slideToggle();
      });
    },//sidebarInitToggle

    initSidebar : function() {
      if ($('.collection-sidebar').length) {
        pet.sidebarParams();
        pet.sidebarMapEvents();          
        pet.sidebarMapClear();
        pet.sidebarMapClearAll();
      };
    },//initSidebar

    sidebarParams : function() {
      Shopify.queryParams = {};

      //get after ?...=> Object {q: "Acme"} 

      if (location.search.length) {
        for (var aKeyValue, i = 0, aCouples = location.search.substr(1).split('&'); i < aCouples.length; i++) {
          aKeyValue = aCouples[i].split('=');

          if (aKeyValue.length > 1) {
            Shopify.queryParams[decodeURIComponent(aKeyValue[0])] = decodeURIComponent(aKeyValue[1]);
          }
        }
      };
    },//sidebarParams

    sidebarMapEvents : function() {
      pet.sidebarMapCategories();
      pet.sidebarMapTagEvents();
    },//sidebarMapEvents

    sidebarMapCategories : function() {
      var sidebarCate = $(".sidebar-links");
      var sidebarLinkSlt = '.sidebar-links-ajax a';
      var sidebarLink = $(sidebarLinkSlt);      

      body.off('click.activeCategory', sidebarLinkSlt).on('click.activeCategory', sidebarLinkSlt, function(e) {

        if($(this).attr('href').indexOf('/collections') > -1) {
          e.preventDefault();
          e.stopPropagation();

          var self = $(this);
          var parent = self.parents('li');

          if(!$(this).hasClass('active')) {
            delete Shopify.queryParams.q;
            delete Shopify.queryParams.constraint;
            pet.sidebarAjaxClick($(this).attr('href'));
          };

          sidebarLink.not(self).removeClass('active');
          $(this).addClass('active'); 
          parent.children('a').addClass('active');
          sidebarCate.find('.dropdown-cat').not(parent.find('.dropdown-cat')).hide();
          $('.sidebar-links-ajax li.open').removeClass('open');
          self.siblings('.dropdown-cat').show();
          parent.addClass('open');                  	  

        };
      });
    },//sidebarMapCategories

    sidebarMapTagEvents : function() {
      var sidebarTag = $('.sidebar-tag a:not(".clear"), .sidebar-tag label, .refined .selected-tag');

      sidebarTag.off('click.checkedTag').on('click.checkedTag', function(e) {
        e.preventDefault();
        e.stopPropagation();

        var currentTags = [];

        if (Shopify.queryParams.constraint) {
          currentTags = Shopify.queryParams.constraint.split('+'); //Array
        };

        //one selection or multi selection
        if (!window.enable_sidebar_multiple_choice && !$(this).prev().is(':checked')) {
          //remove other selection first
          var otherTag = $(this).closest('.sidebar-tag, .refined-widgets').find('input:checked');

          if (otherTag.length) {
            var tagName = otherTag.val();
            if (tagName) {
              var tagPos = currentTags.indexOf(tagName);
              if (tagPos >= 0) {
                //remove tag
                currentTags.splice(tagPos, 1);
              }
            }
          };
        };

        var tagName = $(this).prev().val();

        if (tagName) {
          var tagPos = currentTags.indexOf(tagName);

          if (tagPos >= 0) {
            //tag already existed, remove tag
            currentTags.splice(tagPos, 1);
          }
          else {
            //tag not existed
            currentTags.push(tagName);
          }
        };

        if (currentTags.length) {
          Shopify.queryParams.constraint = currentTags.join('+');
        }
        else {
          delete Shopify.queryParams.constraint;
        };

        pet.sidebarAjaxClick();
      });
    },//sidebarMapTagEvents

    sidebarMapClear : function() {
      var sidebarTag = $('.sidebar-tag');

      sidebarTag.each(function() {
        var sidebarTag = $(this);

        if (sidebarTag.find('input:checked').length) {
          //has active tag
          sidebarTag.find('.clear').show().click(function(e) {
            e.preventDefault();
            e.stopPropagation();

            var currentTags = [];

            if (Shopify.queryParams.constraint) {
              currentTags = Shopify.queryParams.constraint.split('+');
            };

            sidebarTag.find("input:checked").each(function() {
              var selectedTag = $(this);
              var tagName = selectedTag.val();

              if (tagName) {
                var tagPos = currentTags.indexOf(tagName);
                if (tagPos >= 0) {
                  //remove tag
                  currentTags.splice(tagPos, 1);
                };
              };
            });

            if (currentTags.length) {
              Shopify.queryParams.constraint = currentTags.join('+');
            }
            else {
              delete Shopify.queryParams.constraint;
            };

            pet.sidebarAjaxClick();

          });
        }
      });
    },//sidebarMapClear

    sidebarMapClearAll : function() {
      var clearAllSlt = '.refined-widgets a.clear-all';
      var clearAllElm = $(clearAllSlt);

      body.off('click.clearAllTags', clearAllSlt).on('click.clearAllTags', clearAllSlt, function(e) {
        e.preventDefault();
        e.stopPropagation();

        delete Shopify.queryParams.constraint;
        delete Shopify.queryParams.q;

        pet.sidebarAjaxClick();
      });
    },//sidebarMapClearAll

    sidebarAjaxClick : function(baseLink) {

      delete Shopify.queryParams.page;

      var newurl = pet.sidebarCreateUrl(baseLink);

      pet.isSidebarAjaxClick = true;

      History.pushState({
        param: Shopify.queryParams
      }, doc.title , newurl);

      pet.sidebarGetContent(newurl);
    },//sidebarAjaxClick

    sidebarGetContent :  function(newurl) {

      $.ajax({
        type: 'get',
        url: newurl,

        beforeSend: function() {
          pet.showLoading();
        },

        success: function(data) {
          pet.sidebarMapData(data);
          pet.dropDownSubCategory();
          pet.translateBlock('.main-content');
          pet.sidebarMapTagEvents();
          pet.sidebarMapClear();
          pet.hideLoading();
          pet.itemSwatch();
          pet.initInfiniteScrolling();

          if($(".wishlist-btn").length > 0){
            pet.initWishList();
          }

          else {
            $('.sidebar').css({'display': ''});
          };
        },

        error: function(xhr, text) {
          pet.hideLoading();
          $('.ajax-error-message').text($.parseJSON(xhr.responseText).description);
          pet.showModal('.ajax-error-modal');
        }
      });
    },//sidebarGetContent

    sidebarMapData : function(data) {
      var currentList = $('.col-main .products-grid');

      if (currentList.length == 0) {
        currentList = $('.col-main .product-list');
      };

      var productList = $(data).find('.col-main .products-grid');

      if (productList.length == 0) {
        productList = $(data).find('.col-main .product-list');
      };

      currentList.replaceWith(productList);


      //replace title & description
      var currenPageTitle = $('.page-title h2');
      var dataPageTitle = $(data).find('.page-title h2');

      if (currenPageTitle.text() != dataPageTitle.text()) {
        currenPageTitle.replaceWith(dataPageTitle);
      }
      var currentDes = $('.collection-des');
      var dataDes = $(data).find('.collection-des');

      if (currentDes.find('.rte').length) {
        if (dataDes.find('.rte').length) {
          currentDes.html(dataDes.find('.rte'));
        } else {
          currentDes.find('.rte').hide();
        }
      }
      else {
        currentDes.html(dataDes.find('.rte'));
      };

      var currentImg = $(".collection-img");
      var dataImg = $(data).find(".collection-img");

      if (currentImg.find("p").length) {
        if (dataImg.find("p").length) {
          currentImg.html(dataImg.find("p"));
        } else {
          currentImg.find("p").hide();
        }
      }
      else {
        currentImg.html(dataImg.find("p"));
      }


      // breadcrumb
      $('.breadcrumb').replaceWith($(data).find('.breadcrumb'));

      $('head title').text(($(data).filter('title').text()));


      //replace refined
      $('.refined-widgets').replaceWith($(data).find('.refined-widgets'));

      //replace tags
      $('.sidebar-block').replaceWith($(data).find('.sidebar-block'));

      //replace paging
      if ($('.padding').length > 0) {
        $('.padding').replaceWith($(data).find(".padding"));
      }

      else {
        $(".block-row.col-main").append($(data).find('.padding'));
      };

      //convert currency
      if (pet.checkNeedToConvertCurrency()) {
        Currency.convertAll(window.shop_currency, jQuery('.currency-toggle').first().text(), '.col-main span.money', 'money_format');
      };

      //product review
      if ($('.shopify-product-reviews-badge').length && $('.spr-badge').length) {
        return window.SPR.registerCallbacks(), window.SPR.initRatingHandler(), window.SPR.initDomEls(), window.SPR.loadProducts(), window.SPR.loadBadges();
      };
    },//sidebarMapData

    sidebarCreateUrl :  function(baseLink) {
      var newQuery = $.param(Shopify.queryParams).replace(/%2B/g, '+');

      if (baseLink) {
        if (newQuery != "")
          return baseLink + "?" + newQuery;
        else
          return baseLink;
      }
      return location.pathname + "?" + newQuery;
    },//sidebarCreateUrl

    checkNeedToConvertCurrency : function(){
      return window.show_multiple_currencies && Currency.currentCurrency != shopCurrency;
    },//checkNeedToConvertCurrency 

    initToolbar : function() {
      pet.initDropdownFilterSortby();
      pet.toolbarMapEvents();
    },//initToolbar

    initDropdownFilterSortby : function() {
      var labelSlt = '.toolbar .filter-sortby .button-wrapper';
      var dropdownMenuSlt = '.toolbar .filter-sortby .dropdown-menu';


      pet.Toggle($(labelSlt));

    },//initDropdownFilterSortby

    toolbarMapEvents : function() {
      pet.sidebarParams();
      pet.toolbarMapView();
      pet.toolbarMapSorting();
    },//toolbarMapEvents

    toolbarMapView : function() {
      var viewAsSlt = '.toolbar .view-mode .view-as';
      var viewAs = $(viewAsSlt);

      body.off('click.mapView', viewAsSlt).on('click.mapView', viewAsSlt, function(e) {
        e.preventDefault();
        e.stopPropagation();

        if (!$(this).hasClass('active')) {

          if ($(this).hasClass('list')) {
            Shopify.queryParams.view = 'list';
          }
          else {
            Shopify.queryParams.view = '';
          }

          pet.sidebarAjaxClick();

          $('.view-mode .view-as.active').removeClass('active');
          $(this).addClass('active');
        }
      });
    },

    toolbarMapSorting : function() {
      var sortbyFilterSlt = '.filter-sortby li';
      var sortbyFilter = $(sortbyFilterSlt);

      body.off('click.sortBy', sortbyFilterSlt).on('click.sortBy', sortbyFilterSlt, function(e) {
        e.preventDefault();
        e.stopPropagation();

        var self = $(this);
        var sortbyText = self.find('span').text();
        var label = $('.filter-sortby .button-wrapper .label-text');

        if(!self.hasClass('active')) {
          Shopify.queryParams.sort_by = self.find('span').attr('data-href');
          pet.sidebarAjaxClick();
          label.text(sortbyText);
        }

        sortbyFilter.not(self).removeClass('active');
        self.addClass('active');

        $('.filter-sortby .button-wrapper').removeClass('active').next('.dropdown-menu').hide();
      });

      if (Shopify.queryParams.sort_by) {
        var sortby = Shopify.queryParams.sort_by;
        var sortbyText = $(".filter-sortby span[data-href='" + sortby + "']").text();

        $('.filter-sortby .button-wrapper .label-text').text(sortbyText);
        $('.filter-sortby li.active').removeClass('active');
        $(".filter-sortby span[data-href='" + sortby + "']").parent().addClass("active");
      }

      else {
        var sortbyText = $('.filter-sortby .dropdown-menu .active').text();

        $('.filter-sortby .button-wrapper .label-text').text(sortbyText);
      }
    },//toolbarMapSorting


    collectionMapPaging : function() {
      var paginationSlt = '.pagination-page a';

      body.off('click.initMapPaging', paginationSlt).on('click.initMapPaging', paginationSlt, function(e) {
        e.preventDefault();
        e.stopPropagation();

        var page = $(this).attr('href').match(/page=\d+/g);

        if (page) {
          Shopify.queryParams.page = parseInt(page[0].match(/\d+/g));

          if (Shopify.queryParams.page) {
            var newurl = pet.sidebarCreateUrl();

            pet.isSidebarAjaxClick = true;

            History.pushState({
              param: Shopify.queryParams
            }, doc.title , newurl);

            pet.sidebarGetContent(newurl);

            var top = $('.block-row > div > .toolbar, .search-page').offset().top;

            $('body,html').animate({
              scrollTop: top
            }, 600);
          };
        };

      });
    },//sidebarMapPaging

    initInfiniteScrolling : function() {
      var infiniteScrolling = $('.infinite-scrolling');
      var infiniteScrollingLinkSlt = '.infinite-scrolling a';

      if(infiniteScrolling.length) {
        body.off('click.initInfiniteScrolling', infiniteScrollingLinkSlt).on('click.initInfiniteScrolling', infiniteScrollingLinkSlt, function(e) {
          e.preventDefault();
          e.stopPropagation();

          if (!$(this).hasClass('disabled')) {
            pet.doInfiniteScrolling();
          };
        });

        if(window.infinity_scroll_feature) {


          $(window).scroll(function() {
            if (pet.isAjaxLoading) return;

            var pos = infiniteScrolling.offset().top;
            var scroll = $(this).scrollTop(); 
            var screenHeight = $(window).outerHeight();
            var footerHeight = $('.site-footer').outerHeight();
            var hook = 0;

            if (scroll > (pos - screenHeight + footerHeight - footerHeight*0.8 ) && infiniteScrolling.is(':visible')) {

              $(infiniteScrollingLinkSlt).trigger("click");

            }
          });
        }
      };
    },//initInfiniteScrolling

    doInfiniteScrolling : function() {
      var currentList = $('.block-row .products-grid');

      if (!currentList.length) {
        currentList = $('.block-row .product-list');
      };

      if (currentList) {
        var showMoreButton = $('.infinite-scrolling a');

        $.ajax({
          type: 'GET',
          url: showMoreButton.attr('href'),

          beforeSend: function() {
            pet.showLoading();
          },

          success: function(data) {
            pet.hideLoading();

            var products = $(data).find('.block-row .products-grid');

            if (!products.length) {
              products = $(data).find('.block-row .product-list');
            };

            if (products.length) {

              currentList.append(products.children());
              pet.translateBlock('.main-content');
              pet.itemSwatch();

              //get link of Show more
              if ($(data).find('.infinite-scrolling').length > 0) {
                showMoreButton.attr('href', $(data).find('.infinite-scrolling a').attr('href'));
              }
              else {
                //no more products
                var noMoreText = window.inventory_text.no_more_product;
                if(window.multi_lang){
                  if(translator.isLang2()){
                    noMoreText = window.lang2.collections.general.no_more_product;
                  }
                }
                
                showMoreButton.html(noMoreText).addClass('disabled');
              };

              //currency
              if (pet.checkNeedToConvertCurrency()) {
                Currency.convertAll(window.shop_currency, jQuery('.currency-toggle').first().text(), 'span.money', 'money_format');
              };
              if($(".wishlist-btn").length > 0){
                pet.initWishList();
              }

            }

          },
          complete: function(){ //product review
            if ($(".shopify-product-reviews-badge").length > 0) {
              setTimeout(function(){
                return window.SPR.registerCallbacks(), window.SPR.initRatingHandler(), window.SPR.initDomEls(), window.SPR.loadProducts(), window.SPR.loadBadges();
              },1000);
            };
          },
          error: function(xhr, text) {
            pet.hideLoading();
            $('.ajax-error-message').text($.parseJSON(xhr.responseText).description);
            pet.showModal('.ajax-error-modal');
          },
          dataType: "html"
        });
      }
    },//doInfiniteScrolling

    initProductAddToCart : function(){

      var btnAddToCartSlt = '#product-add-to-cart';
      var btnAddToCart = $(btnAddToCartSlt);
      

      if(btnAddToCart.length) {
        body.off('click.addToCartProduct', btnAddToCartSlt).on('click.addToCartProduct', btnAddToCartSlt, function(e) {
          e.preventDefault();
          e.stopPropagation();
          
          var self = $(this),
              data = self.closest('form').serialize();

          if($(this).attr('disabled') != 'disabled') {
            if(!window.ajax_cart) {
              $(this).closest('form').submit();
            }

            else {
//               var variant_id = $('#add-to-cart-form select[name=id]').val();

//               if(!variant_id) {
//                 variant_id = $('#add-to-cart-form input[name=id]').val();
//               }

//               var quantity = $('#add-to-cart-form input[name=quantity]').val();

//               if(!quantity) {
//                 quantity = 1;
//               }

              var title = $('.product-title h2').html();

              var image = $('.slick-current img[id|="product-featured-image"]').attr('src') || $('.product img[id|="product-featured-image"]').attr('src');

              pet.doAjaxAddToCart(data, title, image);
            }
          }

          return false;

        });
      }

    },

    initStickyAddtoCart : function(){

      if ($('#grouped-add-to-cart').length){
        $('.sticky_form .sticky-item.extra').remove();
      }

      var p = $('#product-selectors option:selected').val();
      var t = $('.sticky_form .pr-swatch[data-value="'+p+'"]').text();
      $('.pr-selectors .pr-active').text(t);
      $('.sticky_form .pr-swatch[data-value="'+p+'"]').addClass('active');


      $( ".swatch .swatch-element" ).each(function(e) {
        var dav = $(this).data("value");
        $('.swatch input.text[data-value="'+dav+'"]').appendTo($(this))
      });


      $( ".selector-wrapper" ).change(function() {
        var n =$("#product-selectors").val();
        $( ".sticky_form .pr-selectors li" ).each(function( e ) {
          var t =$(this).find('a').data('value');
          if(t == n){
            $(this).find('a').addClass('active')
          } else{
            $(this).find('a').removeClass('active')
          }
        });
        $( "#product-selectors" ).change(function() {
          var str = "";
          $( "#product-selectors option:selected" ).each(function() {
            str += $( this ).data('imge');
          });
          $('.sticky_form .pr-img img').attr("src",str );
        }).trigger( "change" );

        if($('.sticky_form .pr-swatch').hasClass('active')){
          var h = $('.sticky_form .pr-swatch.active').text();
          $('.sticky_form .action input[type=hidden]').val(n);
          $('.sticky_form .pr-active').text(h);
          $('.sticky_form .pr-active').attr('data-value', n);
        }

      });

      $(document).click(function(e){
        var container = $(".sticky_form .pr-active");
        if (!container.is(e.target) && container.has(e.target).length === 0){
          $('.sticky_form').removeClass('open-sticky');
        }
      });

      $('.sticky_form .pr-active').on('click', function(){
        $('.sticky_form').toggleClass('open-sticky');
      });

      $('.sticky_form .pr-swatch').on('click', function(e){        
        $('.sticky_form .pr-swatch').removeClass('active');
        $(this).addClass('active');


        $('.sticky_form').toggleClass('open-sticky');


        var text = $(this).text(),
            value = $(this).data('value');

        $('.sticky_form .action input[type=hidden]').val(value);
        $('.sticky_form .pr-active').attr('data-value', value);
        $('.sticky_form .pr-active').text(text);
        $( '.swatch input.text[data-v="'+value+'"]' ).parent().find('.tric').click();

        if($(this).hasClass('sold-out')){
          $('.sticky-add-to-cart').val(window.inventory_text.sold_out).addClass('disabled').attr('disabled', 'disabled');
        }
        else{
          $('.sticky-add-to-cart').removeClass('disabled').removeAttr('disabled').val(window.inventory_text.add_to_cart);
        }

        var newImage = $(this).data('img');
        $('.pr-img img').attr({ src: newImage }); 
        return false;

      });

      $(document).on('click', '.sticky-add-to-cart', function(event) {
        event.preventDefault();
        if ($('#grouped-add-to-cart').length){
          $('#grouped-add-to-cart').click();
        }else{
          $('#product-add-to-cart').click();
        }
        return false;
      });

      var height = $('.product').outerHeight();

      $(window).scroll(function () {
        var scrollTop = $(this).scrollTop();
        if (scrollTop > height) {
          $('body').addClass('show_sticky');
        }
        else {
          $('body').removeClass('show_sticky');
        }
      });   


    },//initStickyAddtoCart

    initRelatedProductSlider : function(){
      var relatedProduct = $('.related-products');
      pet.carousel(relatedProduct);
    },

    pageBrandCarousel : function(){
      var brandSlider = $('.brands-page').find('.hl-carousel');
      var items = brandSlider.data('items');

      if(brandSlider.length > 0){

        brandSlider.slick({
          infinite: true,
          slidesToShow: items,
          slidesToScroll: 1,
          variableWidth: false,
          prevArrow: '<button class="slick-prev"><i class="fa fa-angle-left"></i></button>',
          nextArrow: '<button class="slick-next"><i class="fa fa-angle-right"></i></button>',
          responsive: [
            {
              breakpoint: 1025,
              settings: {
                slidesToShow: 4,
                slidesToScroll: 1
              }
            },
            {
              breakpoint: 768,
              settings: {
                slidesToShow: 3,
                slidesToScroll: 1
              }
            },
            {
              breakpoint: 480,
              settings: {
                slidesToShow: 2,
                slidesToScroll: 1
              }
            } 

          ]
        });

      }
    },

    pageBrand : function(){
      $(".brands-list .brand").each(function(){
        var chi = $(this).find(".azbrands-title h3").text().trim();
        var ch = $(this).find("ul.brandgrid li:eq(0)").text().charAt(0);
        $('.azbrandstable').children().each(function(){
          if( $(this).find('a').text().trim() == chi){
            if( !$(this).find('a').hasClass('readonly') )
              $(this).find('a').addClass('readonly');
            return;
          }
        });
        if($(this).find(".azbrands-title").length == 0){
          $(this).find("ul.brandgrid").children().appendTo('.brand-' + ch + " ul.brandgrid");
          $(this).remove();
        }
      });

      $('.azbrandstable .vendor-letter a.readonly').click(function(){
        var v = $(this).text();
        $('.brands-list .brand').hide().filter(function(e){
          var n =  $(this).find('h3').text();
          return n == v;
        }).show();
        $('.azbrandstable .all-brand a').click(function(){
          $(".brands-list .brand").show();
        });
      });
      $('.azbrandstable a.readonly').click(function(){
        $('.azbrandstable a').removeClass('active');
        var $this = $(this);
        if (!$this.hasClass('active')) {
          $this.addClass('active');
        }
        //       var topbrand = $('.wrapper-header').outerHeight();
        //       $('html, body').animate({scrollTop: topbrand}, 400);
      });

    },//pageBrand


    addEventLookbookModal : function() {
      body.off('click.addEvenLookbookModal touchstart.addEvenLookbookModal', '.lookbook-item').on('click.addEvenLookbookModal touchstart.addEvenLookbookModal', '.lookbook-item', function(e) {
        e.preventDefault();
        e.stopPropagation();

        var handle = $(this).find('span').data('handle'),
            position = $(this);

        pet.doAjaxAddLookbookModal(handle, position);
        doc.off('click.closeLookbookModal').on('click.closeLookbookModal', '[data-close-lookbook-modal], .ajax-lookbook-modal .overlay', function() {
          pet.closeLookbookModal();
          return false;

        });

      });

    },//addEventLookbookModal

    closeLookbookModal :  function() {
      $('.ajax-lookbook-modal').fadeOut(500);
    },

    doAjaxAddLookbookModal :  function(handle, position) {
      var offSet = $(position).position(),
          top= $(position).offset().top,
          left = offSet.left,
          iconWidth = position.innerWidth(),
          contentWidht = position.closest('.lazy-images-contain').innerWidth(),
          innerLookbookModal = $('.ajax-lookbook-modal').innerWidth(),            
          str1 = contentWidht + "px",
          str2 = left - 2 + "px",
          str3 = iconWidth + "px",
          str4 = innerLookbookModal + "px",
          newtop,
          leftPosition,
          newleft;

      if(window.innerWidth > 767) {
        if((contentWidht - left) < innerLookbookModal) {
          leftPosition = "(100% - " + str1 + ")/2" + " + " + str2 + " - " + str4;        
        }
        else {
          leftPosition = "(100% - " + str1 + ")/2" + " + " + str2 + " + " + str3;
        }

        newleft = "calc(" +  leftPosition + ")";
        newtop = top - (innerLookbookModal/2) + "px";
      }

      else {
        newleft = 0;
        newtop = top - (innerLookbookModal/2) + "px";
      };

      $.ajax({
        type: "get",
        url:'/products/'+handle+'?view=json',

        success: function(data) {
          $('.ajax-lookbook-modal').css({'left': newleft, 'top': newtop });

          $('.ajax-lookbook-modal .lookbook-content').html(data);



          pet.translateBlock('.lookbook-content');
          $('.ajax-lookbook-modal').fadeIn(500);
          pet.initAddToCart();
          if ($('.shopify-product-reviews-badge').length && $('.spr-badge').length) {
            return window.SPR.registerCallbacks(), window.SPR.initRatingHandler(), window.SPR.initDomEls(), window.SPR.loadProducts(), window.SPR.loadBadges();
          };
        },

        error: function(xhr, text) {
          $('.ajax-error-message').text($.parseJSON(xhr.responseText).description);

          pet.showModal('.ajax-error-modal');
        }
      });
    },//doAjaxAddLookbookModal

    lookbookSlideshow : function(){
      pet.slideshow($('.lookbook_page'));
    },//lookbookSlideshow

    wrapVideo : function(){
      if($('iframe').length > 0 ){
        $('iframe').each(function(){
          if($(this).parent('#video_product').length > 0){
            $(this).wrap('<div class="video-wrapper-wrapper"><div class="video-wrapper"></div></div>');
          }
        })
      }
    },//wrapVideo

    initCartProductSlider : function(){
      var cartProduct = $('.widget-also-like-product');
      pet.carousel(cartProduct);
    },//initCartProductSlider

    initFeatureProduct : function(){
      pet.carousel($('.widget-featured-product'));
    },//initCartProductSlider

    resizeMenuCate : function(){
      var cateMenu = $('.home-slideshow .cat-menu.resize');
      if(cateMenu.length > 0){
        cateMenu.each(function(){
          var $this = $(this);
          var slideshow = $(this).parents('.home-slideshow').find('.col-left .slideshow');

          if(slideshow.length > 0){
            setTimeout(function() {
              var height = slideshow.outerHeight();
              $this.css('height',height - 30);
            },50);
          }
        })
      }
    },//resizeMenuCate
    initWishListPage :function(){

      var ListWishList = $('.wishlist-content'),
          itemsArray = localStorage.getItem('items') ? JSON.parse(localStorage.getItem('items')) : [];
      var currentpage = 1;
      var pagecount = 0;

      // Load product in wishlist function and set pagination
      var dataWishlist = function(ProductHandle) {
        jQuery.getJSON('/products/'+ProductHandle+'.js', function(product) {
          var productHTML = '';
          var price_min = Shopify.formatMoney(product.price_min, window.money_format);

          productHTML += '<div class="grid-item wishlist-product-content"  data-product-handle="'+product.handle+'" data-id="'+ product.id +'">';
          productHTML += '<div class="inner product-item" id="product-' + product.id + '">';

          productHTML += '<div class="product-image"><a href="'+product.url +'" class="product-grid-image"><image src="'+product.featured_image +'" /></a></div>';
          productHTML += '<div class="product-details">';
          productHTML += '<div class="product-title col_1"><a href="'+product.url +'">'+product.title+'</a></div>';
          productHTML += '<div class="price-box col_2"><p class="regular-product">'+ price_min +'</p></div>';
          productHTML += '<div class="action-area col_3 wishlist-action">';
          productHTML += '<form action="/cart/add" method="post" class="variants" enctype="multipart/form-data">';
          productHTML += '<input type="hidden" name="id" value="'+ product.variants[0].id +'" />  ';
          if (product.available) {
            if (product.variants.length == 1) {
              productHTML += '<input class="btn add-to-cart-btn" type="submit" value="'+window.inventory_text.add_to_cart+'"/>'; 
            } 
            if (product.variants.length > 1){
              productHTML += '<a class="btn select-option-btn"  href="'+product.url +'">'+window.inventory_text.select_options+'</a>';
            }
          } else {
            productHTML += '<input class="btn add-to-cart-btn" disabled="disabled" type="submit" value="'+window.inventory_text.unavailable+'"/>';
          }
          productHTML += '<a class="btn-active btn btn-remove-wishlist btn-remove" href="#" data-id="'+ product.id +'">'+ window.inventory_text.remove_wishlist_item +'</a>';
          productHTML += '</form></div>';
          productHTML += '</div></div></div>';
          productHTML.textContent = product; 
          ListWishList.append(productHTML).html();




        });
      };

      // Display wishlist item per page
      function showpage(page) {
        $('.wishlist-page .grid-item').hide();
        $('.wishlist-page .grid-item').eq((page-1)*3).show().next().show().next().show();
        $('#pagin').find('a').removeClass('current').eq(page).addClass('current');
      }

      // Display pagination bar
      function showPaginationBar(){
        var pagecount = Math.floor(($('.wishlist-page .grid-item').size()) / 3);
        if (($('.wishlist-page .grid-item').size()) % 3 > 0) {
          pagecount++;
        }

        $('.wishlist-page #pagin').html('<li><a>previous</a></li>');
        if(pagecount > 1){
          for (var i = 1; i <= pagecount; i++) {
            if(i == currentpage){
            $('#pagin').append('<li><a class="current">' + i + '</a></li>');
            }else{
            $('#pagin').append('<li><a>' + i + '</a></li>');
            }
          }

          $('.wishlist-page #pagin').append('<li><a>next</a></li>');
          $('#pagin').show();
        }
        else
        {
          $('#pagin').hide();
        }

        $(".wishlist-page #pagin").on("click", "a", function(event){

          event.preventDefault();

          if($(this).html() == "next") {
            currentpage++;
          }
          else if($(this).html() == "previous") {
            currentpage--;
          }
          else {
            currentpage = $(this).html();
          }

          if(currentpage < 1) {currentpage = 1;}

          if(currentpage > pagecount) {currentpage = pagecount;}
          showpage(currentpage);
        });
      };        
      // Call load product function to load product frome localStorage
      itemsArray.forEach(function(item) {
        dataWishlist(item);
      });

      // product load completed
      $(document).ajaxStop(function() {
        showPaginationBar();
        showpage(1);
        pet.translateBlock(".wishlist-page");      
        // Removed item function
        $('.wishlist-content .action-area .btn-remove-wishlist').click(function(e){
          e.preventDefault();
          debugger;
     
          var thisItem = $(this).parents('.grid-item');
          
          var itemIndex = thisItem.index();
         
          if(itemIndex % 3 == 0 && itemIndex == $('.wishlist-content .grid-item').length - 1){
            var newpage = currentpage - 1;
            currentpage = newpage;
          }else{
            var newpage = currentpage;

          }
          
          thisItem.remove();
           showpage(newpage);  
           showPaginationBar();
          pet.removeFromWishlist($(this))
        })
      });
    },
    addToWishlist : function (self) {
      var itemsArray = localStorage.getItem('items') ? JSON.parse(localStorage.getItem('items')) : [];
        var ProductHandle = self.attr('data-product-handle');

          itemsArray.push(ProductHandle);

          //remove duplicate items
          var uniqueItems = [];
          $.each(itemsArray, function(i, el){
            if($.inArray(el, uniqueItems) === -1) uniqueItems.push(el);
          });
          itemsArray = uniqueItems;

          localStorage.setItem('items', JSON.stringify(itemsArray));
      
 


      },
    removeFromWishlist : function(self){
      debugger;
      var itemsArray = localStorage.getItem('items') ? JSON.parse(localStorage.getItem('items')) : [];
      var ProductHandle = self.attr('data-product-handle'),
          removeIndex = itemsArray.indexOf(ProductHandle);
      itemsArray.splice(removeIndex, 1);
      localStorage.setItem('items', JSON.stringify(itemsArray));
      

    },
    initWishList : function(e){   
      var button = $('.wishlist-btn'),
          itemsArray = localStorage.getItem('items') ? JSON.parse(localStorage.getItem('items')) : [];


      // active added products
      function checkForActive(){
        var itemsArray = localStorage.getItem('items') ? JSON.parse(localStorage.getItem('items')) : [];
        itemsArray.forEach(function (item) {
          var activeButton = $('.addwishlist .wishlist-btn[data-product-handle="'+item+'"]')

          activeButton.addClass('btn-active');
          activeButton.find('.wishlist_text').text(window.inventory_text.remove_wishlist);

        });
      }
      
      $(document).off('click.wishlistClick','.wishlist-btn:not(.btn-active)').on('click.wishlistClick', '.wishlist-btn:not(.btn-active)', function(e){

        e.preventDefault();
        var thisProduct = $(this).data('product-handle');
        $('.wishlist-btn[data-product-handle="'+thisProduct+'"]').addClass('btn-active');
        $('.wishlist-btn[data-product-handle="'+thisProduct+'"]').find(".wishlist_text").text(window.inventory_text.remove_wishlist);
        pet.addToWishlist($(this));
        
      }); 

      $(document).on('click', '.wishlist-btn.btn-active', function(e){
        $(this).find(".wishlist_text").text(window.inventory_text.add_wishlist);
        e.preventDefault();	
        var thisProduct = $(this).data('product-handle');
		pet.removeFromWishlist($(this));
        $('.wishlist-btn.btn-active[data-product-handle="'+thisProduct+'"]').removeClass('btn-active');
        

      }); 
	
      
      checkForActive();

    },

    countdownQuickview : function(){
      var count_down_final = $("#quickview-clock").data('time');
      $("#quickview-clock").countdown(count_down_final, function(event) {
        $(this).html(event.strftime('%Dd, %Hh : %Mm : %Ss'));
      });
    }//countdownQuickview

  }//end pet Object

  var translateText = function(str) {
    if(str != null){
      if (!window.multi_lang || str.indexOf("|") < 0)
        return str;

      if (window.multi_lang) {
        var textArr = str.split("|");

        if (translator.isLang2())
          return textArr[1];
        return textArr[0];
      };
    }
  }//translateText


  var currentWinWidth = $(window).width();
  var resizeTimeout;

  $(window).off('resize').on('resize', function() {
    clearTimeout(resizeTimeout);

    resizeTimeout = setTimeout(function() {
      var newW =  $(window).width();
      if (currentWinWidth !== $(window).width()){
        if(newW > 991){
          pet.resizeMenuCate();
        }
        if(newW < 1025){
          pet.headerMobile();
          pet.sidebarInitToggle();
        }else{
          pet.headerDesktop();
          if(window.fixtop_menu){
            pet.fixedTopMenu();
          }
        }
        pet.itemSwatch();
        pet.homepageCategory();
        currentWinWidth = $(window).width();
      }
    }, 50);
  });
  //   ===========================================================


  doc
  .on( 'shopify:section:load', pet.langSwitch)
  .on( 'shopify:section:unload', pet.langSwitch)
  .on( 'shopify:section:load', pet.homeSlideshow)
  .on( 'shopify:section:unload', pet.homeSlideshow)
  .on( 'shopify:section:load', pet.brandSlider)
  .on( 'shopify:section:unload', pet.brandSlider)
  .on( 'shopify:section:load', pet.productTab)
  .on( 'shopify:section:unload', pet.productTab)
  .on( 'shopify:section:load', pet.testimonial)
  .on( 'shopify:section:unload', pet.testimonial)
  .on( 'shopify:section:load', pet.lookbookSlideshow)
  .on( 'shopify:section:load', pet.lookbookSlideshow)
  .on( 'shopify:section:load', pet.countdown)
  .on( 'shopify:section:load', pet.countdown)


})(jQuery);