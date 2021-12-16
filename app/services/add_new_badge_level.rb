require_relative "add_new_badge.rb"

class AddNewBadgeLevel < AddNewBadge
  def rule
    if @result.test.level == @badge.parameter.to_i && @result.successful?
      @count_badge = @user.badges.where(id: @badge.id).count
      @current_level_successful = []
      @received_in_badges = []
      each_test
      @current_level_successful.sort_by{ |e| e[:id] } == Test.where({ level: @badge.parameter.to_i }).order(:id)
    else
      false
    end  
  end

  private

  def each_test()
    @user.tests.where({ level: @badge.parameter.to_i }).each do |test|
      if test.results.where(successful: true, user: @user).count > @received_in_badges.count(test)
        if @received_in_badges.count(test) == @count_badge
          @current_level_successful.push(test)
        end
        @received_in_badges.push(test)
      end
    end
  end
end
