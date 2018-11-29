# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :find_question, only: %i[show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  # /questions/:id(.:format)
  def show; end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
