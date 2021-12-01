class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy

  validates :text, :answers, presence: true

  validate :validate_count_of_answers

  def validate_count_of_answers
    errors.add(:base) if answers.count > 4
  end
end
