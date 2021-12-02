class Test < ApplicationRecord
  belongs_to :category
  belongs_to :author, class_name: "User"
  
  has_many :questions, dependent: :destroy
  has_many :results, dependent: :destroy
  has_many :users, through: :results

  validates :title, presence: true, uniqueness: { scope: :level }
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true

  scope :easy, -> { where(level: 0..1) }
  scope :medium, -> { where(level: 2..4) }
  scope :hard, -> { where(level: 5..Float::INFINITY) }

  def title_by_category(category_name)
    joins(:category)
      .where(categories: { title: category_name})
      .order(title: :desc)
      .pluck(:title)
  end
end
