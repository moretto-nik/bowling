require_relative 'frame'

class Bowling
	attr_reader :game

	def initialize(game)
		@game = game
	end

	def getGame()
		@game
	end

	def setTotalPoint()
		before_frame = nil

		@game.each do |frame|
		  if before_frame != nil
		    
			  if before_frame.is_strike?
				  before_frame.sumToTotalPoint(frame.totalPoint())
			  elsif before_frame.is_spare? 
				  before_frame.sumToTotalPoint(frame.first_roll)
			  end 

				frame.sumToTotalPoint(before_frame.totalPoint())
		  end

			before_frame = frame
		end
	end

	def totalPoint()
		setTotalPoint()
		
		#eliminazione dei punteggi dell'ultimo lancio
		if @game.length == 11
			return @game[-1].totalPoint() - (@game[-1].first_roll + @game[-1].second_roll)
		else
			return @game[-1].totalPoint()
		end
	end

end