class User < ApplicationRecord
  #если автор то созданные тесты
  has_many :created_tests, foreign_key: "author_id", class_name: "Test", dependent: :destroy
  #если юзер то пройденные тесты через таблицу
  has_many :results, dependent: :destroy
  has_many :tests, through: :results

  def tests_by_level(level)
    tests.where(level: level) 
  end
end
