class Badge < ApplicationRecord
<<<<<<< HEAD
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

=======
#  has_many :users, dependent: :nullify
#  has_many :rules, dependent: :destroy

  belongs_to :rule

>>>>>>> 8171ea8... create badges for admin
  before_save :default_image

  private

  def default_image
    self.route ||= 'badges/default.png'
  end
end
