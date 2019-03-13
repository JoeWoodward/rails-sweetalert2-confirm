# frozen_string_literal: true

module RailsSweetAlert2Confirm
  module ViewHelpers
    def link_to(*args, &block)
      options = args[block_given? ? 1 : 2] || {}
      options = merge_options_into_swal(options)
      super(*args, &block)
    end

    def submit_tag(value = 'Save changes', options = {})
      options = merge_options_into_swal(options)
      super value, options
    end

    def button_tag(*args, &block)
      options = args[block_given? ? 0 : 1] || {}
      options = merge_options_into_swal(options)
      super(*args, &block)
    end

    private def merge_options_into_swal(options)
      return options unless options_have_confirm?(options)
      options = configure_swal_options(options)
      options = merge_swal_remote_options(options)
      options = merge_swal_confirm_options(options)
    end

    private def configure_swal_options(options)
      options[:data] ||= {}
      options[:data][:swal] ||= {}
    end

    private def merge_swal_remote_options(options)
      return options unless options_have_remote?(options)
      options[:data][:swal][:remote] = fetch_option(:remote, options)
    end

    private def merge_swal_confirm_options(options)
      return options unless options_have_confirm?(options)
      options[:data][:swal][:title] = fetch_option(:confirm, options)
    end

    private def fetch_option(option, options)
      options.delete(option) || options[:data].delete(option)
    end

    private def options_have_confirm?(options)
      (options[:confirm] || options.dig(:data, :confirm)).present?
    end

    private def options_have_remote?(options)
      (options[:remote] || options.dig(:data, :remote)).present?
    end
  end
end
