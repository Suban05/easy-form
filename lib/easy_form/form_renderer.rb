# frozen_string_literal: true

require 'forwardable'

module EasyForm
  # Form renderer
  class FormRenderer
    extend Forwardable

    def initialize(type, form)
      @renderer = "EasyForm::#{type.capitalize}Renderer".constantize.new(form)
    end

    def_delegators :@renderer, :render
  end
end
