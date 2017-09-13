class PhotosController < ApplicationController

	def photo_params
	params.require(:photo).permit(:title, :description, :image)
	end

	def index 
	end 

	def show
	@photo = Photo.new 
	end 

	def new
	@photo = Photo.new 
	end

	def create
	end

	def edit
	end

	def update
	end

	def destroy
	end


end 