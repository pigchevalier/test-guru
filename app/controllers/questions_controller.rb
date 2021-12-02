class QuestionsController < ApplicationController
  before_action :find_test, only: [:index, :create]
  before_action :find_question, only: [:show, :destroy]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found

  def index
    render plain: @test.questions.all.inspect
  end

  def show
    
  end

  def new

  end

  def create
    Question.create!(text: params.dig(:question, :text), test: @test)
    redirect_to test_questions_path
  end

  def destroy
    test_id = Question.find(params[:id]).test_id
    Question.find(params[:id]).destroy
    redirect_to test_questions_path(test_id: test_id)
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
