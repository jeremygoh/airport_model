class Plane
attr_accessor :in_the_air

#planes start off in_the_air, i.e with status "flying"
	def initialize
		@in_the_air = true
	end	

	def in_the_air?
		@in_the_air
	end
	
#descriptive status corresponding to whether it is in the air

#one line if/else statement added as part of refactoring
	def status
		return in_the_air? ? "flying" : "landed"
	end

#planes are no longer in the air when they land
	def land!
		@in_the_air = false
	end

	
#planes are in the air when they take off

	def take_off!
		@in_the_air = true
	end

end