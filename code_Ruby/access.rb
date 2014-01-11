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