# CODE FOR INHERITANCE

class Creature
	def initialize name
		@name = name
		puts "Creature #{name}"
	end

	def move
		puts "AAArg!! cannot move without legs!!"
	end
end

module Winged

	def fly
		puts "Flying creature"
	end
end

module Reptile
	def move
		puts "Crawling creature"
	end
end

class Dragon < Creature
	include Winged

	include Reptile

	def breatheFire
		puts "Roooooooooh!"
	end
end

balerion = Dragon.new "Balerion"
balerion.fly
balerion.move
