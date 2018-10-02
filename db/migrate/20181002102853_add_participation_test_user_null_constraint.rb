class AddParticipationTestUserNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:participations, :user_id, false)
    change_column_null(:participations, :test_id, false)
  end
end
