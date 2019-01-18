# frozen_string_literal: true

class AddIndexesToBadges < ActiveRecord::Migration[5.2]
  def change
    add_index(:badges, %i[rule_name rule_params], unique: true)
  end
end
