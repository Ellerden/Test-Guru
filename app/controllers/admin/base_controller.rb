# frozen_string_literal: true

class Admin::BaseController < ApplicationController
  layout 'admin'
  before_action :admin_required!

  private

  def admin_required!
    redirect_to root_url, alert: t('.no_rights') unless current_user.admin_rights?
  end
end
