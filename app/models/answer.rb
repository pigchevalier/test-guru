class Answer < ApplicationRecord
  belongs_to :question

  validates :text, :correct, presence: true

  scope :correct, -> { where(correct: true) }
end
