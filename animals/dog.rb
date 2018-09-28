require_relative "mammal"
class Dog < Mammal
	def subclass_method
		display_health
	end
	def pet
		@health += 5
		self
	end

	def walk
		@health -= 1
		self
	end

	def run
		@health -= 10
		self
	end
end
collie = Dog.new.pet.run.run.walk.walk.walk.display_health