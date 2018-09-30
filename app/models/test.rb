class Test < ApplicationRecord
  belongs_to :category
  has_many :questions
  has_many :test_experiences

  def self.by_category(category)
    tests_by_category(category).order(title: :desc).pluck(:title)
  end
end
