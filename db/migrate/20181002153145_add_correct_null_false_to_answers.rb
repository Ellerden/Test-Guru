class AddCorrectNullFalseToAnswers < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:answers, :correct, null: false)
  end
end
