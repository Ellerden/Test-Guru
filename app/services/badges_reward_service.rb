class BadgesRewardService
  attr_reader :rewarded
  attr_accessor :ba

  def initialize(participation)
    @participation = participation
    @user = @participation.user
    @rewarded = false
    @ba = []
  end

  def achieve_badge(badge)
    @participation.user.badges << badge
    @ba << badge
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
    tests_by_categories != 0 && (@user.test_passed_by_category(category).uniq.count == test_by_categories)
  end

  def passed_whole_level_rule?(level)
    tests_by_level = Test.by_level(level).count
    tests_by_level != 0 && (@user.test_passed_by_level(level).uniq.count == tests_by_level)
  end
end