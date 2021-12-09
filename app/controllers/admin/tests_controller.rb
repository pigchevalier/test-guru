class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: [:show, :edit, :destroy, :update]
  before_action :find_category, only: [:create]

  def index
    @tests = Test.all
  end

  def show; end


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
      redirect_to admin_test_path(@test)
    else
      render :new
    end
  end

   def destroy
    @test.destroy
    redirect_to admin_tests_path
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
