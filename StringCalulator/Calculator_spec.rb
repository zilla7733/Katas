require 'rspec'
require_relative 'Calculator.rb'

describe 'Calculator' do

  it 'add 1 and 2 to get three' do
    calc = Calculator.new
    returnedvalue =  calc.Add("1,2")
    returnedvalue.should == 3
  end

  it 'add 1 and 1 to get two' do
    calc = Calculator.new
    returnedvalue =  calc.Add("1,1")
    returnedvalue.should == 2
  end

  it 'returns zero for an empty string' do
    calc = Calculator.new
    returnedvalue =  calc.Add("")
    returnedvalue.should == 0
  end

  it 'returns any number if its the only number in the string' do
      calc = Calculator.new
      returnedvalue =  calc.Add("567")
      returnedvalue.should == 567
  end

  it 'adds correctly using decimals' do
    calc = Calculator.new
    returnedvalue =  calc.Add("1.5,1.5")
    returnedvalue.should == 3
  end

  it 'adds correctly using \n as deliminator' do
    calc = Calculator.new
    returnedvalue =  calc.Add("1.5\n2.5")
    returnedvalue.should == 4
  end

  it 'adds correctly using \n as deliminator 2' do
    calc = Calculator.new
    returnedvalue =  calc.Add("1\n2,3")
    returnedvalue.should == 6
  end

  it 'allows user to pass a deliminator' do
    calc = Calculator.new
    calc.Add("//;\n1;2")== 3
  end

  it 'allows user to pass a double deliminator' do
    calc = Calculator.new
    calc.Add("////\n1//2") == 3
  end

  it 'throws an exception when negative numbers are passed' do
    calc = Calculator.new
    expect {calc.Add("-1,2")}.to raise_error(ArgumentError)
  end

  it 'throws an exception when multiple negative numbers are passed' do
    calc = Calculator.new
    expect {calc.Add("2,-4,3,-5")}.to raise_error(ArgumentError)
  end

  it 'ignores number greater than 1000' do
    calc = Calculator.new
    returnedvalue =  calc.Add("1001,1")
    returnedvalue.should == 1
  end

  it 'allows delimiters of any length' do
    calc = Calculator.new
    returnedvalue =  calc.Add("//[***]\n1***2***3")
    returnedvalue.should == 6
  end

  it 'allows multiple delimiters' do
    calc = Calculator.new
    returnedvalue =  calc.Add("//[$][%]\n1$2%3")
    returnedvalue.should == 6
  end
end


