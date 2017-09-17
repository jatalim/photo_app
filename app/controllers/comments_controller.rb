class CommentsController < ApplicationController


	def edit

	end

	def create
		pho = photo.comments.build(photo_params)
		pho.user = current_user
		pho.save
		redirect_to album_photo_path(album_id: album.id, id: photo.id)
	end

	def destroy
		comment = Comment.find(params[:id])
		comment.destroy
		redirect_to album_photo_path(album_id: album.id, id: photo.id)
	end
	
	private

	def photo_params
		params.require(:comment).permit(:comments, :username)	
	end

	def photo 
		Photo.find(params[:photo_id])
	end
	
	def album	
		Album.find(params[:album_id])
	end
end