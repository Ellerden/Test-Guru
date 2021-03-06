# frozen_string_literal: true

module ApplicationHelper
  FLASH = { success: 'success', error: 'danger', alert: 'warning', notice: 'info' }.freeze

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: :blank
  end

  def alert_for(type)
    "alert-#{FLASH.fetch(type.to_sym, type.to_s)}"
  end

  def show_header(object)
    name = object.class.to_s.downcase
    content_tag(:h1, object.persisted? ? t(".edit_#{name}") : t(".new_#{name}"))
  end
end
