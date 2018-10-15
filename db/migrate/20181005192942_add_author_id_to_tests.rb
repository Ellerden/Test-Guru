# frozen_string_literal: true

class AddAuthorIdToTests < ActiveRecord::Migration[5.2]
  def change
    add_reference :tests, :author, foreign_key: { to_table: :users }
  end
end
