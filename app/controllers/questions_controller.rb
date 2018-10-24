class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index new create]
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
      render plain: 'Вопрос создать не удалось'
    end
  end

  # /questions/:id(.:format)
  def destroy
    @question.destroy
    render plain: 'Вопрос успешно удален'
  end

  # /questions/:id(.:format)
  def show
  end

 # ТУТ ВОТ ЧТО_ТО НЕ РАБОТАЕТ
  # /questions/:id(.:format)/edit
  def edit
  end

  def update
    if @question.update(question_params)
      redirect_to Test.find(@question.test_id)
    else
      render plain: 'Вопрос создать не удалось'
    end
  end

 # /tests/:test_id/questions
  def index
    @questions = @test.questions
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
