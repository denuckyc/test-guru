class QuestionsController < ApplicationController

  before_action :find_question, only: [:show, :destroy]
  before_action :find_test, only: [:index, :create, :new]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_qestion_not_found

  def index

  end

  def show

  end

  def new
    @question = Question.new
  end

  def create
    @question = @test.questions.create(question_params)
    if @question.save
      redirect_to @question
    else
      render plain: 'NOT OK'
    end
  end

  def destroy
    @question.destroy
    render plain: 'OK'
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
  end

  def question_params
    params.require(:question).permit(:body)
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
