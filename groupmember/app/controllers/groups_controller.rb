class GroupsController < ApplicationController
	def comment_params
		params.require(:group).permit(:name, :description).merge(user: current_user)

	end

	def index
		 @user = User.find(session[:user_id])
		 @group = Group.all
	end

	def create
		@user = User.find(session[:user_id])
		@group = Group.create(comment_params)
		if @group.valid?
			redirect_to '/groups'
		else
			flash[:danger]= @group.errors.full_messages
			redirect_to '/groups'
		end
	end

	def destroy
		@group=Group.find(params[:id])
 	 	@group.destroy
		redirect_to '/groups'
	end

end
