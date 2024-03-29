require 'spec_helper'

describe Bowling do

	before :each do
		@bowling = Bowling.new([Frame.new([2,5]),Frame.new([3,4])])
		@bowlingSpare = Bowling.new([Frame.new([5,5]),Frame.new([6,2]),Frame.new([1,2])])
		@bowlingStrike = Bowling.new([Frame.new([10,0]),Frame.new([6,2]),Frame.new([1,2])])
		@bowlingGame = Bowling.new([Frame.new([1,4]),Frame.new([4,5]),Frame.new([6,4]),Frame.new([5,5]),
									Frame.new([10,0]),Frame.new([0,1]),Frame.new([7,3]),Frame.new([6,4]),Frame.new([10,0]),Frame.new([2,8,6])])
		@bowlingTurkey = Bowling.new([Frame.new([10,0]),Frame.new([10,0]),Frame.new([10,0]),Frame.new([1,3]),Frame.new([1,3])])
	end

	it 'constructor' do
		@bowling.class.should == Bowling
	end	

	it 'point' do
		@bowling.gameTotalPoint().should == 14
	end

	it 'total point with spare' do
		@bowlingSpare.gameTotalPoint().should == 27
	end

	it 'total point with strike' do
		@bowlingStrike.gameTotalPoint().should == 29
	end

	it 'complex game with spare and strike' do
		@bowlingGame.gameTotalPoint().should == 133
	end

	it 'Turkey' do
		@bowlingTurkey.gameTotalPoint().should == 73
	end

	it 'test setTotalPoint' do
		@bowlingSpare.setTotalPoint()[0].total_point.should == 16
		@bowlingGame.setTotalPoint()[9].total_point.should == 133
	end
end