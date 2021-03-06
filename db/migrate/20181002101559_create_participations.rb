# frozen_string_literal: true

class CreateParticipations < ActiveRecord::Migration[5.2]
  def change
    create_table :participations do |t|
      t.references :user, :test, foreign_key: true

      t.timestamps
    end
  end
end
