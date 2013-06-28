class Airport

	def initialize(planes=[])
		@planes = planes
		@capacity = 5
	end	

	def order_landing!(plane)
		plane.land! unless full?
	end	

	def order_take_off!(plane)
		plane.take_off!
	end

	def full?
		@planes.size == @capacity
	end

	def weather
		random_number = rand(2)
		return "sunny" if random_number ==0
	end

end