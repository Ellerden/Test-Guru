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


    #  redirect_to @participation, notice: t('.success', url: result.html_url)
    redirect_to @participation, notice: t('.success', url: result.html_url)
    #  redirect_to @participation, { notice: t('.success'), flash: { gist_hash: result.gist_hash } }
     # redirect_to @participation, { notice: t('.success') }
    #respond_to do |format|
   #   format.html { redirect_to @participation, notice: "D: #{view_context.link_to 'g', result.gist_hash }".html_safe }
   # end

      #{view_context.link_to('reset it', result.gist_hash )}".html_safe
     # redirect_to @participation, notice: "Go to your #{view_context.link_to("profile page", result.gist_hash)}, and edit it!".html_safe

     # notice: t('.success', view_context.link_to(result.gist_hash))
      #redirect_to @participation
    #  flash[:notice] = "Go to your #{view_context.link_to("profile page", link_path)}, and edit it!".html_safe
     # redirect_to @participation, { notice: t('.success') }#  #link: link_to(result.gist_hash)).html_safe }
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
