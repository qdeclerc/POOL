module Contract
	attr_accessor :old 
	@invariants = []

	# checks if attribute has to be stored
	def eligible attribute
		nonEligible = ["@old", "@invariants"]
		nonEligible.collect do |var|
			if var == attribute
				return false
			end
		end
		return true
	end
		
	# Returns an older value for the given attribute
	def getOld oldAttr
		return @old["#{oldAttr}"]
	end

	# Stores the values of the attributes
	def setOld(bind)
		@old = Hash.new
		vars = self.instance_variables
		vars.collect do |v|
			if eligible("#{v}")
				@old["#{v}"] = eval("#{v}",bind)
			end
		end
	end 

	# Returns to previous state (old attribute state)
	def callback
		vars = self.instance_variables
		vars.collect do |v|
			if eligible("#{v}")
				val = @old["#{v}"]
				eval("#{v} = #{val}")
			end 
		end
	end 

	# check if the conditions are maintained
	def checkCond(cond, bind)	
		cond.collect do |c|
			if !eval(c, bind)
				raise "precondition violation"
			end
		end
	end

	# Require clauses
	def requir(cond, bind)			
		setOld(bind)	
		checkCond(cond, bind)
	end

	# Ensure clauses
	def ensur(cond, bind, retVal = nil)
		begin 
			checkCond(cond, bind)
		rescue
			callback
			raise "postcondition violation"
		end
		checkInvariants bind
		return retVal
	end

	# Class invariant clauses
	def classInvariant(inv, bind)						
		setOld(bind)
		@invariants = inv	
		checkInvariants bind
	end

	#check the class invariant clauses
	def checkInvariants bind
		begin
			checkCond(@invariants, bind)
		rescue
			callback
			raise "class invariance violation"
		end
	end
end

# Example how it could be used in a class
class Winterfell

	attr_accessor :maxStarks
	attr_accessor :minStarks
	attr_accessor :starks

	include Contract

	def initialize
		@maxStarks = 7
		@minStarks = 1
		@starks = 7

		#define the class invariants
		classInvariant(['@starks <= @maxStarks',
			'@starks >= @minStarks'], binding)

	end

	def starksLeave amount
		requir(['amount > 0', 'amount < 5'], binding) # require clause

		@starks = @starks - amount

		ensur(['@starks == (getOld(:@starks) - amount)'], binding, @starks) #ensure clause
	end 

end


w = Winterfell.new
w.starksLeave 1
w.starksLeave 7 # invariance violation
w.starksLeave 0 # precondition violation
w.starksLeave 5 # precondition violation
