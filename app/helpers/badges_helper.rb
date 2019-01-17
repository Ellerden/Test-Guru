# frozen_string_literal: true

module BadgesHelper
  def rule_type
    Badge::RULES.map{ |rule| [t(rule, scope: 'admin.rules.form.name'), rule] }
  end
end
