class LikesController < ApplicationController

	def index

	end

	def create
		@comment = Comment.find(params[:id])
		@newlike = Like.create(user_id: current_user.id, comment_id: @comment.id)


		redirect_to '/comments'
	end

	def show
		@comment = Comment.find(params[:id])
		@users_liked = @comment.users.distinct
	end
end
