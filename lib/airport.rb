require 'weather'

class Airport
include Weather
	
	def initialize(planes=[])
		@planes = planes
		@capacity = 5
	end	

	def order_landing!(plane)
		plane.land! unless full? || weather == "stormy"
	end	

	def order_take_off!(plane)
		plane.take_off! unless weather == "stormy"
	end

	def full?
		@planes.size == @capacity
	end



end