require 'rails_sweetalert2_confirm/view_helpers'
module RailsSweetAlert2Confirm
  class Railtie < Rails::Railtie
    initializer 'rails_sweetalert2_confirm.view_helpers' do
      ActionView::Base.send :include, ViewHelpers
    end
  end
end
