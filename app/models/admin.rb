class Admin < User
  validate :validate_admin_rights

  private

  def validate_admin_rigths
    redirect_to root_path, alert: 'У вас нет прав для просмотра этой страницы' unless current_user.is_a?(Admin)
  end
end
