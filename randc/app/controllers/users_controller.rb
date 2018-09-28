class UsersController < ApplicationController

	def index
		session[:count] || 0 
		render text: "Hello Coding Dojo"
	end

	def times
		session[:count] || 0
		session[:count] += 1
		return render text: "You have visited this page "+session[:count].to_s + " times"
	end

	def say
		render text: "Saying Hello"
	end
	
	def joe
		render text: "Saying Hello Joe"
	end

	def micheal
		redirect_to '/say/joe'
	end
	def destroy
		session.clear
		render text: "Destroyed the session"
	end
end
