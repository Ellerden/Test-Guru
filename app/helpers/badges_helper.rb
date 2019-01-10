# frozen_string_literal: true

module BadgesHelper
  def badges_header(badge)
    content_tag(:h1, badge.persisted? ? t('.edit_badge') : t('.new_badge'))
  end
end
