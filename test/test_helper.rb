# frozen_string_literal: true

$LOAD_PATH.unshift File.expand_path('../lib', __dir__)
require 'easy_form'
require 'yaml'
require 'minitest/autorun'
require 'rubocop-minitest'
require 'rubocop-rake'

def load_fixture(name)
  YAML.load_file("./test/fixtures/#{name}.yml")[name.to_s]
end
