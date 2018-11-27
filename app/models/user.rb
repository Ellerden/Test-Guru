# frozen_string_literal: true
require 'digest/sha1'

class User < ApplicationRecord

  has_many :participations, dependent: :destroy
  has_many :tests, through: :participations, dependent: :destroy
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id,
                           dependent: :destroy
  # в дальнейшем можно отсылать письмо со ссылкой для верификации акка
  validates :email, uniqueness: true, format: { with: /@/ }

  has_secure_password

  def test_passed_by_level(level)
    Test.joins(:participations).where(tests: { level: level })
  end

  def participation(test)
    participations.order(id: :desc).find_by(test: test)
  end
end
