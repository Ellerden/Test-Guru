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

    flash_options = if result.success?
      current_user.gists.create(question: @participation.current_question,
                                gist_hash: result.gist_hash,
                                gist_url: result.gist_url)

      { notice: t('.success', url: result.gist_url) }
    else
      { alert: t('.fail') }
    end

    redirect_to @participation, flash_options
  end

  def update
    @participation.accept!(params[:answer_ids])
    if @participation.completed?
<<<<<<< HEAD
=======
      awards = BadgesRewardService.new(@participation).call

      if awards.present?
        current_user.badges << awards
        flash[:notice] = t('.new_awards', url: badges_url)
      end

>>>>>>> badgestasks
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
