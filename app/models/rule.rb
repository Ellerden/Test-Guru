# frozen_string_literal: true

class Rule < ApplicationRecord
  # rules for constructor
  RULES = ['whole_category', 'whole_level'].freeze

  has_one :badge

  #include ActiveModel::Helpers::RulesHelper

  #to properly show it in badges creation selector form
  def rule_with_params
    if params.present?
      "#{name} #{params}"
    else
      name
    end
  end
end
