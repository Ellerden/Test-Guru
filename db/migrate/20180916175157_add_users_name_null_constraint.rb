# frozen_string_literal: true

class AddUsersNameNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:users, :name, false)
    change_column_null(:users, :username, false)
    change_column_null(:users, :email, false)
    change_column_null(:users, :password, false)
  end
end
