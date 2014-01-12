----------------------
-- CLASS WINTERFELL --
----------------------

note
	description: "CLASS representing the castle of Winterfell. There should always be a Stark in Winterfell"

class
	WINTERFELL

create

	build

feature

	number_of_starks : INTEGER
	min_starks : INTEGER
	max_starks : INTEGER

	build
		do
			number_of_starks := 7
			min_starks := 1
			max_starks := 7
			starks_present
		end

	starks_present
		do
			print(number_of_starks)
			print(" Starks are present in Winterfell%N")
		end

	starks_leaving_winterfell (amount: INTEGER)
		require 	-- precondition
			non_negative: amount > 0
		do
			number_of_starks := number_of_starks - amount
			starks_present
		ensure	-- postcondition
			leaved: number_of_starks = old number_of_starks - amount
		end

	starks_entering_winterfell (amount: INTEGER)
		require
			non_negative: amount > 0
		do
			number_of_starks := number_of_starks + amount
			starks_present
		ensure
			entered: number_of_starks = old number_of_starks + amount
		end

invariant	-- class invariant
	always_a_stark: number_of_starks >= min_starks --with tag
	number_of_starks <= max_starks -- whitout tag
end


----------------
-- ROOT CLASS --
----------------

class
	HELLO

create
	make

feature {NONE} -- Initialization

	make
			-- Run application.
		local
			winterfell: WINTERFELL

		do
			create winterfell.build
			winterfell.starks_leaving_winterfell (3)
			--winterfell.starks_leaving_winterfell (4) raises contract violation
			winterfell.starks_entering_winterfell (2)
		end

end