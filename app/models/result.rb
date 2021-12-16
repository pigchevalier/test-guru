class Result < ApplicationRecord
  belongs_to :user
  belongs_to :test
  belongs_to :current_question, class_name: "Question", optional: true

  before_validation :before_validation_set_first_question, on: :create
  before_validation :next_question , on: :update

  PASSING_SCORE = 0.85.freeze

  def completed?
    current_question.nil?
  end

  def accept!(answer_ids)
    if correct_answer?(answer_ids)
      self.correct_questions += 1
      
    end  
    save!  
  end

  def successful?
    if correct_questions/test.questions.count >= PASSING_SCORE
      self.successful = true 
      save(validate: false)
      true
    else
      false
    end 
  end

  def number_of_current_question
    test.questions.order(:id).where('id < :id', id: current_question.id).count + 1  
  end

  def count_all_questions
    test.questions.count
  end

  private

  def before_validation_set_first_question
    self.current_question = test.questions.first if test.present?
  end

  def correct_answer?(answer_ids)
    correct_answers.ids.sort == answer_ids.to_a.map(&:to_i).sort
  end

  def correct_answers
    current_question.answers.correct
  end

  def next_question
    self.current_question = test.questions.order(:id).where('id > :id', id: current_question.id).first
  end
end
