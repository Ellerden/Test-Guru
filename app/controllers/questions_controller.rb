class QuestionsController < ApplicationController
  before_action :find_test, except: [:show, :create, :destroy]
  before_action :find_question, only: %i[pluck destroy show]
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  # /tests/:test_id/questions/new(.:format)
  def new
  end

  def create
    @new_question = Question.create(question_params)
    render plain: @new_question.inspect
  end

  def destroy
    @question.destroy
    render plain: 'Вопрос успешно удален'
  end

  # /questions/:id(.:format)
  def show
  end

  def pluck
    result = []
    @question.map { |q| render plain: q.text }
  end

 # /tests/:test_id/questions
  def index
    questions = @test.questions
    result = []
    questions.each do |quest|
      result << quest.text
    end
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
    params.require(:question).permit(:text, :test_id)
  end

  def rescue_with_question_not_found
    render plain: 'Вопрос не найден'
  end
end
