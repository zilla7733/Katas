require 'rspec'
require_relative 'prime_factor_generator'

describe 'PrimeFactorGenerator' do

  before :each do
    @pfg = PrimeFactorGenerator.new
  end

  it 'should return [2] when we pass 2' do
    @pfg.generate(2).should == [2]
  end

  it 'should return [3] when we pass 3' do
    @pfg.generate(3).should == [3]
  end

  it 'should return [2,2] when we pass 4' do
    @pfg.generate(4).should == [2,2]
  end

  it 'should return [2,3] when we pass 6' do
    @pfg.generate(6).should == [2,3]
  end

  it 'should return [2,2,3] when we pass 12' do
    @pfg.generate(12).should == [2,2,3]
  end

  it 'should return [] when we pass 17' do
    @pfg.generate(17).should == [17]
  end

  it 'should return [] when we pass 253' do
    @pfg.generate(253).should == [11,23]
  end
end