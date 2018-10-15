class TestsController < ApplicationController
  before_action :find_test, except: [:index]

  def index
    @tests = Test.all
    result = ["#{@tests.inspect}"]
    render plain: result.join("\n")
  end

  def show
  end

  private

  def find_test
    @test = Test.find(params[:id])
    @questions = @test.questions
  end
end
