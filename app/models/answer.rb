class Answer < ApplicationRecord
  belongs_to :question

  validates :text, presence: true

  scope :correct, -> { where(correct: true) }

  validate :validate_max_count_of_answers_create
  
  def validate_max_count_of_answers_create
    errors.add(:question) if question.answers.count >= 4
  end  

end
