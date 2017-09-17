class UsersController < ApplicationController

	before_action :authenticate_user!, only: [:edit, :update]
	before_action :chech_authorization, only: [:edit, :update]
	before_action :set_user
	def show
		
	end

	def edit

	end

	def update
		if @user.update(user_params)
			redirect_to @user
		else
			flash.now[:alert] = "Breathe in & out"
			render :edit
		end
	end

	private

	def chech_authorization
		unless current_user.id == params[:id].to_i
			redirect_to root_url
		end
	end

	def set_user
		@user = User.find(params[:id])
	end

	def user_params
		params.require(:user).permit(:name, :image)
	end

end