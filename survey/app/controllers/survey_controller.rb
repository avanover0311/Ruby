class SurveyController < ApplicationController
	def index
		session[:count] || 0
		render
	end
	def result 
		session[:count] || 1
		flash[:success] = "Thanks for submitting info" + session[:count].to_s + "times"
		@name = params[:name]
		@location = params[:location]
		@language = params[:language]
		@comment = params[:comment]
	end
end
