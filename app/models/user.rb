# frozen_string_literal: true

class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  has_many :participations, dependent: :destroy
  has_many :tests, through: :participations, dependent: :destroy
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id,
                           dependent: :destroy
  # в дальнейшем можно отсылать письмо со ссылкой для верификации акка
  #validates :email, uniqueness: true, format: { with: /@/ }

  def test_passed_by_level(level)
    Test.joins(:participations).where(tests: { level: level })
  end

  def participation(test)
    participations.order(id: :desc).find_by(test: test)
  end
end
