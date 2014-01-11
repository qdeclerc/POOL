
--------------------
-- CLASS CREATURE --
--------------------
note
	description: "A class modeling a mythic CREATURE."

deferred class
	CREATURE

feature

	move
		deferred

		end
end

-------------------
-- CLASS REPTILE --
-------------------

note
	description: "REPTILE inheriting from CREATURE."

class
	REPTILE

inherit
	CREATURE

feature
	move
		do
			print ("creature crawls on the ground")
            print ("%N")
		end

end

------------------
-- CLASS WINGED --
------------------

note
	description: "WINGED inheriting from CREATURE."

class
	WINGED


inherit
	CREATURE

feature
	move
		do
			print ("creature flies in the air")
			print ("%N")
		end

end

------------------
-- CLASS DRAGON --
------------------

note
	description: "DRAGON multiple inheritance from diamond problem example."

class
	DRAGON

inherit
	WINGED
		rename
			move as fly
			select fly
			end
	REPTILE

create
    make

feature

	name: STRING

feature -- Initialization

    make (dragon_name: STRING)

        do
            name := dragon_name
            print (name)
            print ("%N")
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
			dragon: DRAGON
		do
			create dragon.make ("Balerion")
			dragon.fly
			dragon.move
		end
end
