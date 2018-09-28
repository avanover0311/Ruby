class ListensController < ApplicationController
	def index
	end

	def create
		@user = User.find(session[:user_id])
		@song = Song.find(params[:song_id])
		puts params 
		@users_adding=Listen.create(song_id: params[:song_id], user_id: session[:user_id])
		redirect_to '/songs'
	end
	
end
