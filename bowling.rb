require_relative 'frame'

class Bowling
	@game = []

	def initialize(game)
		@game = game
	end

	def getGame()
		@game
	end

	def setTotalPoint()
		tmpFrame = nil

		@game.each do |frame|
			if tmpFrame != nil && tmpFrame.is_strike?
				tmpFrame.sumSpareStrike(frame.getPoint())
			elsif tmpFrame != nil && tmpFrame.is_spare? 
				tmpFrame.sumSpareStrike(frame.first_roll)
			end 

			if tmpFrame != nil
				frame.sumSpareStrike(tmpFrame.total_point)
			end

			tmpFrame = frame
		end
	end

	def getTotalPoint()
		setTotalPoint()
		
		if @game.length == 11
			return @game[-1].total_point - (@game[-1].first_roll + @game[-1].second_roll)
		else
			return @game[-1].total_point
		end
	end

end