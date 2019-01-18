# frozen_string_literal: true

class CreateUserBadges < ActiveRecord::Migration[5.2]
  def change
    create_table :user_badges do |t|
      t.references :user, :badge, foreign_key: true, null: false

      t.timestamps
    end
  end
end
