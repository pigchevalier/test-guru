require_relative "add_new_badge.rb"

class AddNewBadgeCategory < AddNewBadge
  def rule
    if @result.test.category.title == @badge.parameter && @result.successful?
      @count_badge = @user.badges.where(id: @badge.id).count
      @current_category_successful = []
      @received_in_badges = []
      each_test
      @current_category_successful.sort_by{ |e| e[:id] } == Test.joins(:category).where(category: { title: @badge.parameter }).order(:id)
    else
      false
    end
  end

  private

  def each_test()
    @user.tests.joins(:category).where(category: {title: @badge.parameter}).each do |test|
      if test.results.where(successful: true, user: @user).count > @received_in_badges.count(test)
        if @received_in_badges.count(test) == @count_badge
          @current_category_successful.push(test)
        end
        @received_in_badges.push(test)          
      end
    end
  end
end
