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

	private
	def image_params
		params.require(:image).permit(:name, :description, :image)
	end
end