class AuthsController < ApplicationController
	def create
  	@user = User.new(params.require(:user).permit(:email, :password))
  	if @user.save
    	flash[:notice] = ['User successfully created']
    	redirect_to new_user_path
  	else

  end
end
