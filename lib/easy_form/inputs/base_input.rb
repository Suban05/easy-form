# frozen_string_literal: true

module EasyForm
  module Inputs
    # Base input
    class BaseInput
      attr_reader :attributes

      def initialize(attributes)
        @attributes = attributes
      end

      def to_h(defaults = {})
        base = attributes[:name] ? { name: attributes[:name] } : {}
        base.merge(defaults).merge(attributes)
      end
    end
  end
end
