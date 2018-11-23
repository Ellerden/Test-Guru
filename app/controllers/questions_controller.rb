# frozen_string_literal: true

class QuestionsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: %i[new create]
  before_action :find_question, only: %i[destroy show edit update]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  # /tests/:test_id/questions/new(.:format)
  def new
    @question = @test.questions.build
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      redirect_to @test
    else
      render :new
    end
  end

  # /questions/:id(.:format)
  def destroy
    @question.destroy
    render tests_path
  end

  # /questions/:id(.:format)
  def show; end

  # /questions/:id(.:format)/edit
  def edit; end

  # аптейтит только текст вопроса, чтобы апдейтить и привязку к конкретному тесту,
  # нужно менять пермиты в question_params
  def update
    if @question.update(question_params)
      redirect_to Test.find(@question.test_id)
    else
      render :new
    end
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def question_params
    params.require(:question).permit(:text)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
