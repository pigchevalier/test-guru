class UsersBadgesController < ApplicationController

  def index
    @users_badges = Badge.all
  end

end
