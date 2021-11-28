class User < ApplicationRecord
  def tests_by_level(level)
    user_tests = Test.where("level = ? AND author_id = ?", level, self.id)
  end
end
