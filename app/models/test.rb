class Test < ApplicationRecord
  def self.title_by_category(category_name)
    id_array = Category.where("title = ?", category_name).pluck(:id)
    tests_titles = []
    id_array.each do |id|
      tests_titles.push(self.where("category_id = ?", id).order(title: :desc).pluck(:title))
    end 
    tests_titles
  end
end
