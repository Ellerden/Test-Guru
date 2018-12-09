# frozen_string_literal: true

module ApplicationHelper
  FLASH = { success: "alert-success", error: "alert-danger", alert: "alert-warning", notice: "alert-info" }.freeze

  def current_year
    Time.current.year
  end

  def github_url(author, repo)
    link_to 'GitHub', "https://github.com/#{author}/#{repo}", target: :blank
  end

  def alert_for(type)
    FLASH.fetch(type.to_sym, type.to_s)
  end
end
