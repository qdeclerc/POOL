class GameOfThrones

	@@numberOfPlayers = 0 # class variable

	def initialize
		@@numberOfPlayers = @@numberOfPlayers + 1
	end

	def numberOfPlayers
		return @@numberOfPlayers
	end

	class <<self    # self refers here to the class itself

    	def whatAreYou  
     		"I am the Game Of Thrones"
     	end
    end

	def whatAreYou
		"I am a player"
	end
end

#init the objects
tyrion = GameOfThrones.new
tyrion.numberOfPlayers # 1
cersei = GameOfThrones.new
cersei.numberOfPlayers # 2 
cersei.numberOfPlayers # 2 


#look at the classes
tyrion.class # class GameOfThrones
cersei.class # class GameOfThrones
GameOfThrones.class # class of a class is the Class class

#look at the eigenclasses
tyrion.singleton_class
cersei.singleton_class  
GameOfThrones.singleton_class
# the eigenclass of tyrion and the seven are different
# each object has thus his eigenclass


# Now lets take a look at the eigenmethods
tyrion.singleton_methods
cersei.singleton_methods
GameOfThrones.singleton_methods
# we clearly see that only GameOfThrones has a singleton_method, the class method defined above

#look at the behaviour of the calls
GameOfThrones.whatAreYou
cersei.whatAreYou
tyrion.whatAreYou

#modify the behavior of the call for tyrion in his eigenclass
class << tyrion
	def whatAreYou
		"I am a dwarf, but my cunning makes me the better player"
	end
end

#look at the behaviours
GameOfThrones.whatAreYou
cersei.whatAreYou
tyrion.whatAreYou
# the behaviour of the tyrion object changed, but not the behaviour of cersei

# And if we look again at the singleton_methods, we can see that tyrion has a specialized eigenmethod now
tyrion.singleton_methods
cersei.singleton_methods
GameOfThrones.singleton_methods
