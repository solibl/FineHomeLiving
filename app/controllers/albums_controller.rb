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
		@albums = Album.all
		@album = Album.find(params[:id])
		@images = Image.where( :album_id => @album.id)
		if params[:id] == 1
			@previous = @albums[@album.count-1]
			@next = @albums[1]
		elsif params[:id] == @albums.count
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
		@album = Album.find(params[:id])
		@album.assign_attributes(album_edit_params)
		if @album.save
			redirect_to album_path
		else
			redirect_to edit_album_path, :flash => { :error => @album.errors.full_messages}
		end
	end

	def destroy
		@images = Image.where("album_id = ?", params[:id])
		@images.each do |image|
			image.destroy
		end
		@album = Album.find(params[:id])
		@album.destroy
		redirect_to albums_path
	end

	private

	def album_params
		params.require(:album).permit(:title, :location, :album_description, :project_year, :price, :image)
	end

	def album_edit_params
		params.require(:album).permit(:title, :location, :album_description, :project_year, :price, :image)
	end
end
