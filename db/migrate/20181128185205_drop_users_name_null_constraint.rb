# frozen_string_literal: true

class DropUsersNameNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null :users, :name, true
    change_column_default :users, :name, 'User'
    change_column_default :users, :role, 'user'
  end
end
