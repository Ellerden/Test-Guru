# frozen_string_literal: true

class AddAnswersTextNullConstraint < ActiveRecord::Migration[5.2]
  def change
    change_column_null(:answers, :text, false)
  end
end
