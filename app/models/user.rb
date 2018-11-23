# frozen_string_literal: true
require 'digest/sha1'

class User < ApplicationRecord
  has_many :participations, dependent: :destroy
  has_many :tests, through: :participations, dependent: :destroy
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id,
                           dependent: :destroy

  validates :name, :email, :password, :username, presence: true
  validates :email, :username, uniqueness: true

  def test_passed_by_level(level)
    Test.joins(:participations).where(tests: { level: level })
  end

  def participation(test)
    participations.order(id: :desc).find_by(test: test)
  end

  def authenticate(input_password)
    digest(input_password) == self.password_digest ? self : false
  end

  private

  # сюда в продакшене надо бы добавить salt
  def digest(string)
    Digest::SHA1.hexdigest(string)
  end
end
