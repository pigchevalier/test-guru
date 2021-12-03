class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create]
  before_action :find_question, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.all.inspect
  end

  def show; end

  def new; end

  def create
    @question = @test.questions.build(params.require(:question).permit(:text))
    if @question.save
      redirect_to @question
    else
      render :new
    end
  end

  def destroy
    @question.destroy
    #redirect_to @question.test перенаправит на /test/test_id
    #но он не определен и хочется перенаправить на /test/test_id/questions
    #а использовать redirect_to @question.test.questions нельзя тк невозможно перенаправить to_model
    #поэтому использую здесь именно путь
    redirect_to test_questions_path(@question.test)
  end

  private

  def find_test
    @test = Test.find(params[:test_id])
  end

  def find_question
    @question = Question.find(params[:id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end

end
