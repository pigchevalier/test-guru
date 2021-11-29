class User < ApplicationRecord
  def tests_by_level(level)
    Test.joins("INNER JOIN results ON tests.id = results.test_id ").where(results: { user_id: self.id}, level: level) 
  end
end
