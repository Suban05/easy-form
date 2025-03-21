# frozen_string_literal: true

module EasyForm
  # Form
  class Form
    attr_reader :options, :items

    def initialize(options = {})
      action = options[:url] || '#'
      method = options[:method] || :post
      @options = { action:, method: }.merge(options.except(:url))
      @items = []
    end

    def append_item(type, options)
      item = FormItem.new(type, options)
      items << item
      item
    end
  end
end
