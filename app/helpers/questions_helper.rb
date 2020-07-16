module QuestionsHelper
  def question_header(question)
    if question.new_record?
      "<h1>Создать новый вопрос по теме #{@test.title}</h1>".html_safe
    else
      "<h1>Редактировать #{@question.test.title} вопрос</h1>".html_safe
    end
  end
end
