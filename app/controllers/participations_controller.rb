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
      current_user.gists.new(question: @participation.current_question,
                                gist_hash: result.gist_hash)
      redirect_to @participation, { notice: t('.success') }#  #link: link_to(result.gist_hash)).html_safe }
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
