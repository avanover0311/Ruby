class UsersController < ApplicationController
	def index

	end

	def create
		
		@user=User.create(student_params) 
  		if @user.valid?
  			session[:user_id] = @user.id 
  			flash[:success] = "New User has been created"
  			redirect_to '/comments'
  		else
  			flash[:danger] = @user.errors.full_messages
  			redirect_to '/users'
  		end
	end
	def show
  		@user=User.find(params[:id])

    end

	def student_params
      	puts params
     	params.require(:user).permit(:name, :screen_name, :email, :password, :password_confirmation)
    end
end
