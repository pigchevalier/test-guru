module QuestionsHelper
  def question_header(question, test)
    question.persisted? ? "Edit #{question.test.title} Question" : "Create New #{test.title} Question"
  end
end
