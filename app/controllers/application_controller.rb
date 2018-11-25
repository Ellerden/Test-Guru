# frozen_string_literal: true

class ApplicationController < ActionController::Base
  helper_method :current_user,
                :logged_in?

  before_action :authenticate_user!

  private

  def authenticate_user!
    session[:forwarding_url] = request.original_url if request.get? && current_user.nil?
    redirect_to login_path, alert: 'Вы уже пользователь? Введите логин и пароль' unless current_user
  end

  def current_user
    @current_user ||= User.find_by(id: session[:user_id]) if session[:user_id]
  end

  def logged_in?
    current_user.present?
  end
end
