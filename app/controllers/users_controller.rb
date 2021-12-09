class UsersController < ActionController::Base

  before_action :authenticate_user!

  def edit; end

  def update
    if params[:user][:first_name].present? && params[:user][:last_name].present?
      current_user.update(params.require(:user).permit(:first_name, :last_name))
      current_user.update(type: Admin)
      redirect_to admin_tests_path

    else
      redirect_to root_path
    end
  end

end