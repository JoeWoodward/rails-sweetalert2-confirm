Rails SweetAlert2 Confirmations
---

An awesome [SweetAlert2](https://github.com/limonte/sweetalert2)
replacement for Rails' confirmation dialogs.

[See SweetAlert2 in action!](https://limonte.github.io/sweetalert2/)

<img src="https://raw.github.com/limonte/sweetalert2/master/sweetalert2.gif" width="686">

Installation
---

```ruby
# Gemfile

gem 'rails-sweetalert2-confirm'
gem 'rails-assets-sweetalert2', source 'https://rails-assets.org'
```

```javascript
// app/assets/javascripts/application.js

//= require sweetalert2
//= require sweetalert2-rails-confirm
```

```css
/* app/assets/stylesheets/application.css

 *= require sweetalert2
 */
```

Requirements
---

**Rails 4+**

Previous versions may be supported but are untested, use at your own risk!

Usage
---

**Basic Setup**
___
Simply implement the `link_to` with a `data: { confirm: 'message' }` as you normally would
```ruby
link_to('Another page', another_page_path, data: { confirm: 'Are you sure you want to leave this page?' })
```

**Remote Setup**
___
Simply implement the `link_to` with a `data: { confirm: 'message' }` and `remote: true` as you normally would
```ruby
link_to('Another page', another_page_path, remote: true, data: { confirm: 'Are you sure you want to leave this page?' })
```

**Setting Default SweetAlert2 Options**
___
You can define the default sweet alert options globally by creating a js
object named `sweetAlertConfirmDefaults`.

```javascript
var sweetAlertConfirmDefaults = {
  title: 'Are you sure?',
  type: 'warning',
  showCancelButton: true,
  confirmButtonText: "I'm sure"
  confirmButtonClass: 'btn btn-danger'
  cancelButtonClass: 'btn btn-default',
};
```
| Argument              | Default value        | Description |
| --------------------- | -------------------- | ----------- |
| `sweetSelector`       | `"[data-swal]"`      | The selector that railsSweetAlert2Confirm will look for to hijack the confirms. **This needs to be set before you import rails_sweetalert2_confirm.js** |
| `remote`              | `false`              | Submit the link_to or form via rails' default remote implementation |
| `afterComfirm`        | N/A                  | Define a function to run after the user clicks the confirm button |
| `afterDismiss`        | N/A                  | Define a function to run after the user dismisses the modal. Passes dismiss `function(dismiss)` in as a param, value of **dismiss** can be `'cancel'`, `'overlay'`, `'close'`, `'timer'` |
| `title`               | N/A                  | The title of the modal. It can either be added to the object under the key "title" or passed as the first parameter of the function. |
| `text`                | N/A                  | A description for the modal. It can either be added to the object under the key "text" or passed as the second parameter of the function. |
| `html`                | N/A                  | A HTML description for the modal. If `text` and `html` parameters are provided in the same time, "text" will be used. |
| `type `               | N/A                  | The type of the modal. SweetAlert2 comes with [5 built-in types](#modal-types) which will show a corresponding icon animation: `warning`, `error`, `success`, `info` and `question`. It can either be put in the array under the key `type` or passed as the third parameter of the function. |
| `customClass`         | N/A                  | A custom CSS class for the modal. |
| `animation`           | `true`               | If set to `false`, modal CSS animation will be disabled. |
| `allowOutsideClick`   | `true`               | If set to `false`, the user can't dismiss the modal by clicking outside it. |
| `allowEscapeKey`      | `true`               | If set to `false`, the user can't dismiss the modal by pressing the Escape key. |
| `showConfirmButton`   | `true`               | If set to `false`, a "Confirm"-button will not be shown. It can be useful when you're using `html` parameter for custom HTML description. |
| `showCancelButton`    | `false`              | If set to `true`, a "Cancel"-button will be shown, which the user can click on to dismiss the modal. |
| `confirmButtonText`   | `"OK"`               | Use this to change the text on the "Confirm"-button. |
| `cancelButtonText`    | `"Cancel"`           | Use this to change the text on the "Cancel"-button. |
| `confirmButtonColor`  | `"#3085d6"`          | Use this to change the background color of the "Confirm"-button (must be a HEX value). |
| `cancelButtonColor`   | `"#aaa"`             | Use this to change the background color of the "Cancel"-button (must be a HEX value). |
| `confirmButtonClass`  | N/A                  | A custom CSS class for the "Confirm"-button. |
| `cancelButtonClass`   | N/A               | A custom CSS class for the "Cancel"-button. |
| `buttonsStyling`      | `true`               | Apply default swal2 styling to buttons. If you want to use your own classes (e.g. Bootstrap classes) set this parameter to `false`. |
| `reverseButtons`      | `false`              | Set to `true` if you want to invert default buttons positions. |
| `showCloseButton`     | `false`              | Set to `true` to show close button in top right corner of the modal. |
| `showLoaderOnConfirm` | `false`              | Set to `true` to disable buttons and show that something is loading. Useful for AJAX requests. |
| `preConfirm`          | N/A                  | Function to execute before confirm, should return Promise, see <a href="https://limonte.github.io/sweetalert2/#ajax-request">usage example</a>. |
| `imageUrl`            | N/A                  | Add a customized icon for the modal. Should contain a string with the path or URL to the image. |
| `imageWidth`          | N/A                  | If imageUrl is set, you can specify imageWidth to describes image width in px. |
| `imageHeight`         | N/A                  | Custom image height in px. |
| `imageClass`          | N/A                  | A custom CSS class for the customized icon. |
| `timer`               | N/A                  | Auto close timer of the modal. Set in ms (milliseconds). |
| `width`               | `500`                | Modal window width, including paddings (`box-sizing: border-box`). |
| `padding`             | `20`                 | Modal window padding. |
| `background`          | `"#fff"`             | Modal window background (CSS `background` property). |
| `input`               | N/A                  | Input field type, can be `"text"`, `"email"`, `"password"`, `"textarea"`, `"select"`, `"radio"`, `"checkbox"` and `"file"`. |
| `inputPlaceholder`    | N/A                  | Input field placeholder. |
| `inputValue`          | N/A                  | Input field initial value. |
| `inputOptions`        | N/A                  | If `input` parameter is set to `"select"` or `"radio"`, you can provide options. Object keys will represent options values, object values will represent options text values. |
| `inputAutoTrim`       | `true`               | Automatically remove whitespaces from both ends of a result string. Set this parameter to `false` to disable auto-trimming. |
| `inputValidator`      | N/A                  | Validator for input field, should return Promise, see <a href="https://limonte.github.io/sweetalert2/#select-box">usage example</a>. |
| `inputClass`          | N/A               | A custom CSS class for the input field. |
| `onOpen`              | N/A               | Function to run when modal opens, provides modal DOM element as first param. |
| `onClose`             | N/A               | Function to run when modal closes, provides modal DOM element as first param. |
**N/A** means that the value isn't submitted unless defined

Please refer to the [SweetAlert2 Documentation](https://limonte.github.io/sweetalert2/) for the correct values

**NOTE**: If you would like to assign a different sweetSelector then
please create the **sweetAlertConfirmDefaults** object **before** you import
**rails_sweetalert2_confirm.js**
```javascript
// rails_sweetalert2_confirm_defaults.js
var sweetAlertConfirmDefaults = {
  sweetSelector: ".sweetalert2_confirm"
}

// application.js
//= require sweetalert2
//= require rails_sweetalert2_confirm_defaults
//= require rails_sweetalert2_confirm
```
**Setting SweetAlert2 Options Per Link**
___
You can define the default sweet alert options per link_to (or
submit/button tag) by defining them on data: { swal: {} } as a json
object.
**These will override the default options**

```ruby
link_to(
  'Custom page',
  custom_page_path,
  data: {
    confirm: 'Is this what you want?',
    swal: {
      text: "I'm a subtitle",
      type: 'question',
      confirm_button_class: 'btn btn-default'
    }
  }
)
```
| Argument              | Default value        | Description |
| --------------------- | -------------------- | ----------- |
| `remote`              | `false`              | Submit the link_to or form via rails' default remote implementation |
| `after_comfirm`        | N/A                  | Define a function to run after the user clicks the confirm button |
| `after_dismiss`        | N/A                  | Define a function to run after the user dismisses the modal. Passes dismiss `function(dismiss)` in as a param, value of **dismiss** can be `'cancel'`, `'overlay'`, `'close'`, `'timer'` |
| `title`               | N/A                  | The title of the modal. It can either be added to the object under the key "title" or passed as the first parameter of the function. |
| `text`                | N/A                  | A description for the modal. It can either be added to the object under the key "text" or passed as the second parameter of the function. |
| `html`                | N/A                  | A HTML description for the modal. If `text` and `html` parameters are provided in the same time, "text" will be used. |
| `type `               | N/A                  | The type of the modal. SweetAlert2 comes with [5 built-in types](#modal-types) which will show a corresponding icon animation: `warning`, `error`, `success`, `info` and `question`. It can either be put in the array under the key `type` or passed as the third parameter of the function. |
| `custom_class`         | N/A                  | A custom CSS class for the modal. |
| `animation`           | `true`               | If set to `false`, modal CSS animation will be disabled. |
| `allow_outside_click`   | `true`               | If set to `false`, the user can't dismiss the modal by clicking outside it. |
| `allow_escape_key`      | `true`               | If set to `false`, the user can't dismiss the modal by pressing the Escape key. |
| `show_confirm_button`   | `true`               | If set to `false`, a "Confirm"-button will not be shown. It can be useful when you're using `html` parameter for custom HTML description. |
| `show_cancel_button`    | `false`              | If set to `true`, a "Cancel"-button will be shown, which the user can click on to dismiss the modal. |
| `confirm_button_text`   | `"OK"`               | Use this to change the text on the "Confirm"-button. |
| `cancel_button_text`    | `"Cancel"`           | Use this to change the text on the "Cancel"-button. |
| `confirm_button_color`  | `"#3085d6"`          | Use this to change the background color of the "Confirm"-button (must be a HEX value). |
| `cancel_button_color`   | `"#aaa"`             | Use this to change the background color of the "Cancel"-button (must be a HEX value). |
| `confirm_button_class`  | N/A                  | A custom CSS class for the "Confirm"-button. |
| `cancel_button_class`   | N/A               | A custom CSS class for the "Cancel"-button. |
| `buttons_styling`      | `true`               | Apply default swal2 styling to buttons. If you want to use your own classes (e.g. Bootstrap classes) set this parameter to `false`. |
| `reverse_buttons`      | `false`              | Set to `true` if you want to invert default buttons positions. |
| `show_close_button`     | `false`              | Set to `true` to show close button in top right corner of the modal. |
| `show_loader_on_confirm` | `false`              | Set to `true` to disable buttons and show that something is loading. Useful for AJAX requests. |
| `pre_confirm`          | N/A                  | Function to execute before confirm, should return Promise, see <a href="https://limonte.github.io/sweetalert2/#ajax-request">usage example</a>. |
| `image_url`            | N/A                  | Add a customized icon for the modal. Should contain a string with the path or URL to the image. |
| `image_width`          | N/A                  | If image_url is set, you can specify image_width to describes image width in px. |
| `image_height`         | N/A                  | Custom image height in px. |
| `image_class`          | N/A                  | A custom CSS class for the customized icon. |
| `timer`               | N/A                  | Auto close timer of the modal. Set in ms (milliseconds). |
| `width`               | `500`                | Modal window width, including paddings (`box-sizing: border-box`). |
| `padding`             | `20`                 | Modal window padding. |
| `background`          | `"#fff"`             | Modal window background (CSS `background` property). |
| `input`               | N/A                  | Input field type, can be `"text"`, `"email"`, `"password"`, `"textarea"`, `"select"`, `"radio"`, `"checkbox"` and `"file"`. |
| `input_placeholder`    | N/A                  | Input field placeholder. |
| `input_value`          | N/A                  | Input field initial value. |
| `input_options`        | N/A                  | If `input` parameter is set to `"select"` or `"radio"`, you can provide options. Object keys will represent options values, object values will represent options text values. |
| `input_auto_trim`       | `true`               | Automatically remove whitespaces from both ends of a result string. Set this parameter to `false` to disable auto-trimming. |
| `input_validator`      | N/A                  | Validator for input field, should return Promise, see <a href="https://limonte.github.io/sweetalert2/#select-box">usage example</a>. |
| `input_class`          | N/A               | A custom CSS class for the input field. |
| `on_open`              | N/A               | Function to run when modal opens, provides modal DOM element as first param. |
| `on_close`             | N/A               | Function to run when modal closes, provides modal DOM element as first param. |
**N/A** means that the value isn't submitted unless defined

Please refer to the [SweetAlert2 Documentation](https://limonte.github.io/sweetalert2/) for the correct values


Modal Types
-----------

| `success`                                                                       | `error`                                                                       | `warning`                                                                       | `info`                                                                       | `question`                                                                       |
| ------------------------------------------------------------------------------- | ----------------------------------------------------------------------------- | ------------------------------------------------------------------------------- | ---------------------------------------------------------------------------- | -------------------------------------------------------------------------------- |
| ![](https://raw.github.com/limonte/sweetalert2/master/images/swal2-success.png) | ![](https://raw.github.com/limonte/sweetalert2/master/images/swal2-error.png) | ![](https://raw.github.com/limonte/sweetalert2/master/images/swal2-warning.png) | ![](https://raw.github.com/limonte/sweetalert2/master/images/swal2-info.png) | ![](https://raw.github.com/limonte/sweetalert2/master/images/swal2-question.png) |

Browser compatibility
---------------------

SweetAlert2 works in most major browsers (yes, even IE). Some details:

- **IE: 10+**, Promise polyfill should be included (see [SweetAlert2 usage example](https://github.com/limonte/sweetalert2/blob/master/README.md#usage)).
- **Microsoft Edge: 12+**
- **Safari: 4+**
- **Firefox: 4+**
- **Chrome 14+**
- **Opera: 15+**
