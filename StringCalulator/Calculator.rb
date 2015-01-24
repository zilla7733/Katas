class Calculator

  @@delimiter = ","

  def Add numbersToAdd
    total = 0.0

    if numbersToAdd.start_with?("//")
      delimiter = numbersToAdd.split("\n")[0]
      numbersToAdd = numbersToAdd.split("\n")[1]
      RemoveFirstTwoChar(delimiter)

      delimiterArray = delimiter.split("][")
      delimiterArray.each { |d|
        d.gsub!("[", "")
        d.gsub!("]", "")
        numbersToAdd.gsub!(d, @@delimiter)
      }

    else
      if numbersToAdd.include? "\n"
        numbersToAdd.gsub!("\n",@@delimiter)
      end
    end

    #add check for negative numbers
    negativeNumberList = GetNegativeNumberList(numbersToAdd)

    if negativeNumberList.size > 0
      raise ArgumentError #'Negatives not allowed: ' + negativeNumberList
    end

    arrayOfNumbers=numbersToAdd.split(@@delimiter).each { |n|
      if Float(n) <= 1000
        total = total + Float(n)
      end
    }
    return total
  end

  def RemoveFirstTwoChar(delimiter)
    delimiter[0]=''
    delimiter[0]=''
  end

  def GetNegativeNumberList numbersToCheck
    returnValue = ""
    numbersToCheck.split(@@delimiter).each {|number|
      if Float(number) < 0
        returnValue = returnValue + @@delimiter + number
      end
    }
    return returnValue
  end
end


#http://nimblepros.com/media/36628/string%20calculator%20kata.pdf

# Ruby comma delimited list - http://archive.railsforum.com/viewtopic.php?id=7491
# Ruby string to int - https://www.ruby-forum.com/topic/202419
# difference between single and double quote in Ruby

