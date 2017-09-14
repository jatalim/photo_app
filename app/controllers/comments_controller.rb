class CommentsController < ApplicationController


	def edit
	end

	def create
		photo = Photo.find(params[photo_id])
		album.photo.comments.create(photo_params)
		redirect_to albums_photos_path(albums_id: album.id, photos_id: photo.id)
	end

	def destroy
	end
	
	private

	def photo_params
		params.require(:comment).permit(:name, :photo)
	end

end