class AddUsersEmailUniqueConstraint < ActiveRecord::Migration[5.2]
  def change
    add_index :users, :email, unique: true
    remove_column :users, :username
  end
end
