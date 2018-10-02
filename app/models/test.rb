class Test < ApplicationRecord
  def self.by_category(category)
    cat = Category.find_by(title: category)
    Test.where(category_id: cat.id).order(title: :desc).pluck(:title)
  end
end
