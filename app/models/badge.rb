class Badge < ApplicationRecord
  IMAGES = [
    ['First try', 'badges/first_try.png'],
    ['Whole category', 'badges/whole_category.png'],
    ['Whole level', 'badges/whole_level.png'],
    ['Every category', 'badges/every_category.png'],
    ['Ahead of time', 'badges/ahead_of_time.png'],
    ['Three in a row', 'badges/three_in_row.png']].freeze

  has_many :user_badges, dependent: :delete_all
  has_many :users, through: :user_badges
  belongs_to :rule

  validates :name, :rule, presence: true, uniqueness: true
  validates :name, :rule, presence: true, uniqueness: true

  before_save :set_default_image

  private

  def set_default_image
    self.route ||= 'badges/default.png'
  end
end
