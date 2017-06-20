class MainsController < ApplicationController
	def index
		@albums = Album.all
	end
end