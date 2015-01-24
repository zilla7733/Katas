class Greed
  def calculate_best_score dice
    score = score_ones(dice)
    score += score_twos(dice)
    score += score_threes(dice)
    score += score_fours(dice)
    score += score_fives(dice)
    score += score_sixes(dice)
  end

  def find_digits digit, dice
    dice.count {|d| d == digit}
  end

  def score_ones dice
    score_helper(find_digits(1, dice), 1000, 100)
  end

  def score_twos dice
    score_helper(find_digits(2, dice), 200, 0)
  end

  def score_threes dice
    score_helper(find_digits(3,dice), 300, 0)
  end

  def score_fours dice
    score_helper(find_digits(4,dice), 400, 0)
  end

  def score_fives dice
    score_helper(find_digits(5,dice), 500, 50)
  end

  def score_sixes dice
    score_helper(find_digits(6,dice), 600, 0)
  end

  def score_helper number_of_die, score_for_triple, score_for_single
    if number_of_die >= 3
      score_for_triple + score_helper(number_of_die - 3,score_for_triple, score_for_single )
    else
      number_of_die * score_for_single
    end
  end
end
