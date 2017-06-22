class MainsController < ApplicationController
	def index
		@albums = Album.all
		@images = Image.all
		@projects = Album.order("created_at DESC").limit(3)
	end
end