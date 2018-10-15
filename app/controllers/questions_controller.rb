class QuestionsController < ApplicationController
  before_action :find_test

  # /tests/:test_id/questions/new(.:format)
  def new
  end

   #result = ["class: #{params.class}, params: #{params.inspect}"]
   # render plain: result.join("\n")

  def destroy
  end

  # /questions/:id(.:format)
  def show
    render plain: @question.text
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
end
