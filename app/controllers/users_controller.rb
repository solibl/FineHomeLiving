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

	def edit
		@user = User.new
	end

	def newpassword
		@user = User.find_by(email: user_password_params["email"])
		if @user == nil
			@errors = ["Email not found"]
			@user = User.new
			render 'edit'
		else
			if @user.authenticate(user_password_params["password"]) == @user
				@user.password = user_password_params["new_password"]
				@user.save
				redirect_to login_path
			else
				@errors = ["User current password is incorrect."]
				@user = User.new
				render 'edit'
			end
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

	def user_password_params
		params.require(:user_password).permit(:email, :password, :new_password)
	end
end
