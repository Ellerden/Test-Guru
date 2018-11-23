# frozen_string_literal: true

class ParticipationsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_participation, only: %i[show update result]
  before_action :set_test, only: %i[show update result]

  def show
  end

  def result
  end

  def update
    @participation.accept!(params[:answer_ids])
    if @participation.completed?
      redirect_to result_participation_path(@participation)
    else
      render :show
    end
  end

  private

  def find_participation
    @participation = Participation.find(params[:id])
  end

  def set_test
    @test = @participation.test
  end
end
