class SessionsController < ApplicationController
  def new; end

  def create
    user = User.find_by(email: params[:email])

    if user&.authenticate(params[:password])
      session[:user_id] = user.id
      begin
        redirect_to cookies.delete :path_after_login
      rescue
        redirect_to root_path
      end
    else
      flash.now[:alert] = 'Are you a Guru? Verify your Email and Password please'
      render :new
    end
  end

  def delete
    cookies.delete :email
    redirect_to root_path
    session.delete(:user_id)
  end
end
