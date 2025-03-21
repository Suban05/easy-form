# frozen_string_literal: true

module EasyForm
  module Inputs
    # Text input
    class TextInput < BaseInput
      TAG_NAME = :textarea

      def to_h
        super(cols: attributes[:cols] || 20, rows: attributes[:rows] || 40).except(:as)
      end
    end
  end
end
