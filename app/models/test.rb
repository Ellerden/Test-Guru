# frozen_string_literal: true

class Test < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :users, through: :participations, dependent: :destroy
  has_many :questions, dependent: :destroy
  belongs_to :category
  belongs_to :author, class_name: 'User'

  def self.by_category(category)
    Test.joins(:category).where(categories: { title: category }).order(title: :desc).pluck(:title)
  end
end
