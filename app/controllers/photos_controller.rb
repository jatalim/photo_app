class PhotosController < ApplicationController

	def photo_params
	params.require(:photo).permit(:title, :description, :image)
	end

	def index 
	end 

	def show
		@album = Album.find(params[:album_id])
		@photo = Photo.find(params[:id])
		@comment = @photo.comments.build
	end 

	def new
	@photo = Photo.new
	@album = Album.find(params[:album_id])
	# @album.id = params[:album_id]
	# redirect_to new_album_photo_path(album_id: @album.id)

	# @photo = @album.photos
	end

	def create
	@album = Album.find(params[:album_id])
	@photo = @album.photos.build(photo_params)
		
		if @photo.save
		redirect_to album_path(id: @album.id)
			else
		render :new
		end

	end

	def edit
		@album = Album.find(params[:album_id])
		@photo = Photo.find(params[:id])
	end

	def update
		@photo = Photo.find(params[:id])
		@album = Album.find(params[:album_id])

		if @photo.update(photo_params)
			redirect_to album_path(id: @album.id)
			else
			render :edit
		end
	end

	def destroy
		@photo = Photo.find(params[:id])
		@album = Album.find(params[:album_id])
		@photo.destroy

		redirect_to album_path(id: @album.id)
	end

end 