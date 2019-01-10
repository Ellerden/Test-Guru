class Badge < ApplicationRecord
  has_many :user_badges, dependent: :delete_all
  has_many :users, through: :user_badges
  belongs_to :rule

  validates :name, presence: true, uniqueness: true

  before_save :default_image

  private

  def default_image
    self.route ||= 'badges/default.png'
  end
end
