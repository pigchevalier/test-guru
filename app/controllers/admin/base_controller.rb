class Admin::BaseController < ApplicationController

  layout 'admin'

  before_action :authenticate_user!
  before_action :authenticate_admin!

  private

  def authenticate_admin!
    redirect_to root_path, alert: 'You are not admin' unless current_user.is_a?(Admin)
  end

end