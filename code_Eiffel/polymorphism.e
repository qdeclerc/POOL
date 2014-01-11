-------------------
-- CLASS WARRIOR --
-------------------

note
	description: "Superclass WARRIOR."

deferred class
	WARRIOR

feature

	fight
		deferred
		end
end

---------------------
-- CLASS SELLSWORD --
---------------------

note
	description: "SELLSWORD subclass for polymorphism."

class
	SELLSWORD

inherit
	WARRIOR

create
	make

feature

	name: STRING

	make (n : STRING)
		do
			name := n
		end

	fight
		do
			print(name)
			print(" asks: How much are you willing to pay??%N")
		end

end

------------------
-- CLASS KNIGHT --
------------------
note
	description: "KNIGHT subclass for polymorphism."

class
	KNIGHT

inherit
	WARRIOR

create
	make

feature

	name: STRING

	make (n : STRING)
		do
			name := n
		end

	fight
		do
			print(name)
			print(" shouts: FOR THE RIGHTFUL QUEEN!!%N")
		end
end

----------------
-- ROOT CLASS --
----------------

class
	APPLICATION

create
	make

feature {NONE} -- Initialization

	defendQueen (warrior: WARRIOR)
		do
			warrior.fight
		end

	make
			-- Run application.
		local
			bronn: SELLSWORD
			barristan: KNIGHT

		do
			create bronn.make ("Bronn")
			create barristan.make ("Barristan")
			defendQueen(bronn)
			defendQueen(barristan)
		end

end
