require_relative "mammal"
class Lion < Mammal
	def subclass_method
		display_health
	end
	def fly
		@health -= 10
		self
	end

	def attack_town
		@health -= 50
		self
	end

	def eat_humans
		@health += 20
		self
	end
end

Lion1 = Lion.new.fly.fly.attack_town.attack_town.attack_town.eat_humans.eat_humans.display_health