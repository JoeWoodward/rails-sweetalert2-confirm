module SweetAlert2RailsConfirm
  module ViewHelpers
    def link_to(*args, &block)
      options = args[block_given? ? 1 : 2] || {}
      options = replace_confirm_with_swal(options)
      super(*args, &block)
    end

    def submit_tag(value = 'Save changes', options = {})
      options = replace_confirm_with_swal(options)
      super value, options
    end

    def button_tag(*args, &block)
      options = args[block_given? ? 0 : 1] || {}
      options = replace_confirm_with_swal(options)
      super(*args, &block)
    end

    protected

    def replace_confirm_with_swal(options)
      if options_has_confirm?(options)
        options['data-swal-confirm'] =
          options.delete(:confirm) || options[:data].delete(:confirm)
      end
      options
    end

    def options_has_confirm?(options)
      (options[:confirm] || options[:data].try(:[], :confirm)).present?
    end
  end
end
