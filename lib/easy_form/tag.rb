# frozen_string_literal: true

module EasyForm
  # Tag
  class Tag
    UNPAIRED_TAGS = %w[
      !doctype area base br col embed hr img input
      keygen link meta param source track wbr
    ].freeze

    attr_accessor :name, :attr_line

    def self.build(name, attributes = {})
      tag = new(name.to_s, attributes)
      if unpaired?(tag.name)
        "<#{name}#{tag.attr_line}>"
      else
        body = ''
        body = yield if block_given?
        "<#{name}#{tag.attr_line}>#{body}</#{name}>"
      end
    end

    def self.unpaired?(tag_name)
      UNPAIRED_TAGS.include?(tag_name)
    end

    def initialize(name, attributes = {})
      @name = name
      @attr_line = build_attr_line(attributes)
    end

    private

    def build_attr_line(attributes)
      attr_pairs = attributes.any? ? [''] : []
      attributes.each do |key, value|
        attr_pairs << "#{key}=\"#{value}\""
      end
      attr_pairs.join(' ')
    end
  end
end
