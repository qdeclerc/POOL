# CODE FOR ACCESS IDENTIFIERS

class Lord

	private 

	def plot
		puts "I plot to behead king Joffrey"
	end

	protected

	def mistrust
		puts "I want to conspire, but hold it secret"
	end


	public

	def toad
		puts "You are such a magnificent person, my grace"
	end
	
	def publicTalk
		toad
		self.toad
	end

	def protectedTalk
		mistrust # works
		self.mistrust #works
		
	end

	def privateTalk 
		plot #works
		self.plot #does not work
	end

	

end

l = Lord.new
l.publicTalk
l.protectedTalk
l.privateTalk

class Lord
	public
    
    def plot
    	puts "I say it publicly: I want to behead king Joffrey!"
    end
end

l.privateTalk

# CODE FOR INHERITANCE

class Creature
	def initialize
		puts "CREATURE"
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

	def initialize(name)
		@name = name
		puts "Dragon " + name
	end
end