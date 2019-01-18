# frozen_string_literal: true

class SessionsController < Devise::SessionsController
  def create
    super
    flash[:notice] = t('.greetings', full_name: current_user.full_name)
  end
end
