# frozen_string_literal: true

class BadgesRewardService
  def initialize(participation)
    @participation = participation
    @user = @participation.user
  end

  def call
    return unless @participation.success?

    Badge.select { |badge| send("passed_#{badge.rule_name}_rule?", badge.rule_params) }
  end

  private

  def passed_first_try_rule?(_rule)
    @user.passed_test(@participation.test_id).count == 1
  end

  # once achieved it will be awarded with every test, even when it's not from the category.
  # so we need to check if current test is relevant -maybe user already has award for the same achievment
  # the same is with level
  def passed_whole_category_rule?(category)
    return false unless @participation.test.category.title == category

    tests_by_categories = Test.by_category_name(category).count
    tests_by_categories != 0 && (@user.test_passed_by_category(category).uniq.count == tests_by_categories)
  end

  def passed_whole_level_rule?(level)
    return false unless @participation.test.level == level.to_i

    tests_by_level = Test.by_level(level).count
    tests_by_level != 0 && (@user.test_passed_by_level(level).uniq.count == tests_by_level)
  end
end
