class AlbumsController < ApplicationController
include UsersHelper

	def index
		if logged_in?
			@albums = Album.all
		else
			redirect_to login_path
		end
	end

	def create
		if logged_in?
			@album = Album.new(album_params)
			if @album.save
				redirect_to albums_path
			else
				redirect_to new_album_path, :flash => { :error => @album.errors.full_messages}
			end
		else
			redirect_to login_path
		end
	end

	def new
		if logged_in?
			@album = Album.new
		else
			redirect_to login_path
		end
	end

	def edit
		if logged_in?
			@album_edit = Album.find(params[:id])
		else
			redirect_to login_path
		end
	end

	def show
		@albums = Album.all
		@album = Album.find(params[:id])
		@images = Image.where( :album_id => @album.id)
		if params[:id] == @albums[0].id
			@previous = @albums[@album.count-1]
			@next = @albums[1]
		elsif params[:id] == @albums.last.id.to_s
			current_album = @albums.index(@album)
			@previous = @albums[current_album-1]
			@next = @albums[0]
		else
			current_album = @albums.index(@album)
			@previous = @albums[current_album-1]
			@next = @albums[current_album+1]
		end
	end

	def update
		if logged_in?
			@album = Album.find(params[:id])
			@album.assign_attributes(album_edit_params)
			if @album.save
				redirect_to album_path
			else
				redirect_to edit_album_path, :flash => { :error => @album.errors.full_messages}
			end
		else
			redirect_to login_path
		end
	end

	def destroy
		if logged_in?
			@images = Image.where("album_id = ?", params[:id])
			@images.each do |image|
				image.destroy
			end
			@album = Album.find(params[:id])
			@album.destroy
			redirect_to albums_path
		else
			redirect_to login_path
		end
	end

	private

	def album_params
		params.require(:album).permit(:title, :location, :album_description, :project_year, :price, :image)
	end

	def album_edit_params
		params.require(:album).permit(:title, :location, :album_description, :project_year, :price, :image)
	end
end
