class BadgesRewardService
  def initialize(participation)
    @participation = participation
  end

  def achieve_badge(badge)
    user.badges.push(badge)
  end

  def call
    Badge.all.each do |badge|
      find_rule
      achieve_badge(badge) if send("passed_#{@rule.name}_rule?", @rule.condition)
    end
  end

  def find_rule
    @rule = Rule.where('id = ?', badge.rule_id)
  end

  def passed_first_try_rule?(_rule)
    @participation.success? && (current_user.tests.where('test_id = ?', @participation.test_id) == 1)
  end

  def passed_whole_category_rule?(category)
    @participation.success? && (current_user.tests.where('category = ?', category).uniq.count == Test.by_category(category).count
  end

  def passed_whole_level_rule?(level)
    @participation.success? && (current_user.tests.where('level = ?', level.to_i).uniq.count == Test.by_level(level.to_i).count)
  end
end