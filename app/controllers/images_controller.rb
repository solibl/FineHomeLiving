class ImagesController < ApplicationController
	def create
		@album = Album.find(params[:album_id])
		@image = Image.new(image_params)
		@image.album_id = @album.id
		if @image.save
			redirect_to album_path(@album)
		else
			redirect_to new_album_image_path(@album), :flash => { :error => @image.errors.full_messages }
		end
	end

	def new
		@image = Image.new
	end

	def edit 
		@album = Album.find(params[:album_id])
		@image_edit = Image.find(params[:id])
	end

	def update
		@image = Image.find(params[:id])
		@image.assign_attributes(image_edit_params)
		if @image.save
			redirect_to album_path(params[:album_id])
		else
			redirect_to edit_album_image_path, :flash => { :error => @image.errors.full_messages}
		end	 
	end

	def destroy
		@image = Image.find(params[:id])
		@image.destroy
		redirect_to album_path(params[:album_id])
	end
	
	private
	
	def image_params
		params.require(:image).permit(:name, :description, :image)
	end

	def image_edit_params
		params.require(:image).permit(:name, :description, :image)
	end
end