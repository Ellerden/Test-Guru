class BadgesRewardService
<<<<<<< HEAD
  attr_reader :rewarded

  def initialize(participation)
    @participation = participation
    @user = @participation.user
    @rewarded = false
  end

  def achieve_badge(badge)
    @participation.user.badges << badge
    @rewarded = true
  end

  def call
    if @participation.success?
      Badge.all.each do |badge|
        achieve_badge(badge) if send("passed_#{badge.rule.name}_rule?", badge.rule.params)
      end
    end
  end

  def passed_first_try_rule?(_rule)
    @user.passed_test(@participation.test_id).count == 1
  end

  def passed_whole_category_rule?(category)
    tests_by_categories = Test.by_category(category).count
    tests_by_categories != 0 && (@user.test_passed_by_category(category).uniq.count == tests_by_categories)
  end

  def passed_whole_level_rule?(level)
    tests_by_level = Test.by_level(level).count
    tests_by_level != 0 && (@user.test_passed_by_level(level).uniq.count == tests_by_level)
=======
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
>>>>>>> 8171ea8... create badges for admin
  end
end