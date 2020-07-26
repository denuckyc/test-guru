class User < ApplicationRecord
  has_many :test_passages
  has_many :tests, through: :test_passages

  validates :email, presence: true, uniqueness: true
  validates :email, format: { with: /\A([^@\s]+)@((?:[-a-z0-9]+\.)+[a-z]{2,})\z/i, on: :create }

  has_secure_password

  def passed_tests(level)
    TestPassage.joins(:test).where(tests: { level: level }).order(title: :DESC).pluck('tests.title')
  end

  def test_passage(test)
    test_passages.order(id: :desc).find_by(test_id: test.id)
  end
end
