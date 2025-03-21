# frozen_string_literal: true

require 'test_helper'

class TestEasyFormTag < Minitest::Test
  def test_builds_simple_unpaired_tag
    assert_equal('<br>', EasyForm::Tag.build('br'))
  end

  def test_builds_unpaired_tags_with_attributes
    assert_equal(
      '<img src="path/to/image">',
      EasyForm::Tag.build('img', src: 'path/to/image')
    )
    assert_equal(
      '<input type="submit" value="Save">',
      EasyForm::Tag.build('input', type: :submit, value: 'Save')
    )
  end

  def test_builds_simple_paired_tag
    assert_equal(
      '<label>Email</label>',
      EasyForm::Tag.build('label') { 'Email' }
    )
  end

  def test_builds_paired_tag_with_attributes
    assert_equal(
      '<label for="email">Email</label>',
      EasyForm::Tag.build('label', for: 'email') { 'Email' }
    )
    assert_equal(
      '<a href="https://google.com" class="nav-link">Section</a>',
      EasyForm::Tag.build('a', href: 'https://google.com', class: 'nav-link') { 'Section' }
    )
  end

  def test_builds_form
    assert_equal(
      '<form class="flex"><input type="submit" value="Save"></form>',
      EasyForm::Tag.build('form', class: 'flex') do
        EasyForm::Tag.build('input', type: :submit, value: 'Save')
      end
    )
  end

  def test_builds_paired_tag_with_attributes_without_block
    assert_equal(
      '<a href="https://google.com" class="nav-link"></a>',
      EasyForm::Tag.build('a', href: 'https://google.com', class: 'nav-link')
    )
  end

  def test_builds_empty_paired_tag
    assert_equal('<div></div>', EasyForm::Tag.build('div'))
  end
end
