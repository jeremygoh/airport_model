module Weather

#occassionally returns stormy, but mostly sunny
	def weather
			return "sunny" if random_number >2
			return "stormy" if random_number <=2
	end

#generates random number between 0 and 10
	def random_number
			rand(11)
	end

end