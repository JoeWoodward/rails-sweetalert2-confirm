require 'sweetalert2-rails-confirm/view_helpers'
module SweetAlert2RailsConfirm
  class Railtie < Rails::Railtie
    initializer 'sweet_alert_confirm.view_helpers' do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
