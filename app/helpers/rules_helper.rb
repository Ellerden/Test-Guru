module RulesHelper
<<<<<<< HEAD
  def rule_header(rule)
    content_tag(:h1, rule.persisted? ? t('.edit_rule') : t('.new_rule'))
=======
  def rules_for_select
    Rule::RULES.collect { |r| r[1] }
>>>>>>> f5a79f3... fix badge path, create rules constructor, refactoring
  end
end
