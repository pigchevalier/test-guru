class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true

  scope :correct, -> { where(correct: true) }

  validate :validate_max_count_of_answers_create
  validate :validate_max_count_of_answers, on: :update
  validate :validate_min_count_of_answers, on: :update

  def validate_max_count_of_answers_create
    errors.add(:question) if question.answers.count >= 4
  end

  def validate_max_count_of_answers
    errors.add(:question) if question.answers.count > 4
  end

  def validate_min_count_of_answers
    errors.add(:question) if question.id_changed? && question.answers.count <= 1
  end  

end
