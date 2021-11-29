class Test < ApplicationRecord
  def self.title_by_category(category_name)
    #id_array = Category.where("title = ?", category_name).pluck(:id)
    #tests_titles = []
    #id_array.each do |id|
    #  tests_titles.push(self.where("category_id = ?", id).order(title: :desc).pluck(:title))
    #end 
    tests_titles = Test.joins("INNER JOIN categories ON tests.category_id = categories.id").where("categories.title = ?", category_name).order(title: :desc).pluck(:title)
  end
end
