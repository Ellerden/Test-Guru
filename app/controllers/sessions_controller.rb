class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by(username: params[:username])
    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      redirect_to tests_path
    else
      flash.now[:alert] = 'Вы уже пользователь? Тогда введите логин и пароль'
      render :new
    end
  end

  def destroy
    @current_user = session[:user_id] = nil
    redirect_to root_url
  end
end
