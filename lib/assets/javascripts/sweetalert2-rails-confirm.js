var sweetAlertConfirmConfig = sweetAlertConfirmConfig || {};

(function($) {
  var sweetAlertConfirm = function(event) {
    var swalOptions = {
      title: sweetAlertConfirmConfig.title || 'Are you sure?',
      type: sweetAlertConfirmConfig.type || 'warning',
      showCancelButton: sweetAlertConfirmConfig.showCancelButton || true,
      confirmButtonText: sweetAlertConfirmConfig.confirmButtonText || "Ok",
      cancelButtonText: sweetAlertConfirmConfig.cancelButtonText || "Cancel",
      confirmButtonClass: sweetAlertConfirmConfig.confirmButtonClass || null,
      cancelButtonClass: sweetAlertConfirmConfig.cancelButtonClass || null,
      buttonsStyling: sweetAlertConfirmConfig.buttonsStyling || true
    }

    if (sweetAlertConfirmConfig.confirmButtonColor !== null) {
      swalOptions.confirmButtonColor = sweetAlertConfirmConfig.confirmButtonColor
    }

    $linkToVerify = $(this)
    var optionKeys = [
      'confirm',
      'text',
      'sweetAlertType',
      'showCancelButton',
      'confirmButtonColor',
      'cancelButtonColor',
      'confirmButtonText',
      'cancelButtonText',
      'confirmButtonClass',
      'cancelButtonClass',
      'closeOnConfirm',
      'buttonsStyling',
      'html',
      'imageUrl',
      'allowOutsideClick',
      'allowEscapeKey',
      'customClass',
      'remote',
      'method',
      'function'
    ];

    function afterAlertCallback(r) {
      if (nameFunction) {
        window[nameFunction]();
      }

      if (swalOptions['remote'] === true) {
        if (r === false) {
          return false;
        } else {
          $.rails.handleRemote($linkToVerify)
        }
      }

      else if(swalOptions['method'] !== undefined) {
        if (r === false) {
          return false;
        } else {
          $.rails.handleMethod($linkToVerify);
        }
      }

      else {
        if (r === false) {
          return false;
        } else {
          if($linkToVerify.attr('type') == 'submit'){
            var name = $linkToVerify.attr('name'),
            data = name ? {name: name, value:$linkToVerify.val()} : null;
            $linkToVerify.closest('form').data('ujs:submit-button', data);
            $linkToVerify.closest('form').submit();
          }
          else {
            window.location.href = $linkToVerify.attr('href');
          }
        }
      }
    }

    var beforeFunction = $linkToVerify.data('swal-before-function');

    // Skip alert if data-swal-alert-enabled evaluates to true
    if(beforeFunction != null) {
      var beforeRes = window[beforeFunction]($linkToVerify);
      if(beforeRes === true) {
        return afterAlertCallback(true); // Skip alert
      }
    }

    $.each($linkToVerify.data(), function(key, val){
      if ($.inArray(key, optionKeys) >= 0) {
        swalOptions[key] = val
        if (key == 'sweetAlertType') {
          swalOptions['type'] = val;
        }
      }
    });

    var nameFunction = swalOptions['function'];
    message = $linkToVerify.attr('data-swal-confirm')
    swalOptions['title'] = message
    swal(swalOptions, afterAlertCallback);
    return false;
  }

  $(document).on('ready turbolinks:load page:update ajaxComplete', function() {
    $('[data-swal-confirm]').on('click', sweetAlertConfirm)
  });

  $(document).on('ready turbolinks:load page:load', function() {
    //To avoid "Uncaught TypeError: Cannot read property 'querySelector' of null" on turbolinks
    if (typeof window.sweetAlertInitialize === 'function') {
      window.sweetAlertInitialize();
    }
  });
})($);
