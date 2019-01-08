class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :route, null: false
      t.references :rule, foreign_key: true, null: false

      t.timestamps
    end
  end
end
