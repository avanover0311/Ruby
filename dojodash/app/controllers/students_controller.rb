class StudentsController < ApplicationController

	def show
		@dojo=Dojo.find(params[:dojo_id])
		@students=Student.find(params[:id])
		@cohort= Student.where(:dojo_id => @dojo).where.not(id: params[:id])
	end
	def edit
  		@students=Student.find(params[:id])
  		@dojos=Dojo.all
  		@dojo=Dojo.find(params[:dojo_id])
  	end
  	def update
  		@dojo=Dojo.find(params[:dojo_id])
  		@student= Student.find(params[:id])
  		@student.update(student_params)
  		
  		redirect_to '/dojos'
  	end
  	def student_params
  		puts params
  		params.require(:student).permit(:first_name, :last_name, :email, :dojo_id)
  	end
  	def new
  		@students = Student.all
  		@dojos = Dojo.all
  		@dojo=Dojo.find(params[:dojo_id])
  	end

 	def create
  		@student=Student.create(student_params) 
  		
  		redirect_to '/dojos'

  		if @student.save
  			flash[:success] = "New Student has been created"
  		else
  			flash[:danger] = "Something went wrong with your student"
  		end	
  	end
  	def destroy
  		@dojo=Dojo.find(params[:dojo_id])
	  	@student= Student.find(params[:id])
	  	@student.destroy
	  	redirect_to '/dojos'
  	end
end
