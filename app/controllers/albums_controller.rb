class AlbumsController < ApplicationController
	def index
		@albums = Album.all
	end

	def create
		@album = Album.new(album_params)
		if @album.save
			redirect_to albums_path
		else
			redirect_to new_album_path, :flash => { :error => @album.errors.full_messages}
		end
	end

	def new
		@album = Album.new
	end

	def edit
		@album_edit = Album.find(params[:id])
	end

	def show
		@album = Album.find(params[:id])
	end

	def update
		@album = Album.find(params[:id])
		@album.assign_attributes(album_edit_params)
		if @album.save
		redirect_to album_path
		else
		redirect_to edit_album_path, :flash => { :error => @album.errors.full_messages}
		end
	end

	def destroy

	end

	private

	def album_params
		params.require(:album).permit(:title, :location, :album_description, :image)
	end

	def album_edit_params
		params.require(:album).permit(:title, :location, :album_description, :image)
	end
end
