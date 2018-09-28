class CommentsController < ApplicationController

	def comment_params
		params.require(:comment).permit(:content).merge(user: current_user).merge(event: @event)
	end

	def create 
		@event= Event.find(params[:event_id])
		@newcomment=Comment.create(comment_params)
		redirect_to '/events/'+ @event.id.to_s
	end
	
	def show

	end
end
