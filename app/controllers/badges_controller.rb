class BadgesController < ApplicationController
  def index
    @badges = current_user.badges
    @all_badges = Badge.all
    @not_rewarded_badges = @all_badges - @badges
  end
end