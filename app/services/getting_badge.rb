class GettingBadge
  def new_badge?(result, user)
    @result = result
    @user = user
    Badge.all.each do |badge|
      if badge.rule == 'All test whith Level' 
        new_badge_level?(badge)
      elsif  badge.rule == 'All test from Category' 
        new_badge_category?(badge)
      elsif  badge.rule == 'successeful Test' 
        new_badge_test?(badge)
      elsif  badge.rule == 'first try successeful Test' 
        new_badge_test_first_try?(badge)
      end
    end
  end

  private

  #поскольку условие было что пользователь может получать один и тот же бэйдж много раз, то
  # бэйдж добавляется каждый раз когда выполняется условие (например пройдены все тесты из категории 
  # и пользователь успешно перепроходит тест из этой категории ему снова добавляется этот же бэйдж)

  def new_badge_level?(badge)
    if @result.test.level == badge.parameter.to_i && @result.successful?
      current_level_successful = []
      @user.tests.where({level: badge.parameter.to_i}).each do |test|
        current_level_successful.push(test) if test.results.where(successful: true, user: @user).any? && !current_level_successful.include?(test)
      end

      add_new_badge(badge) if current_level_successful.sort_by{|e| e[:id]} == Test.where({level: badge.parameter.to_i}).order(:id)
    end  
  end

  def new_badge_category?(badge)
    if @result.test.category.title == badge.parameter && @result.successful?
      current_category_successful = []
      @user.tests.joins(:category).where(category: {title: badge.parameter}).each do |test|
        current_category_successful.push(test) if test.results.where(successful: true, user: @user).any? && !current_category_successful.include?(test)
      end
      add_new_badge(badge) if current_category_successful.sort_by{|e| e[:id]} == Test.joins(:category).where(category: {title: badge.parameter}).order(:id)
    end
  end

  def new_badge_test?(badge)
    add_new_badge(badge) if @result.test.title == badge.parameter && @result.successful?
  end 

  def new_badge_test_first_try?(badge)
    if @result.test.title == badge.parameter && @result.successful?
      add_new_badge(badge) if @user.results.joins(:test).where(test: {title: badge.parameter}, successful: true).count == 1 
    end
  end

  def add_new_badge(badge)
    @user.badges.push(badge)
  end
end
