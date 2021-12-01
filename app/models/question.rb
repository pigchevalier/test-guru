class Question < ApplicationRecord
  belongs_to :test

  has_many :answer, dependent: :destroy

  validates :text, presence: true

  validate :validate_count_of_answers

  def validate_count_of_answers
    errors.add(:answer) if answer.count < 1 || answer.count > 4
  end
end
