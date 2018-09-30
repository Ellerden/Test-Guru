class CreateTestExperiences < ActiveRecord::Migration[5.2]
  def change
    create_table :test_experiences do |t|
      t.references :user, foreign_key: true
      t.references :test, foreign_key: true

      t.timestamps
    end
  end
end
