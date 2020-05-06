class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User'
  has_many :questions
  has_many :users, through: :passing_test

  def self.sort_tests(category)
    joins(:category).where(categories: { title: category }).order(title: :DESC).pluck('tests.title')
  end
end
