class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable

  #если автор то созданные тесты
  has_many :created_tests, foreign_key: "author_id", class_name: "Test", dependent: :destroy
  #если юзер то пройденные тесты через таблицу
  has_many :results, dependent: :destroy
  has_many :tests, through: :results
  has_many :gists, dependent: :destroy
  has_many :users_badges, dependent: :destroy
  has_many :badges, through: :users_badges

  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only email allows"}

  def tests_by_level(level)
    tests.where(level: level) 
  end

  def result(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end

  def new_badge?(result)
    Badge.all.each do |badge|
      if badge.rule == 'Level' && result.test.level == badge.level
        new_badge_level?(badge)
      elsif  badge.rule == 'Category' && result.test.category == badge.category
        new_badge_category?(badge)
      elsif  badge.rule == 'Test' && result.test == badge.test
        new_badge_test?(badge)
      end
    end
  end

  private

  #поскольку условие было что пользователь может получать один и тот же бэйдж много раз, то
  # бэйдж добавляется каждый раз когда выполняется условие (например пройдены все тесты из категории 
  # и пользователь успешно перепроходит тест из этой категории ему снова добавляется этот же бэйдж)

  def new_badge_level?(badge)
    current_level_successful = []
    self.tests.where({level: badge.level}).each do |test|
      current_level_successful.push(test) if test.results.where(successful: true, user: self).any? && !current_level_successful.include?(test)
    end
    add_new_badge(badge) if current_level_successful.sort_by{|e| e[:id]} == Test.where({level: badge.level}).order(:id)
  end

  def new_badge_category?(badge)
    current_category_successful = []
    self.tests.where(category: badge.category).each do |test|
      current_category_successful.push(test) if test.results.where(successful: true, user: self).any? && !current_category_successful.include?(test)
    end
    add_new_badge(badge) if current_category_successful.sort_by{|e| e[:id]} == badge.category.tests.order(:id)
  end

  def new_badge_test?(badge)
    #byebug
    if badge.first_try == true
      add_new_badge(badge) if self.results.where({test: badge.test, successful: true}).count == 1
    else
      add_new_badge(badge)
    end
  end

  def add_new_badge(badge)
    #byebug
    self.badges.push(badge)
  end
end
