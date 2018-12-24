# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :participations, dependent: :destroy
  has_many :tests, through: :participations, dependent: :destroy
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id,
                           dependent: :destroy
  has_many :gists, dependent: :destroy

  validates :first_name, :last_name, presence: true

  def test_passed_by_level(level)
    Test.joins(:participations).where(tests: { level: level })
  end

  def participation(test)
    participations.order(id: :desc).find_by(test: test)
  end

  def admin_rights?
    self.is_a?(Admin)
  end

  def full_name
    "#{self.first_name} #{self.last_name}"
  end
end
