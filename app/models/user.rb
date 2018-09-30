class User < ApplicationRecord
  has_many :test_experiences

  def test_by_level(level)
    tests.by_level(level)
  end

  def test_done(test)
    test_experience.order(id: :desc).find_by(test: test)
  end
end
