class GistQuestionService

  def initialize(question, client: nil)
    @question = question 
    @test = @question.test 
    @client = client || Octokit::Client.new(:access_token => Rails.application.credentials.access_token)
  end

  def call
    @client.create_gist(gist_params)

    @client.last_response
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
    content = [@question.text]
    content += @question.answers.pluck(:text)
    content.join("\n")

  end

end