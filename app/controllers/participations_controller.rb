# frozen_string_literal: true


# добавить в participations current_question
# добавить в participations counter correct_questions


class ParticipationsController < ApplicationController

  before_action :set_participation, only: %i[show update result]

  def show
  end

  def result
  end

  def update
    @participation.accept(params[:answers_ids])
    render :show
  end

  private

  def set_participation
    @participation = participation.find(params[:id])
  end
end
