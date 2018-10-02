class User < ApplicationRecord
  def test_passed_by_level(level)
    test = Test.find_by_level(level)
    passed = Participation.where(user_id: id).find_by(test_id: test.id)
    Test.where(id: passed.test_id)
  end
end
