class ImagesController < ApplicationController
include UsersHelper

	def index
		if logged_in?
			@album = Album.find(params[:album_id])
			@images = @album.images
		else
			redirect_to login_path
		end
	end

	def create
		if logged_in?
			@album = Album.find(params[:album_id])
			@image = Image.new(image_params)
			@image.album_id = @album.id
			if @image.save
				redirect_to album_path(@album)
			else
				redirect_to new_album_image_path(@album), :flash => { :error => @image.errors.full_messages }
			end
		else
			redirect_to login_path
		end
	end

	def new
		if logged_in?
			@album = Album.find(params[:album_id])
			@image = Image.new
		else
			redirect_to login_path
		end
	end

	def edit 
		if logged_in?
			@album = Album.find(params[:album_id])
			@image_edit = Image.find(params[:id])	
		else
			redirect_to login_path
		end
	end

	def update
		if logged_in?
			@image = Image.find(params[:id])
			@image.assign_attributes(image_edit_params)
			if @image.save
				redirect_to album_images_path(params[:album_id])
			else
				redirect_to edit_album_image_path, :flash => { :error => @image.errors.full_messages}
			end	 
		else
			redirect_to login_path
		end
	end

	def destroy
		if logged_in?
			@image = Image.find(params[:id])
			@image.destroy
			redirect_to album_images_path(params[:album_id])
		else
			redirect_to login_path
		end
	end
	
	private
	
	def image_params
		params.require(:image).permit(:name, :description, :image)
	end

	def image_edit_params
		params.require(:image).permit(:name, :description, :image)
	end
end