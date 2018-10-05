class User < ApplicationRecord
  def test_passed_by_level(level)
    Test.joins('INNER JOIN participations ON participations.user_id = id')
        .where(tests: { level: level }).distinct
  end
end
