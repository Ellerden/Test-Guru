# frozen_string_literal: true

class ParticipationsController < ApplicationController

  before_action :set_participation, only: %i[show update result]

  # это не работает! пофиксить
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

  def set_participation
    @participation = Participation.find(params[:id])
    @test = @participation.test
  end
end
