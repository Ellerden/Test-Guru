class CreateUserBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :user_badges do |t|
      t.references :user, :badge, foreign_key: true, null: false
      t.timestamps

      add_column :rules, :description, :string, null: false
      rename_column :rules, :condition, :params
      change_column_null :rules, :params, true
      add_index(:rules, [:name, :params], unique: true)
    end
  end
end
