class AlbumsController < ApplicationController

	def index 
	@album = Album.all
	@user = User.all
	##@user basically shows up blank for index page but shows the actual user who posted in def show. WHY?! 
	end 

	def show
	# @user = User.find(params[:id])
	@photo = Photo.new
	@user = current_user
	@album = Album.find(params[:id])
	end 

	def new
	@album = Album.new 
	end

	def create
	album_params = params[:album].permit(:name, :description)
	@album = current_user.albums.create(album_params)
	if @album.save 
		redirect_to albums_path(id: @album.id)
	else 
		flash.now[:error] = "Please try again. Name cannot be blank"
		render :new
	end 
	end

	def edit
	@album = Album.find(params[:id])
	end

	def update
	album_params = params[:album].permit(:name, :description)
	@album = Album.find(params[:id])
	if @album.update(album_params)
		redirect_to albums_path(id: @album.id)
	else 
		flash.now[:error] = "Please try again. Name cannot be blank"
		render :edit
	end 
	end

	def destroy
	@album = Album.find(params[:id])
	@album.destroy
	redirect_to albums_path
	end

end 











