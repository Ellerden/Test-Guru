# frozen_string_literal: true

class GistQuestionService
  ResultGist = Struct.new(:success?, :gist_hash, :gist_url)

  def initialize(question, client: default_client)
    @question = question
    @test = @question.test
    @client = client
  end

  def call
    gist = @client.create_gist(gist_params)
    ResultGist.new(gist.html_url.present?, gist.id, gist.html_url)
  end

  def default_client
    Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end

  private

  def gist_params
    {
      description: I18n.t('services.gist_question_service.gist_description', test_title: @test.title),
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    content = [@question.text, *@question.answers.pluck(:text)].join("\n")
  end
end
