class GistQuestionService
  attr_reader :gist

  def initialize(question, client: nil)
    @question = question
    @test = @question.test
    @client = client || Octokit::Client.new(access_token: ENV['GITHUB_TOKEN'])
  end

  def call
    @gist = @client.create_gist(gist_params)
  end

  def success?
    @gist.html_url.present?
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
