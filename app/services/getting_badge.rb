class GettingBadge
  def new_badge(result, user)
    @result = result
    @user = user
    Badge.all.each do |badge|
      add_new_badge(badge) if send("#{badge.rule}?", badge)
    end
  end

  private

  def level?(badge)    
    if @result.test.level == badge.parameter.to_i && @result.successful?
      count_badge = @user.badges.where(id: badge.id).count
      current_level_successful = []
      received_in_badges = []
      @user.tests.where({ level: badge.parameter.to_i }).each do |test|
        if test.results.where(successful: true, user: @user).count > received_in_badges.count(test)
          if received_in_badges.count(test) == count_badge
            current_level_successful.push(test)
          end
          received_in_badges.push(test)
        end
      end
      current_level_successful.sort_by{ |e| e[:id] } == Test.where({ level: badge.parameter.to_i }).order(:id)
    else
      false
    end  
  end

  def category?(badge)
    if @result.test.category.title == badge.parameter && @result.successful?
      count_badge = @user.badges.where(id: badge.id).count
      current_category_successful = []
      received_in_badges = []
      @user.tests.joins(:category).where(category: {title: badge.parameter}).each do |test|
        if test.results.where(successful: true, user: @user).count > received_in_badges.count(test)
          if received_in_badges.count(test) == count_badge
            current_category_successful.push(test)
          end
          received_in_badges.push(test)          
        end
      end
      current_category_successful.sort_by{ |e| e[:id] } == Test.joins(:category).where(category: { title: badge.parameter }).order(:id)
    else
      false
    end
  end

  def test?(badge)
    @result.test.title == badge.parameter && @result.successful?
  end

  def test_first_try?(badge)
    @result.test.title == badge.parameter && @result.successful? && @user.results.joins(:test).where(test: { title: badge.parameter }).count == 1
  end

  def add_new_badge(badge)
    @user.badges.push(badge)
  end
end
