class BadgesRewardService
  def initialize(participation)
    @participation = participation
  end

  def achieve_badge(badge)
    user.badges.push(badge)
  end

  def call
    Badge.all.each do |badge|
      achieve_badge(badge) if send("passed_#{badge.rule.name}_rule?", badge.rule.condition)
    end
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