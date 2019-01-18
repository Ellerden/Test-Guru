# frozen_string_literal: true

class Badge < ApplicationRecord
  IMAGES = [
    ['First try', 'badges/first_try.png'],
    ['Whole category', 'badges/whole_category.png'],
    ['Whole level', 'badges/whole_level.png'],
    ['Every category', 'badges/every_category.png'],
    ['Ahead of time', 'badges/ahead_of_time.png'],
    ['Three in a row', 'badges/three_in_row.png']
  ].freeze
  RULES = %w[whole_category whole_level first_try].freeze

  has_many :user_badges, dependent: :delete_all
  has_many :users, through: :user_badges

  validates :name, :description, :rule_name, presence: true
  validates :rule_name, uniqueness: { scope: :rule_params }

  before_save :set_default_image

  private

  def set_default_image
    self.image_path ||= 'badges/default.png'
  end
end
