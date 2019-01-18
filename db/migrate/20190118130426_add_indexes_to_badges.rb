class AddIndexesToBadges < ActiveRecord::Migration[5.2]
  def change
    add_index(:badges, [:rule_name, :rule_params], unique: true)
  end
end
