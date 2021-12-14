class Badge < ApplicationRecord
  belongs_to :category, optional: true
  belongs_to :test, optional: true

  has_many :users_badges, dependent: :destroy
  has_many :users, through: :users_badges

  validates :title, :rule, presence: true
  validates :level, numericality: { only_integer: true, greater_than_or_equal_to: 0 }, presence: true, if: :rule_level?
  validates :category, presence: true, if: :rule_category?
  validates :test, presence: true, if: :rule_test?

  def show_rule
    string_rule = self.rule
    if self.rule == 'Level'
      string_rule += ': ' + self.level.to_s
    elsif self.rule == 'Category'
      string_rule += ': ' + self.category.title
    elsif self.rule == 'Test'
      string_rule += ': ' + self.test.title + ', first try: ' + self.first_try.to_s
    end 
  end

  def received(current_user)
    current_user.badges.where(id: self.id).count()
  end

  private

  def rule_level?
    self.rule == 'Level'
  end

  def rule_category?
    self.rule == 'Category'
  end
      
  def rule_test?
    self.rule == 'Test'    
  end

end
