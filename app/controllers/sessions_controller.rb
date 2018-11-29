class SessionsController < Devise::SessionsController
  after_action :say_greetings_flash, only: %i[create]

  def create
    super
  end

  private

  def say_greetings_flash
    flash[:notice] = "Привет, #{current_user.first_name} #{current_user.last_name}!"
  end
end
