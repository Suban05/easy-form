# frozen_string_literal: true

module EasyForm
  # Form builder
  class FormBuilder
    attr_reader :form

    def initialize(object, options = {})
      @object = object
      @options = options
      @form = Form.new(options)
    end

    def input(name, options = {})
      label(name, name.capitalize)
      append_input({ name:, value: @object.public_send(name.to_sym) }.merge(options))
    end

    def submit(value = 'Save', options = {})
      append_input({ type: :submit, value: }.merge(options))
    end

    def label(input_name, body)
      form.append_item(:label, { for: input_name, value: body })
    end

    private

    def append_input(options)
      input_class = input_class(options[:as])
      input = input_class.new(options)
      form.append_item(input_class::TAG_NAME, input.to_h)
    end

    def input_class(as)
      as ||= :string
      "EasyForm::Inputs::#{as.to_s.capitalize}Input".constantize
    end
  end
end
