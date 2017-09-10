class MainsController < ApplicationController
	def index
		@albums = Album.all
		@images = Image.all
		@contact = Contact.new
		@projects = Album.order("created_at DESC")
	end

	def create
		@contact = Contact.new
		@contact.request = request
		if @contact.deliver
			flash.now[:error] = nil
		else
			flash.now[:error] = "Can not send message."
			redirect_to root_path
		end
	end
end