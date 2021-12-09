class TestsController < ApplicationController
  before_action :authenticate_user!
  before_action :find_test, only: [:show, :start, :edit, :destroy, :update]
  before_action :find_category, only: [:create]

  def index
    @tests = Test.all
  end

  def show; end

  def start
    current_user.tests.push(@test)
    redirect_to current_user.result(@test)
  end

  def new
    @test = Test.new
  end

  def edit; end

  def update
    if @test.update(test_params)
      redirect_to @test
    else
      render :edit
    end
  end

  def create
    @test = @category.tests.build(test_params)
    @test.author = current_user

    if @test.save
      redirect_to @test
    else
      render :new
    end
  end

   def destroy
    @test.destroy
    redirect_to tests_path
  end

  private

  def find_test
    @test = Test.find(params[:id])
  end

  def find_category
    @category = Category.find(params[:test][:category_id])
  end

  def test_params
    params.require(:test).permit(:title, :level)
  end
end
