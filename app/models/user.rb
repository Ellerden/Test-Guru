# frozen_string_literal: true

class User < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :tests, through: :participations, dependent: :destroy
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id,
                           dependent: :destroy
  validates :name, :email, :password, :username, presence: true

  def test_passed_by_level(level)
    Test.joins(:participations).where(tests: { level: level })
  end
end
