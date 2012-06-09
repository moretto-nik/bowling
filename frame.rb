class Frame
	attr_reader :first_roll, :second_roll, :is_spare, :is_strike

	def initialize(first_roll, second_roll)
		@first_roll = first_roll
		@second_roll = second_roll

		checkPoint()
	end

	def checkPoint()
		if @first_roll == 10
			@is_strike = 1
		elsif getPoint() == 10
			@is_spare = 1
		elsif getPoint() > 10
			raise "The total point must be less than 10"
		end
	end

	def getPoint()
		@first_roll + @second_roll
	end

	def is_spare?
		is_spare
	end

	def is_strike?
		is_strike
	end

end