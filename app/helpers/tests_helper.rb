# frozen_string_literal: true

module TestsHelper
  def test_header(test)
    if test.persisted?
      "Edit #{test.title}"
    else
      'Create New Test'
    end
  end
end
