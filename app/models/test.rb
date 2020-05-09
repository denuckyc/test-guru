class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: 'User', foreign_key: 'author_id'
  has_many :questions
  has_many :passing_test
  has_many :users, through: :passing_test

  scope :easy,   -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard,   -> { where(level: 5..Float::INFINITY) }
  scope :sort_by_title, ->(title) { joins(:category).where(categories: { title: title }) }

  validates :title, presence: true
  validates_numericality_of :level, only_integer: true, greater_than_or_equal_to: 0
  validates :title, uniqueness: { scope: :level }

  def self.sort_tests(category)
    sort_by_title(category).order(title: :DESC).pluck(:title)
  end
end
