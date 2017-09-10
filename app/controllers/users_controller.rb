class UsersController < ApplicationController
	include UsersHelper

	def new
		@user = User.new
	end

	def create
		@user = User.find_by(email: user_params["email"])
		if @user
			if @user.authenticate(user_params["password"]) == @user
				login(@user)
				redirect_to root_path
			else
				@errors = ["Password is invalid"]
				@user = User.new
				render 'new'
			end
		else
			@errors = ["Email is invalid"]
			@user = User.new
			render 'new'
		end
	end

	def destroy
	    logout
    	redirect_to root_path
	end

	private

	def user_params
		params.require(:user).permit(:email, :password)
	end
end
