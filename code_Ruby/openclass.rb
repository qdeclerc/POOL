class Dragon

	def breatheFire
		puts "It is still a baby dragon, it cannot breathe fire"
	end

end

dragon = Dragon.new
dragon.breatheFire

#Add a method fly
class Dragon

	def fly
		puts "It is flying high into the sky"
	end
end

dragon.fly
dragon.breatheFire

#Modify the breatheFire method 
class Dragon

	alias babyFire breatheFire # renames previous method
	def breatheFire
		puts "Fire is everywhere"
	end
end

dragon.fly
dragon.babyFire
dragon.breatheFire