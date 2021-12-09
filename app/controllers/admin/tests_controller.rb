class Admin::TestsController < Admin::BaseController

  before_action :find_test, only: [:show, :edit, :destroy, :update]

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
    @test = current_user.created_tests.build(test_params)

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

  def test_params
    params.require(:test).permit(:title, :level, :category_id)
  end
end
