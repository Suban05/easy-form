# frozen_string_literal: true

module EasyForm
  module Inputs
    # String input
    class StringInput < BaseInput
      TAG_NAME = :input

      def to_h
        super(type: attributes[:type] || :text)
      end
    end
  end
end
