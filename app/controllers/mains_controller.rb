class MainsController < ApplicationController
	def index
		@albums = Album.all
		@images = Image.all
	end
end