require 'weather'

class Airport
include Weather
	
	def initialize(planes=[])
		@planes = planes
		@capacity = 6
	end	

	def order_landing!(plane)
		if full?
			"Couldn't land plane as airport is full"
		elsif weather == "stormy"
			"Bad weather. Couldn't land plane"
		else
			plane.land! unless full? || weather=="stormy"
			@planes << plane
		end
	end	

	def number_of_landed_planes
		@planes.size
	end

	def order_take_off!(plane)
		plane.take_off! unless weather == "stormy"
		@planes.delete(plane)
	end

	def full?
		@planes.size == @capacity
	end



end