class User < ApplicationRecord
  has_many :participations
  has_many :tests, through: :participations
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id

  def test_passed_by_level(level)
    Test.joins('INNER JOIN participations ON participations.user_id = id')
        .where(tests: { level: level }).distinct
  end
end
