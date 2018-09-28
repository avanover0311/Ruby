class UsersController < ApplicationController
	
	def index

	end

	def create
		@user=User.create(student_params) 
  		
  		if @user.valid?
  			session[:id] = @user.id 
  			flash[:success] = "New User has been created"
  			redirect_to '/events'
  		else
  			flash[:danger] = "Something went wrong with your registration"
  			redirect_to '/users'
  		end
	end
	def show
  		@user=User.find(session[:user_id])

  end
def student_params
      puts params
      params.require(:user).permit(:first_name, :last_name, :email, :location, :state, :password)
    end

	def update
  		puts params
  		user= User.find(session[:user_id])
  		user.first_name = params[:first_name]
  		user.last_name = params[:last_name]
      user.email = params[:email]
  		user.location = params[:location]
  		user.state = params[:state]
      puts user.valid?
  		user.save
  		redirect_to '/events'
 	 end

end
