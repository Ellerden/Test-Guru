# frozen_string_literal: true

class AddCurrentQuestionToParticipations < ActiveRecord::Migration[5.2]
  def change
    add_reference :participations, :current_question, foreign_key: { to_table: :questions }
    add_column :participations, :correct_questions, :integer, default: 0
  end
end
