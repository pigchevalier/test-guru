class Question < ApplicationRecord
  belongs_to :test

  has_many :answers, dependent: :destroy
  has_many :current_questions, class_name: "Result", dependent: :destroy

  validates :text, presence: true

end
