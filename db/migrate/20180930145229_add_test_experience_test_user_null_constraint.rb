class AddTestExperienceTestUserNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:test_experiences, :user_id, false)
    change_column_null(:test_experiences, :test_id, false)
  end
end
