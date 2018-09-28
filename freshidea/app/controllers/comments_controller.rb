class CommentsController < ApplicationController
	def comment_params
		params.require(:comment).permit(:content, :likes).merge(user: current_user)

	end

	def index
		 @user = User.find(session[:user_id])
		 @comment = Comment.all
	end

	def create
		@user = User.find(session[:user_id])
		@comment = Comment.create(comment_params)
		if @comment.valid?
			redirect_to '/comments'
		else
			flash[:danger]= @comment.errors.full_messages
			redirect_to '/comments'
		end
	end

	def destroy
		@comment=Comment.find(params[:id])
 	 	@comment.destroy
		redirect_to '/comments'
	end
end
