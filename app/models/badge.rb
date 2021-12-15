class Badge < ApplicationRecord
  RULES = ['All test whith Level', 'All test from Category', 'successeful Test', 'first try successeful Test'].freeze

  enum rule: %i[category level test test_first_try]

  has_many :users_badges, dependent: :destroy
  has_many :users, through: :users_badges

  validates :title, :rule, presence: true

  def show_rule
    self.rule + ': ' + self.parameter    
  end

  def received(current_user)
    current_user.badges.where(id: self.id).count()
  end

end
