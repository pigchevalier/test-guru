class GistQuestionService

  GITHUB_ACCESS_TOKEN = Rails.application.credentials.github_access_token.freeze
  
  def initialize(question, client: default_client)
    @question = question 
    @test = @question.test 
    @client = client
  end

  def call
    @client.create_gist(gist_params)
    response = @client.last_response
    GistResult.new("#{response.data[:url]}","https://gist.github.com/#{response.data[:owner][:login]}/#{response.data[:id]}", response)
  end

  private

  def gist_params
    {
      #description: "A question about #{@test.title} from TestGuru",
      description: "#{I18n.t('.question_about')} #{@test.title} #{I18n.t('.from')}",
      files: {
        'test-guru-question.txt' => {
          content: gist_content
        }
      }
    }
  end

  def gist_content
    [@question.text, *@question.answers.pluck(:text)].join("\n")
  end

  def default_client
    Octokit::Client.new(access_token: GITHUB_ACCESS_TOKEN)
  end
end
