# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question
  scope :right, -> { where(correct: true) }
  validates :text, presence: true
  validate :answers_length

  def answers_length
    return if question.answers.length <= 4

    error.add(:answers, 'There should be between 1 to 4 answers')
  end
end
