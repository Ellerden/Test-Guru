# frozen_string_literal: true

class AnswersController < ApplicationController
  before_action :find_answer, only: %i[show]

  # /answers/
  def index
    @answers = Answer.all
  end

 # /answers/id
  def show
  end

  private

  def find_answer
    @answer = Answer.find(params[:id])
  end
end
