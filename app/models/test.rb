# frozen_string_literal: true

class Test < ApplicationRecord
  attribute :time_to_pass, :seconds

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

  # def time_in_sec
  #   self.time.strftime("%H").to_i * 60 + self.time.strftime("%M").to_i * 60
  # end

  def time_hours_minutes
    self.time_to_pass
  end
  #   self.time.strftime("%H:%M")
  # end
end