class Bank
  attr_accessor :score
  def initialize
    @score = 100
  end

  def bet
    @score -= 10
  end

  def score_up(sum)
    @score += sum
  end 
end
