class User < ApplicationRecord
  has_many :passing_test
  has_many :tests, through: :passing_test

  validates :email, presence: true
  validates :email, uniqueness: true

  def passed_tests(level)
    PassingTest.joins(:test).where(tests: { level: level }).order(title: :DESC).pluck('tests.title')
  end
end
