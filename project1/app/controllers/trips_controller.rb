class TripsController < ApplicationController
	def trip_params
		params.require(:trip).permit(:name, :description).merge(user: current_user)

	end

	def index
		 @user = User.find(session[:user_id])
		 @trip = Trip.all
	end

	def create
		@user = User.find(session[:user_id])
		@trip = Trip.create(trip_params)
		if @trip.valid?
			redirect_to '/trips'
		else
			flash[:danger]= @group.errors.full_messages
			redirect_to '/trips'
		end
	end

	def destroy
		@trip = Trip.find(params[:id])
 	 	@trip.destroy
		redirect_to '/trips'
	end
end
