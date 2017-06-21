class MainsController < ApplicationController
	def index
		@albums = Album.all
		@images = Image.all
		@projects = Album.where(id: 1..3)
	end
end