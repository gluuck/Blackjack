require_relative 'cards'
require_relative 'bank'

class Player
  include CardsMethods
  attr_accessor :cards,:sum_arr,:score,:card,:name
  def initialize(name)
    @score = Bank.new
    @name = name
    @sum_arr = [] 
    @cards = []
  end
  
end
