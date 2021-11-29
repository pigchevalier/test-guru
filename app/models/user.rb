class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins("INNER JOIN results ON tests.id = results.test_id INNER JOIN users ON results.user_id = users.id").where(users: { id: self.id}, level: level) 
  end
end
