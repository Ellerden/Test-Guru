# frozen_string_literal: true

class ParticipationsController < ApplicationController
  before_action :find_participation, only: %i[show update result gist]
  before_action :set_test, only: %i[show update result]

  def show
  end

  def result
  end

  def gist
    result = GistQuestionService.new(@participation.current_question).call
    rescue Octokit::Error
      redirect_to @participation, alert: t('.fail')
    else
      current_user.gists.create(question: @participation.current_question,
                                gist_url: result.html_url)

    redirect_to @participation, notice: t('.success', url: result.html_url)
  end

  def update
    @participation.accept!(params[:answer_ids])
    if @participation.completed?
      TestsMailer.completed_test(@participation).deliver_now
      redirect_to result_participation_path(@participation)
    else
      render :show
    end
  end

  private

  def find_participation
    @participation = Participation.find(params[:id])
  end

  def set_test
    @test = @participation.test
  end
end
