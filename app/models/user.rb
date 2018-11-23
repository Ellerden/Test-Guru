# frozen_string_literal: true
require 'digest/sha1'

class User < ApplicationRecord
  attr_reader :password
  attr_writer :password_confirmation

  has_many :participations, dependent: :destroy
  has_many :tests, through: :participations, dependent: :destroy
  has_many :created_tests, class_name: 'Test', foreign_key: :author_id,
                           dependent: :destroy

  validates :name, :email, :username, presence: true
  validates :email, :username, uniqueness: true
  validates :password, presence: true, if: Proc.new { |user| user.password_digest.blank? }
  validates :password, confirmation: true

  def test_passed_by_level(level)
    Test.joins(:participations).where(tests: { level: level })
  end

  def participation(test)
    participations.order(id: :desc).find_by(test: test)
  end

  def authenticate(input_password)
    digest(input_password) == self.password_digest ? self : false
  end

  def password=(input_password)
    if input_password.nil?
      self.password_digest = nil
    elsif input_password.present?
      @password = input_password
      self.password_digest = digest(@password)
    end
  end

  private

  # сюда в продакшене надо бы добавить salt
  def digest(string)
    Digest::SHA1.hexdigest(string)
  end
end
