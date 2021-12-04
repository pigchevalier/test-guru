module QuestionsHelper
  def question_header
    @question.id ? "Edit #{@question.test.title} Question" : "Create New #{@test.title} Question"
  end
end
