require 'spec_helper'

describe Frame do
	
	before :each do
		@frame = Frame.new(3,4)
		@frameStrike = Frame.new(10,0)
		@frameSpare = Frame.new(6,4)
	end

	it 'constructor' do
		@frame.class.should == Frame
	end

	it 'argoment' do
		@frame.first_roll.should == 3
		@frame.second_roll.should == 4
	end

	it 'strike' do
		@frameStrike.is_strike?.should == 1
	end

	it 'spare' do
		@frameSpare.is_spare?.should == 1	
	end

	it 'not valid point < 10' do
		expect {Frame.new(11,21)}.to raise_error
	end

	it 'get total point' do
		@frame.getPoint().should == 7
	end
end