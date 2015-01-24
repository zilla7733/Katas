class Calculator
  def Add numbersToAdd
    total = 0.0
    numbersToAdd = GetCommaDelimitedNumbersToAdd(numbersToAdd)
    VerifyThereAreNoNegativeNumbers(numbersToAdd)

    numbersToAdd.split(",").each { |n|
      if Float(n) <= 1000
        total = total + Float(n)
      end
    }
    return total
  end

  def GetCommaDelimitedNumbersToAdd(numbersToAdd)
    if numbersToAdd.start_with?("//")
      delimiter = numbersToAdd.split("\n")[0]
      numbersToAdd = numbersToAdd.split("\n")[1]
      RemoveFirstTwoChar(delimiter)
      delimiter.gsub! "]", ","
      delimiter.gsub! "[", ""
      delimiter.split(",").each { |d|
        numbersToAdd.gsub! d, ","
      }
    else
      delimiterArray = [","]
      if numbersToAdd.include? "\n"
        numbersToAdd.gsub! "\n", ","
      end
    end
    numbersToAdd
  end

  def RemoveFirstTwoChar(delimiter)
    delimiter[0]=''
    delimiter[0]=''
  end

  def VerifyThereAreNoNegativeNumbers(numbersToAdd)
    negativeNumberList = GetNegativeNumberList(numbersToAdd)
    if negativeNumberList.size > 0
      #raise (ArgumentError) # "Negatives not allowed: " + negativeNumberList)
      raise "Negatives not allowed: " + negativeNumberList
    end
  end

  def GetNegativeNumberList numbersToCheck
    returnValue = ""
    numbersToCheck.split(",").each {|number|
      if Float(number) < 0
        if returnValue.size > 0
          returnValue = returnValue + ", "
        end
       returnValue = returnValue + number
        end
    }
    return returnValue
  end
end


#http://nimblepros.com/media/36628/string%20calculator%20kata.pdf

# Ruby comma delimited list - http://archive.railsforum.com/viewtopic.php?id=7491
# Ruby string to int - https://www.ruby-forum.com/topic/202419
# difference between single and double quote in Ruby

