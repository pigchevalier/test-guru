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
    new_badge_level = AddNewBadgeLevel.new(badge, @user, @result)
    new_badge_level.rule
  end

  def category?(badge)
    new_badge_category = AddNewBadgeCategory.new(badge, @user, @result)
    new_badge_category.rule
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
