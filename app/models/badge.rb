class Badge < ApplicationRecord
#  has_many :users, dependent: :nullify
#  has_many :rules, dependent: :destroy

  belongs_to :rule

  before_save :default_image

  private

  def default_image
    self.route ||= 'badges/default.png'
  end
end
