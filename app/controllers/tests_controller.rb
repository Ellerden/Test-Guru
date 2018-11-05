# frozen_string_literal: true

class TestsController < ApplicationController
  before_action :find_test, except: [:index]

  def index
    @tests = Test.all
  end

  def show; end

  private

  def find_test
    @test = Test.find(params[:id])
    @questions = @test.questions
  end
end
