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

  validates :email, uniqueness: true, presence: true, format: { with: URI::MailTo::EMAIL_REGEXP, message: "only email allows"}

  def tests_by_level(level)
    tests.where(level: level) 
  end

  def result(test)
    results.order(id: :desc).find_by(test_id: test.id)
  end
end
