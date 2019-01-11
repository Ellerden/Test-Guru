# frozen_string_literal: true

class Rule < ApplicationRecord
<<<<<<< HEAD
<<<<<<< HEAD
=======
>>>>>>> f5a79f3... fix badge path, create rules constructor, refactoring
  RULES = [
    [I18n.t('.rules.whole_category'), 'whole_category'],
    [I18n.t('.rules.whole_level'), 'whole_level']].freeze

<<<<<<< HEAD
  has_one :badge

  validates :name, uniqueness: { scope: :params }
  validates :name, :params, :description, presence: true

  #to properly show it in badges creation selector form
  def rule_with_params
    if params.present?
      "#{name} #{params}"
=======
=======
>>>>>>> f5a79f3... fix badge path, create rules constructor, refactoring
  has_one :badge

  validates :name, uniqueness: { scope: :params }
  validates :name, :params, :description, presence: true

  #to properly show it in badges creation selector form
  def rule_with_params
<<<<<<< HEAD
    if condition.present?
      "#{name} #{condition}"
>>>>>>> 8171ea8... create badges for admin
=======
    if params.present?
      "#{name} #{params}"
>>>>>>> f80ac86... reward users with badges
    else
      name
    end
  end
end
