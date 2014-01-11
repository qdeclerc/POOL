class Knight
	def initialize name 
		@name = "ser " + name
	end

	def fight
		puts "#{@name} shouts: FOR THE RIGHTFUL QUEEN!!"
	end
end

class Sellsword
	def initialize name
		@name = name
	end

	def fight
		puts "#{@name} asks: How much are you willing to pay??"
	end
end

def defendQueen knight
	knight.fight
end

barristan = Knight.new "Barristan"
bronn = Sellsword.new "Bronn"
defendQueen barristan
defendQueen bronn
