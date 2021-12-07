class TestsController < ApplicationController
  before_action :find_test, only: [:show, :start]

  def index
    @tests = Test.all
  end

  def show; end

  def start
    @user = User.first
    @user.tests.push(@test)
    redirect_to @user.result(@test)
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end
end
