# frozen_string_literal: true

class Rule < ApplicationRecord
<<<<<<< HEAD
  RULES = [
    [I18n.t('.rules.whole_category'), 'whole_category'],
    [I18n.t('.rules.whole_level'), 'whole_level']].freeze

  has_one :badge

  validates :name, uniqueness: { scope: :params }
  validates :name, :params, :description, presence: true

  #to properly show it in badges creation selector form
  def rule_with_params
    if params.present?
      "#{name} #{params}"
=======
  has_one :badge

  #to properly show it in badges creation selector form
  def rule_with_params
    if condition.present?
      "#{name} #{condition}"
>>>>>>> 8171ea8... create badges for admin
    else
      name
    end
  end
end
