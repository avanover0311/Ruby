class Project
	def elevator_pitch
  	 @name
  	 @description
  	end
end

project1 = Project.new("Project 1", "Description 1")
puts project1.name 
project1.elevator_pitch 
