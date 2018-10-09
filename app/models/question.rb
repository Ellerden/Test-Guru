# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test
  validates :text, presence: true
  validates :answers, length: { minimum: 1, maximum: 4 }
end
