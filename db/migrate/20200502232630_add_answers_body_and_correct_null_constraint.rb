class AddAnswersBodyAndCorrectNullConstraint < ActiveRecord::Migration[6.0]
  def change
    change_column_null(:answers, :body, false)
    change_column_null(:answers, :correct, false)
  end
end
