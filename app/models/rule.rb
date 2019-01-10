# frozen_string_literal: true

class Rule < ApplicationRecord
  has_one :badge

  #to properly show it in badges creation selector form
  def rule_with_params
    if params.present?
      "#{name} #{params}"
    else
      name
    end
  end
end
