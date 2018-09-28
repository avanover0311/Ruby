class EventsController < ApplicationController

	def index
		 @user = User.find(session[:user_id])
		 @events = Event.where(state: current_user.state)
		 @awayevents = Event.where.not(state: current_user.state)

	end

	def create
		newevent=Event.create(event_params)
		if newevent.valid?
			redirect_to '/events'
		else
			flash[:danger]=@newevent.errors.full_messages
			redirect_to '/events'
		end
	end

	def event_params
		params.require(:event).permit(:name, :date, :location, :state).merge(user: current_user)

	end

	def show
		@user = User.find(session[:user_id])
		@event = Event.find(params[:id])
		@users_attending=Attending.where(event_id: params[:id])
		@comments=Comment.where(event: params[:id])
	end

	def join 
		@user = User.find(session[:user_id])
		@event = Event.find(params[:id])
		@attend=Attending.create(event_id: params[:id], user_id: session[:user_id])
		redirect_to '/events'
	end

	def edit
		@event=Event.find(params[:id])
	end

	def cancel
		@attend=Attending.where(user_id: session[:user_id], event_id: params[:event_id])
		@attend.destroy_all()
		redirect_to '/events'
	end

	def update
  		event= Event.find(params[:id])
  		event.name = params[:name]
  		event.date = params[:date]
  		event.location = params[:location]
  		event.state = params[:state]
  		event.save
  		redirect_to '/events'
 	 end
 	 
 	 def destroy
 	 	@event=Event.find(params[:id])
 	 	@event.destroy
 	 	redirect_to '/events'
 	 end
end
