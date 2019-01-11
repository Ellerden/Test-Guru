# frozen_string_literal: true

class Rule < ApplicationRecord
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
    else
      name
    end
  end
end
