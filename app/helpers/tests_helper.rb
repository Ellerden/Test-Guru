# frozen_string_literal: true

module TestsHelper
  def test_header(test)
    content_tag(:h1, test.persisted? ? t('.edit_test', title: test.title) : t('.new_test'))
  end
end
