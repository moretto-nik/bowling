require_relative 'frame'

class Bowling
	attr_reader :game

	def initialize(game)
		@game = game
	end

	def setTotalPoint()
		before_frame = nil
		turkey = nil

		@game.each do |frame|
		  if before_frame != nil
		    if turkey != nil
		      turkey.sumToTotalPoint(frame.first_roll)
		      before_frame.sumToTotalPoint(frame.first_roll)
		      turkey = nil
	      end
		    
			  if before_frame.is_strike?
				  before_frame.sumToTotalPoint(frame.first_roll + frame.second_roll)
				  if frame.second_roll == 0
				    turkey = before_frame
			    end
			  elsif before_frame.is_spare?
				  before_frame.sumToTotalPoint(frame.first_roll)
			  end

				frame.sumToTotalPoint(before_frame.total_point)
		  end

			before_frame = frame
		end
	end

	def gameTotalPoint()
		setTotalPoint()
		
		return @game[-1].total_point
	end

end