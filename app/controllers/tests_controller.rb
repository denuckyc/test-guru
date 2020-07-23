class TestsController < ApplicationController
  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_question_not_found
  before_action :set_test, only: %i[start show]
  def index
    @tests = Test.all
  end

  def show
    @questions = @test.questions
  end

  def start
    @user = User.first
    @user.tests.push(@test)
    redirect_to @user.test_passage(@test)
  end

  private

  def set_test
    @test = Test.find(params[:id])
  end
end
