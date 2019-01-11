class BadgesRewardService
<<<<<<< HEAD
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
<<<<<<< HEAD
  end

  def passed_whole_level_rule?(level)
    tests_by_level = Test.by_level(level).count
    tests_by_level != 0 && (@user.test_passed_by_level(level).uniq.count == tests_by_level)
=======
=======
  attr_reader :rewarded

>>>>>>> f80ac86... reward users with badges
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
    tests_by_categories != 0 && (@user.test_passed_by_category(category).uniq.count == test_by_categories)
=======
>>>>>>> f5a79f3... fix badge path, create rules constructor, refactoring
  end

  def passed_whole_level_rule?(level)
<<<<<<< HEAD
    @participation.success? && (current_user.tests.where('level = ?', level.to_i).uniq.count == Test.by_level(level.to_i).count)
>>>>>>> 8171ea8... create badges for admin
=======
    tests_by_level = Test.by_level(level).count
    tests_by_level != 0 && (@user.test_passed_by_level(level).uniq.count == tests_by_level)
>>>>>>> f80ac86... reward users with badges
  end
end