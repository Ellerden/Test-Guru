# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question

  scope :correct, -> { where(correct: true) }

  validates :text, presence: true
  validate :validate_answers_length, on: :create

  def maximum_capacity?
    question.answers.size > 4
  end

  private

  def validate_answers_length
    errors.add(:base, :max_answers) if self.maximum_capacity?
  end
end
