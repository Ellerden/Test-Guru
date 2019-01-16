class AddTimeToPassToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :time_to_pass, :integer
  end
end
