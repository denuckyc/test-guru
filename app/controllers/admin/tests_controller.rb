class Admin::TestsController < Admin::BaseController

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  before_action :set_test, only: %i[start show destroy edit]

  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def new
    @test = Test.new
  end

  def create
    @test = current_user.created_tests.new(test_params)

    if @test.save
      redirect_to admin_root_path
    else
      render :new
    end
  end

  def edit

  end

  def destroy
    @test.destroy
    redirect_to admin_root_path
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end

  def test_params
    params.require(:test).permit(:title, :category_id)
  end
end
