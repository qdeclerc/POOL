----------------
-- CLASS LORD --
----------------

note
	description: "LORD diplomacy class."

class
	LORD

create
	make

feature {ANY} -- public

	name: STRING assign set_name -- assigner command

	set_name (n : STRING)
		do
			name := n
		end

feature {NONE} --initialization

	make (name_lord: STRING)
		do
			name := name_lord
			print("I am lord ")
			print(name)
			print("%N")
		end

feature {NONE} -- private, will not be called outside this scope

	plot
		do
			print ("I plot to behead king Joffrey%N")
		end



feature -- public, syntactic sugar for feature {ANY}

	toad
		do
			print ("You are such a magnificent person, my grace%N")
		end


feature {LORD} -- public for specified classes and subclasses, same as protected in C++ for example

	mistrust
		do
			print("I want to conspire, but hold it secret%N")
		end

feature {LIEGELORD} -- public for specified classes and subclasses, will only work in LIEGELORD class and subclasses

	allegiance (n : STRING)
		do
			print("I am your humble subject, my lord ")
			print(n)
			print("%N")
		end

end

---------------------
-- CLASS LIEGELORD --
---------------------

note
	description: "LIEGELORD diplomacy class."

class
	LIEGELORD

inherit
	LORD

create

	makeLiege

feature

	subject : LORD

feature {NONE} -- Initialization

	makeLiege (n: STRING man : LORD)
		do
			name := n
			subject := man
			man.allegiance (n) -- works within the scope of LIEGELORD subclasses
			print("Yes you are, lord ")
			print(subject.name)
			print("%N")
			man.mistrust -- works within the scope of LORD subclasses
			-- man.plot does not work
		end

end

----------------
-- ROOT CLASS --
----------------

note
	description : "Eiffel-project application root class"

class
	APPLICATION

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			lord: LORD
			liege: LIEGELORD
		do
			create lord.make ("Karstark")
			create liege.makeliege ("Stark", lord)

			lord.toad
			liege.toad
		end

end
