class AddsController < ApplicationController
	def create
  	@comment = Comment.find(params[:id])
  	@newadd = Add.create(user_id: current_user.id, comment_id: @comment.id)
    
    if @comment.valid?
  		puts "Added Adds"
  		redirect_to '/comments'
  	else
  		flash[:danger] = @user.errors.full_messages
  		redirect_to '/comments'
  	end
  end

  def show
    @comment = Comment.find(params[:id])
    @users = @comment.users.group('users.id')
  end

  def index
  end
  def add_params
  	params.merge(user_id: current_user.id, comment_id: @comment.id)
  end
end
