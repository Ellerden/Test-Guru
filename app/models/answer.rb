# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :text, presence: true
  #validate :validate_answers_length, on: create

  private

  # def validate_answers_length
  #   return if question.answers.count < 4

  #   error.add(:answers, 'There should be between 1 and 4 answers')
  # end
end
