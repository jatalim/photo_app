class AlbumsController < ApplicationController

	before_action :authenticate_user!
	
	def index 
	@album = Album.all
	end 

	def show
	@album = Album.find(params[:id])
	end 

	def new
	@album = Album.new 
	end

	def create
	album_params = params[:album].permit(:name, :description)
	@album = Album.create(album_params)
	redirect_to albums_path(id: @album.id)
	end

	def edit
	@album = Album.find(params[:id])
	end

	def update
	album_params = params[:album].permit(:name, :description)
	album = Album.find(params[:id])
	album.update(album_params)
	redirect_to albums_path(id: album.id)
	end

	def destroy
	@album = Album.find(params[:id])
	@album.destroy
	redirect_to albums_path
	end

end 











