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
		return "sunny" if random_number ==1
		return "stormy" if random_number ==0
	end

	def random_number
		rand(2)
	end

end