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
		turkey = nil

		@game.each do |frame|
		  if before_frame != nil
		    if turkey != nil
		      turkey.sumToTotalPoint(frame.first_roll)
		      puts "total point turkey = "+turkey.totalPoint().to_s+"."
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

				frame.sumToTotalPoint(before_frame.totalPoint())
		  end

			before_frame = frame
		end
		
		@game.each do |frame|
		  puts frame.totalPoint()
	  end
	end

	def totalPoint()
		setTotalPoint()
		
		return @game[-1].totalPoint()
	end

end