class SessionsController < ApplicationController
  skip_before_action :authenticate_user!

  def new
  end

  def create
    user = User.find_by(email: params[:email])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to session[:forwarding_url].present? ? session[:forwarding_url] : root_path
    else
      flash.now[:alert] = 'Вы уже пользователь? Тогда введите логин и пароль'
      render :new
    end
  end

  def destroy
    @current_user = nil
    session.delete(:user_id)
    redirect_to root_path
  end
end
