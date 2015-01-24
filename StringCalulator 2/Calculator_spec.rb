require 'rspec'
require_relative 'Calculator.rb'

describe 'Calculator' do

  before :each do
    @calc = Calculator.new
  end

  it 'add 1 and 2 to get three' do
    @calc.Add("1,2").should == 3
  end

  it 'add 1 and 1 to get two' do
    @calc.Add("1,1").should == 2
  end

  it 'returns zero for an empty string' do
    @calc.Add("").should == 0
  end

  it 'returns any number if its the only number in the string' do
      @calc.Add("567").should == 567
  end

  it 'adds correctly using decimals' do
    @calc.Add("1.5,1.5").should == 3
  end

  it 'adds correctly using \n as deliminator' do
    @calc.Add("1.5\n2.5").should == 4
  end

  it 'adds correctly using \n as deliminator' do
    @calc.Add("1\n2,3").should == 6
  end

  it 'allows user to pass a deliminator' do
    @calc.Add("//;\n1;2").should == 3
  end

  it 'allows user to pass a double deliminator' do
    @calc.Add("////\n1//2").should == 3
  end

  it 'throws an exception when negative numbers are passed' do
    expect {@calc.Add("-1,2")}.to raise_error("Negatives not allowed: -1")
  end

  it 'throws an exception when multiple negative numbers are passed' do
    expect {@calc.Add("2,-4,3,-5")}.to raise_error("Negatives not allowed: -4, -5")
  end

  it 'ignores numbers greater than 1000' do
    @calc.Add("1001,2").should == 2
  end

  it 'does not ignore 1000' do
    @calc.Add("1000,2").should == 1002
  end

  it 'allows a delimiter of any length' do
    @calc.Add("//[***]\n1***2***3").should == 6
  end

  it "allows multiple delimiters of any length" do
    @calc.Add("//[*][%]\n1*2%3").should == 6
  end

  end


