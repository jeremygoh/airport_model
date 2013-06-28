class Plane
attr_accessor :in_the_air

	def initialize
		@in_the_air = true
	end	

	def status
		if in_the_air?
			"flying"
		else
			"landed"
		end
	end

	def land!
		@in_the_air = false
	end

	def in_the_air?
		@in_the_air
	end

	def take_off!
		@in_the_air = true
	end

end