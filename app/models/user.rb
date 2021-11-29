class User < ApplicationRecord
  def tests_by_level(level)
    user_tests = Test.joins("INNER JOIN users ON tests.author_id = users.id").where(author_id: self.id, level: level) 
  end
end
