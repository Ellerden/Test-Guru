# frozen_string_literal: true

class Test < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations, dependent: :destroy
  has_many :questions, dependent: :destroy
  belongs_to :category
  belongs_to :author, class_name: 'User'

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }
  scope :by_category, ->(category) {
                        joins(:category)
                          .where(categories: { title: category })
                      }

  validates :title, :level, :category, :author, presence: true
  validates :level, numericality: { only_integer: true,
                                    greater_than_or_equal_to: 0 }
  validates :title, uniqueness: { scope: :level }

# Использовать тут скоуп by_category?
  def self.by_category_title(category)
     self.by_category.order(title: :desc).pluck(:title)
  end

  def self.by_category(category)
    Test.joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title)
  end

  def hours_to_pass_test
    self.recommended_time.strftime("%H").to_i
  end

  def minutes_to_pass_test
    self.recommended_time.strftime("%M").to_i
  end

  def time
    self.recommended_time.strftime("%H:%M")
  end
end