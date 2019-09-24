class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user = User.new(params[:user])
        if @user.save
            redirect_to root_url, notice: "Successfully created new account!"
        else
            render "new"
        end
    end

    private

    def user_params
        params.require(:username).permit(:username, :password, :password_confirmation)
      end
end
