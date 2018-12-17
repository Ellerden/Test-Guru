# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :find_test, only: %i[start]
  before_action :set_questions, only: %i[start]
  before_action :set_tests, only: %i[index table]

  def index
  end

  def table
  end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.participation(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def set_questions
    @questions = @test.questions
  end

  def set_tests
    @tests = Test.all
  end
end
