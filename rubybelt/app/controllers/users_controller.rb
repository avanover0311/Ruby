class UsersController < ApplicationController
	def index

	end

	def create
		@user=User.create(student_params) 
  		
  		if @user.valid?
  			session[:user_id] = @user.id 
  			flash[:success] = "New User has been created"
  			redirect_to '/songs'
  		else
  			flash[:danger] = "Something went wrong with your registration"
  			redirect_to '/users'
  		end
	end
	def show
  		@user=User.find(session[:user_id])
  		@adds=Play.where(user_id: params[:id])
    end

	def student_params
      	puts params
     	params.require(:user).permit(:first_name, :last_name, :email, :password)
    end
end
