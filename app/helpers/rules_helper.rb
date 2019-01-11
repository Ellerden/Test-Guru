module RulesHelper
  def rules_for_select
    Rule::RULES.collect { |r| r[1] }
  end
end
