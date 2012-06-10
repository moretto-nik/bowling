require_relative 'frame'

class Bowling
	@game = []

	def initialize(game)
		@game = game
	end

	def getGame()
		@game
	end

	def getTotalPoint()
		total_point = 0
		before_is_spare = 0
		before_is_strike = 0

		@game.each do |frame|
			total_point += frame.getPoint()
			
			if before_is_spare == 1
				total_point += frame.first_roll
				before_is_spare = 0
			elsif before_is_strike == 1
				total_point +=frame.getPoint()
				before_is_strike = 0
			end

			if frame.is_spare?
				before_is_spare = 1
			elsif frame.is_strike?
				before_is_strike = 1
			end
		end

		if @game.length == 11
			total_point -= @game[@game.length-1].first_roll + @game[@game.length-1].second_roll
		end
		
		return total_point
	end

end