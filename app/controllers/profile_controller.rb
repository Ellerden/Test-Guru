# frozen_string_literal: true

class ProfileController < ApplicationController
  def show
    @profile = current_user
  end
end
