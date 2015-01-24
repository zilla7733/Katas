class PrimeFactorGenerator

  def initialize
    @result = []
  end

  def generate input
      for i in 2.. input
        if input % i == 0
          @result << i
          leftOver = input/i
          if leftOver > 1
            generate leftOver
          end
          return @result
        end
      end
   @result
  end
end