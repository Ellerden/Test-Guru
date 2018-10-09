# frozen_string_literal: true

class Answer < ApplicationRecord
  belongs_to :question
  scope :right, -> { where(correct: true) }
  validates :text, presence: true
end
