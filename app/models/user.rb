# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :confirmable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :participations, dependent: :destroy
  has_many :tests, through: :participations, dependent: :destroy
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id,
                           dependent: :destroy
  has_many :gists, dependent: :destroy
  has_many :user_badges
  has_many :badges, through: :user_badges

  validates :first_name, :last_name, presence: true

  # counts not only successfully passed tests but all. failed tests ilimination is in badges_reward_service
  def test_passed_by_level(level)
    Test.joins(:participations).where(tests: { level: level }).where(participations: { user_id: self.id })
  end

  # counts not only successfully passed tests but all. failed tests ilimination is in badges_reward_service
  def test_passed_by_category(category)
    Test.joins(:participations, :category).where(categories: { title: category }).where(participations: { user_id: self.id })
  end

  # counts not only successfully passed tests but all. failed tests ilimination is in badges_reward_service
  def passed_test(test_id)
    Participation.where(user_id: self.id, test_id: test_id)
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
