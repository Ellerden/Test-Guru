class User < ApplicationRecord
  def test_passed_by_level(level)
    Test.joins('INNER JOIN participations ON participations.user_id = ? '\
      'AND tests.level = ?', id, level).distinct
  end
end
