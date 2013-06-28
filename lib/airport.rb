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
		elsif stormy_weather?
			"Bad weather. Couldn't land plane"
		else
			successful_landing(plane)
		end
	end	

	def number_of_landed_planes
		@planes.size
	end

##take off is possible as long as weather is good
##one less plane if the take off is possible 

	def order_take_off!(plane)
		if stormy_weather?
			"Couldn't take off due to the bad weather"
		else
			successful_take_off(plane)
		end	
	end

	def full?
		@planes.size == @capacity
	end

##added as part of refactoring
	def stormy_weather?
		weather == "stormy"
	end


	def successful_landing(plane)
		plane.land!
		@planes << plane
	end

	def successful_take_off(plane)
		plane.take_off! 
		@planes.delete(plane)
	end

end