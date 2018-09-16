class AddQuestionsTextNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:questions, :text, false)
  end
end
