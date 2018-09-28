class SessionsController < ApplicationController
	def new

	end

	def create
		puts params
		puts "here"
		user = User.find_by(email:(params[:email]))
		if user && user.authenticate(params[:password])
			session[:user_id] = user.id
			print "_______",user.email
			redirect_to '/events'
		else
			flash[:errors] = "There was a problem logging in!"
			redirect_to '/users'
		end
	end

	def destroy
  		session.delete(:user_id)

  		@current_user=nil
  		redirect_to '/users'
	end
end
