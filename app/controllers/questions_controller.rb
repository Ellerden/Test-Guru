class QuestionsController < ApplicationController
  before_action :find_test, only: %i[index pluck new create show]
  before_action :find_question, only: %i[pluck destroy show]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  # /tests/:test_id/questions/new(.:format)
  def new
   @question = @test.questions.build
  end

  def create
    @question = @test.questions.build(question_params)
    if @question.save
      render plain: @question.inspect
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
    if @question.test_id == @test.id
      render plain: @question.text
    else
      render plain: 'Этот вопрос не относится к выбранному тесту'
    end
  end

 # /tests/:test_id/questions
  def index
    questions = @test.questions
    result = []
    questions.map { |quest| result << "#{quest.id} - #{quest.text}" }
    render plain: result
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
