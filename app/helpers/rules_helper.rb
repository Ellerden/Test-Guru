module RulesHelper
  def rule_header(rule)
    content_tag(:h1, rule.persisted? ? t('.edit_rule') : t('.new_rule'))
  end
end
