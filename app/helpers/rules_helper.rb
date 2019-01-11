module RulesHelper
<<<<<<< HEAD
<<<<<<< HEAD
  def rule_header(rule)
    content_tag(:h1, rule.persisted? ? t('.edit_rule') : t('.new_rule'))
=======
  def rules_for_select
    Rule::RULES.collect { |r| r[1] }
>>>>>>> f5a79f3... fix badge path, create rules constructor, refactoring
=======
  def rule_header(rule)
    content_tag(:h1, rule.persisted? ? t('.edit_rule') : t('.new_rule'))
>>>>>>> d261899... localize badges and rules for admin and users
  end
end
