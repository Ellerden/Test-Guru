# frozen_string_literal: true

module BadgesHelper
  def rule_type
    Badge::RULES.map { |rule| [t(rule, scope: 'admin.badges.form.rule_name'), rule] }
  end
end
