class SongsController < ApplicationController
	def song_params
		params.require(:song).permit(:artist, :title).merge(user: current_user)

	end

	def index
		 @user = User.find(session[:user_id])
		 @songs = Song.all
		 count = Play.update_all('count = count + 1')
	end

	def create
		newsong = Song.create(song_params)

		if newsong.valid?
			redirect_to '/songs'
		else
			flash[:danger]= "your song is dumb, try another"
			redirect_to '/songs'
		end
	end

	def show
		@user = User.find(session[:user_id])
		@song = Song.find(params[:id])

		@users_adding=Song.where(song_id: params[:id])
		@otheruser=User.where.not(id: session[:user_id])
	end

	def join
		
	end
end
