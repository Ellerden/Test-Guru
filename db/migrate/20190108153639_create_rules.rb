class CreateRules < ActiveRecord::Migration[5.2]
  def change
    create_table :rules do |t|
      t.string :name, null: false
      t.string :condition, null: false
    end
  end
end
