# frozen_string_literal: true

module EasyForm
  # HTML renderer
  class HtmlRenderer
    def initialize(form)
      @form = form
    end

    def render
      Tag.build('form', @form.options) do
        @form.items.map { |item| build_tag(item) }.join
      end
    end

    private

    def build_tag(item)
      if Tag.unpaired?(item.type.to_s)
        Tag.build(item.type, item.options)
      else
        Tag.build(item.type, item.options.except(:value)) { item.options[:value] }
      end
    end
  end
end
