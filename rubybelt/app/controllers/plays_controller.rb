class PlaysController < ApplicationController
	def index
	end

	def create
		@user = User.find(session[:user_id])
		@song = Song.find(params[:song_id])
		@users_adding=Play.create(song_id: params[:song_id], user_id: session[:user_id])
		@count=Play.
		redirect_to '/songs'
	end
end
