class Yahtzee

  def self.Ones(*dice)
    ScoreBy(1, ValidateDice(dice))
  end

  def self.Twos(*dice)
    ScoreBy(2, ValidateDice(dice))
  end

  def self.Threes(*dice)
    ScoreBy(3, ValidateDice(dice))
  end

  def self.Fours(*dice)
    ScoreBy(4, ValidateDice(dice))
  end

  def self.Fives(*dice)
    ScoreBy(5, ValidateDice(dice))
  end

  def self.Sixes(*dice)
    ScoreBy(6, ValidateDice(dice))
  end

  def self.Pair(*dice)
    result = 0

    matches = GetMatchesArray(dice)

    for i in 0..5
        if matches[i] > 1 then
          result = (i+1) * 2
        end
    end

    return result
  end

  def self.TwoPairs(*dice)
    result = 0

    matches = GetMatchesArray(dice)

    duplicates = 0
    for i in 0..5
      if matches[i] > 1 then
        result += (i+1) * matches[i]
        duplicates += matches[i]
      end
    end
    if duplicates > 2 then
      return result
    else
      return 0
    end
  end

  private

  def self.GetMatchesArray(dice)
    matches = Array.new(6,0)
    for die in ValidateDice(dice)
      matches[die-1] += 1
    end
    matches
  end

  def self.ScoreBy(value, dice)
    result = 0
    for die in dice
      if die == value then result += value end
    end
    return result
  end

  def self.ValidateDice(dice)
    raise 'What the heck?' if dice.length != 5
    for die in dice
      raise 'too high' if die > 6
      raise 'too low' if die < 1
      raise 'not an int' if die != die.to_i
    end
  end

end