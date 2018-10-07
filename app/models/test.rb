class Test < ApplicationRecord
  has_many :users, through: :participations
  has_many :questions
  belongs_to :category
  belongs_to :author, class_name: 'User'

  def self.by_category(category)
    Test.joins('INNER JOIN categories ON categories.id = tests.category_id')
        .where(categories: { title: category })
        .order(title: :desc).pluck(:title)
  end
end
