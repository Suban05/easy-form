# frozen_string_literal: true

require 'active_support/inflector'
require_relative 'easy_form/version'

# Easy form
module EasyForm
  class Error < StandardError; end

  autoload(:Tag, 'easy_form/tag.rb')
  autoload(:FormItem, 'easy_form/form_item.rb')
  autoload(:Form, 'easy_form/form.rb')
  autoload(:FormBuilder, 'easy_form/form_builder.rb')
  autoload(:HtmlRenderer, 'easy_form/html_renderer.rb')
  autoload(:FormRenderer, 'easy_form/form_renderer.rb')
  autoload(:Inputs, 'easy_form/inputs')

  def self.form_for(object, options = {})
    form_builder = FormBuilder.new(object, options)
    yield(form_builder) if block_given?
    FormRenderer.new(:html, form_builder.form).render
  end
end
