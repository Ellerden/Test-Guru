# frozen_string_literal: true

module User::Auth
  extend ActiveSupport::Concern

  attr_reader :password
  attr_writer :password_confirmation

  included do
    validates :name, :email, :username, presence: true
    validates :email, :username, uniqueness: true
    validates :password, presence: true, if: Proc.new { |user| user.password_digest.blank? }
    validates :password, confirmation: true
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
