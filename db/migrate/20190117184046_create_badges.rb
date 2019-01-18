# frozen_string_literal: true

class CreateBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :badges do |t|
      t.string :name, null: false
      t.string :image_path, null: false
      t.string :description, null: false
      t.string :rule_name, null: false
      t.string :rule_params

      t.timestamps
    end
  end
end
