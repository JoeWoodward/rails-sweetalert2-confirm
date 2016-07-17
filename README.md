sweetalert2-rails-confirm
=========================

A Rails confirm replacement with SweetAlert2

depends on `https://github.com/limonte/sweetalert2`

So you need to Install:
  `gem 'sweetalert2'`
  or
  `gem 'rails-assets-sweetalert2', source 'https://rails-assets.org'`

## Requirements
Rails >= 3.1

## Usage

Add it to your Gemfile:
```ruby
gem 'rails-assets-sweetalert2', source 'https://rails-assets.org'
gem 'sweetalert2-confirm'
```

Add the following to application.js:

```javascript
//= require sweetalert2
//= require sweetalert2-rails-confirm
```
Add the following to application.css:

```css
/*
 *= require sweetalert2
 */
```

### Custom options


You can pass options in `data:`
```Ruby
data: {
  confirm: 'Are you ready?',
  confirm_button_text: 'Im ready',
  cancel_button_text: 'No way',
  confirm_button_color: 'red',
  cancel_button_color: '#fff',
  confirm_button_class: 'btn btn_danger',
  cancel_button_class: 'btn btn_danger',
  sweet_alert_type: 'info',
  text: 'This is a subtitle',
  image_url: '/pic.png'
}
```

![Custom confirm](https://cloud.githubusercontent.com/assets/5833678/4653700/14389916-54b0-11e4-9850-14ee970e9345.png)

Default options that will be used application wide so it is not nessecary to set the option on each link. Put this object inside your app to override default options with `sweetAlertConfirmConfig` object.

```Javascript
var sweetAlertConfirmConfig = {
  title: 'Are you sure?',
  type: 'warning',
  showCancelButton: true,
  confirmButtonColor: '#DD6B55',
  confirmButtonText: 'Ok'
  confirmButtonClass: 'btn btn-danger'
};
```

### Before Callback

You can skip the alert by passing data-swal-alert-enabled (conditional function [return true or false])
- `true` (display alert)
- `false`(_not_ display alert)

`data-swal-alert-enabled='$('#confirmations_enabled').val()'`

## Contribute

Fork the repo & pull request you fix/feature

append `RAILS_VERSION=4.2` or whichever you target before your `bundle` command ex: `RAILS_VERSION=4.2 bundle install`

please add/modify test examples on fix or features
