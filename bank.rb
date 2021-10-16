class Bank
  
  def initialize
    @score = 100
  end

  def bet
    @score -=10
  end

  def score_up(sum)
    @score += sum
  end
  
  def score_down()
    @score -= 10
  end  
end
