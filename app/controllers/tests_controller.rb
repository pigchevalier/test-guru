class TestsController < ApplicationController
  before_action :find_test, only: [:show]

  def index
    @tests = Test.all
  end

  def show
    redirect_to test_questions_path(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
