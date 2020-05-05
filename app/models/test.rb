class Test < ApplicationRecord
  belongs_to :category

  def self.sort_tests(category)
    joins(:category).where(categories: { title: category }).order(title: :DESC).pluck('tests.title')
  end
end
