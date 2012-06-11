class Frame

	attr_reader :roll, :is_spare, :is_strike, :total_point

	def initialize(roll)
	  @roll = roll
		@total_point = first_roll + second_roll
		
		checkPoint()
		
		if @roll.length > 2
		  if is_spare?
		    sumToTotalPoint(@roll[2])
	    elsif is_strike?
	      sumToTotalPoint(@roll[2]+@roll[3])
      end
    end
	end

	def sumToTotalPoint(value)
		@total_point += value
	end

	def checkPoint()
		if first_roll == 10
			@is_strike = 1
		elsif totalPoint() == 10
			@is_spare = 1
		end
	end
	
	def first_roll
	  @roll[0]
  end
  
  def second_roll
    @roll[1]
  end

	def totalPoint()
		@total_point
	end

	def is_spare?
		is_spare
	end

	def is_strike?
		is_strike
	end

end