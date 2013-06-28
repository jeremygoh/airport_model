require 'weather'

class Airport
include Weather

#airports start off as empty and have a hard-coded max capacity of 6 planes
#planes are contained within an array called @planes	
	def initialize(planes=[])
		@planes = planes
		@capacity = 6
	end	

##landing possible as long as airport is not full or weather is stormy
##added return statements for fullness and bad weather for clarity
##when a plane lands, it is added to the airport
	def order_landing!(plane)
		if full?
			"Couldn't land plane as airport is full"
		elsif weather == "stormy"
			"Bad weather. Couldn't land plane"
		else
			plane.land!
			@planes << plane
		end
	end	

	def number_of_landed_planes
		@planes.size
	end

##take off is possible as long as weather is good
##one less plane if the take off is possible 
	def order_take_off!(plane)
		if weather == "stormy"
			"Couldn't take off due to the bad weather"
		else
			plane.take_off! 
			@planes.delete(plane)
		end	
	end

	def full?
		@planes.size == @capacity
	end



end