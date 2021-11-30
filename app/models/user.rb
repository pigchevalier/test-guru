class User < ApplicationRecord
  #если автор то созданные тесты
  has_many :created_tests, foreign_key: "author_id", class_name: "Test"
  #если юзер то пройденные тесты через таблицу
  has_many :results
  has_many :tests, through: :results

  def tests_by_level(level)
    Test.joins("INNER JOIN results ON tests.id = results.test_id ")
      .where(results: { user_id: self.id}, level: level) 
  end
end
