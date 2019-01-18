# frozen_string_literal: true

class Question < ApplicationRecord
  belongs_to :test
  has_many :answers, dependent: :destroy
  has_many :gists, dependent: :destroy

  validates :text, presence: true

  def maximum_answers?
    answers.size >= 4
  end
end
