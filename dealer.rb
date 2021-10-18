require_relative 'cards'
require_relative 'bank'

class Dealer
  include CardsMethods
  attr_accessor :cards,:sum_arr,:score,:card,:name

  def initialize(name='Dealer')
    @score = Bank.new
    @name = name
    @sum_arr = [] 
    @cards = []
  end  
end
