require 'rspec'
require_relative('../lib/yahtzee')

describe Yahtzee do

  it 'should be instantiable' do

    my_yahtzee = Yahtzee.new
    my_yahtzee.class.should == Yahtzee
  end

  it 'should give a score for ones' do
    Yahtzee.Ones(5,4,3,2,1).should_not be_nil
  end

  it 'should give a score of 1 if roll has 1 1' do
    Yahtzee.Ones(5,4,3,2,1).should == 1
  end

  it 'should give a score of 3 if roll has three ones' do
    Yahtzee.Ones(1,2,1,2,1).should == 3
  end

  it 'should give an error if less than five dice are passed' do
    expect { Yahtzee.Ones(1,2,1,2) }.to raise_error
  end

  it 'should give a score of 8 for twos if roll has four twos' do
    Yahtzee.Twos(2,2,5,2,2).should == 8
  end

  it 'should give an error if dice value is greater than six' do
    expect { Yahtzee.Ones(7,2,1,2,4) }.to raise_error
  end

  it 'should give an error if dice value is less than one' do
    expect { Yahtzee.Ones(3,2,1,2,0) }.to raise_error
  end

  it 'should give an error if the dice value is not an integer' do
    expect { Yahtzee.Ones(3,2.3,1,2,1) }.to raise_error
  end

  it 'should allow scoring by threes, fours, fives, and sixes as well' do
    (Yahtzee.Threes(1,2,3,3,3)+Yahtzee.Fours(4,4,4,1,1)+Yahtzee.Fives(1,2,3,5,5)+Yahtzee.Sixes(1,2,3,5,5)).should == 31
  end

  it 'should be able to score a pair when one exists' do
    Yahtzee.Pair(1,2,3,3,4).should == 6
  end

  it 'should score pair as zero when one does not exist' do
    Yahtzee.Pair(1,2,3,4,5).should == 0
  end

  it 'should score the highest pair if multiple exist' do
    Yahtzee.Pair(6,6,3,3,5).should == 12
  end

  it 'should score a pair even if more than two are there' do
    Yahtzee.Pair(6,3,3,3,5).should == 6
  end

  it 'should score two pair if they exist' do
    Yahtzee.TwoPairs(2,2,3,3,4).should == 10
  end

  it 'should score two pair as zero if no pairs exist' do
    Yahtzee.TwoPairs(1,2,3,4,5).should == 0
  end

  it 'should score two pair as zero if only one pair exists' do
    Yahtzee.TwoPairs(1,2,2,4,5).should == 0
  end

  it 'should score a four-of-a-kind as two pair if requested' do
    Yahtzee.TwoPairs(2,2,2,2,4).should == 8
  end

end