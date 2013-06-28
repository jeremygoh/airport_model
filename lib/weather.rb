module Weather

#occassionally returns stormy, but mostly sunny
	def weather
		generated_number = random_number 
			return "sunny" if generated_number >2
			return "stormy" if generated_number <=2

	end

#generates random number between 0 and 10
	def random_number
			rand(11)
	end

end