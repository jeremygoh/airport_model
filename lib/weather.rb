module Weather

	def weather
			return "sunny" if random_number ==1
			return "stormy" if random_number ==0
	end

	def random_number
			rand(2)
	end

end