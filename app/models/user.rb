class User < ApplicationRecord
  belongs_to :test

  def passed_tests(level)
    PassingTest.joins(:test).where(tests: {level: level}).order(title: :DESC).pluck('tests.title')
  end
end
