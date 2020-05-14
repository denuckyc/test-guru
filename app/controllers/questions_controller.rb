class QuestionsController < ApplicationController

  before_action :find_question, only: [:show]
  before_action :find_test, only: [:index]

  rescue_from ActiveRecord::RecordNotFound, with: :rescue_with_qestion_not_found

  def index
    
  end

  def show
    
  end

  private

  def find_question
    @question = Question.find(params[:id])
  end

  def find_test
    @test = Test.find(params[:test_id])
    
    # @c = []
    # Question.where(test_id: params[:test_id]).find_each do |q|
    #   @c << q.body
    # end

    # @q = Question.all.where(test_id: params[:test_id])
  end

  def rescue_with_question_not_found
    render plain: 'Question was not found'
  end
end
