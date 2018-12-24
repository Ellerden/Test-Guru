class AddRecommendedTimeToTests < ActiveRecord::Migration[5.2]
  def change
    add_column :tests, :recommended_time, :time
  end
end
