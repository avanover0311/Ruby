class JoinsController < ApplicationController

	def index

	end

	def create
		@group = Group.find(params[:id])
		@newjoin = Join.create(user_id: current_user.id, group_id: @group.id)


		redirect_to '/groups'
	end

	def show
		@group = Group.find(params[:id])
		@users_joined = @group.users.distinct
	end
end
