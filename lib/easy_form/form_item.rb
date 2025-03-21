# frozen_string_literal: true

module EasyForm
  # Form item
  class FormItem
    attr_reader :type, :options

    def initialize(type, options)
      @type = type
      @options = options
    end
  end
end
