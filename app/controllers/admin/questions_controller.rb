# frozen_string_literal: true

class Admin::QuestionsController < Admin::BaseController
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
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

  # /questions/:id(.:format)
  def destroy
    @question.destroy
    redirect_to admin_test_path(Test.find(@question.test_id))
  end

  # /questions/:id(.:format)
  def show; end

  # /questions/:id(.:format)/edit
  def edit; end

  # апдейтит только текст вопроса, чтобы апдейтить и привязку к конкретному тесту,
  # нужно менять пермиты в question_params
  def update
    if @question.update(question_params)
      redirect_to admin_test_path(Test.find(@question.test_id))
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
