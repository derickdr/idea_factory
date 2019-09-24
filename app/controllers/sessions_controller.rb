class SessionsController < ApplicationController
  def new
  end

  def create
    user = User.find_by_username(params[:username])
    if user &&  user.authenticate(params[:username])
        session[:user_id] = user.id
        redirect_to root_url, notice: "Successfully signed in"
    else
        flash.now.alert = "Username or password is invalid"
        render "new_user"
    end
  end
end
