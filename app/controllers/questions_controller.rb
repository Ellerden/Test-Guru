class QuestionsController < ApplicationController
  before_action :find_test, except: [:show, :create]
  before_action :find_question, only: %i[pluck destroy]

  # /tests/:test_id/questions/new(.:format)
  def new
    @question = Question.new(test: @test)
  end

  def create

    #result = ["class: #{params.class}, params: #{params.inspect}"]
   # render plain: result.join("\n")
    @new_question = Question.create(question_params)
    render plain: @new_question.inspect
  end

   #result = ["class: #{params.class}, params: #{params.inspect}"]
   # render plain: result.join("\n")

  def destroy
    @question.destroy
    redirect_to index
  end

  # /questions/:id(.:format)
  def show
    render plain: @question.text
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
end
