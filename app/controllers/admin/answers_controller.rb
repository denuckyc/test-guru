class Admin::AnswersController < Admin::BaseController

  before_action :find_question, only: %i[index create new]
  before_action :find_answer, only: %i[show edit update destroy]

  def new
    @answer = Answer.new
  end

  def index
    @answers = @question.answers
  end

  def create
    @answer = @question.answers.new(answer_params)

    if @answer.save
      redirect_to admin_question_answers_path(@question)
    else
      render :new
    end
  end

  def edit
  end

  def update
    @answer.update(answer_params)

    if @answer.save
      redirect_to admin_question_answers_path(@answer.question)
    else
      render :edit
    end
  end

  def destroy
    @answer.destroy
    redirect_to admin_question_answers_path(@answer.question.id)
  end

  private

  def find_question
    @question = Question.find(params[:question_id])
  end

  def find_answer
    @answer = Answer.find(params[:id])
  end

  def answer_params
    params.require(:answer).permit(:body, :correct)
  end
end
