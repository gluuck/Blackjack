class Cards
  attr_accessor :sum_arr, :cards,:card, :element
  def initialize
  @card = {'2': 2,'3': 3,'4': 4,'5': 5,'6': 6,'7': 7,'8': 8,'9': 9,'10': 10, 'V+': 10,
           'V^': 10,'V<3': 10, 'V<>': 10, 'Q+': 10,'Q^': 10,'Q<3': 10, 'Q<>': 10,'K+': 10,
           'K^': 10,'K<3': 10, 'K<>': 10,'T+': 1,'T^': 1,'T<3': 1, 'T<>': 1}

  
    @sum_arr = [] 
    @cards = []
  end  

  def generate 
    cards << var = card.keys.sample
    sum_arr.push(card[var])
  end 
       
  def sum   
    sum_arr.inject(:+)
  end
  
  def show_cards
    cards.join(', ')
  end

  def change_value(value)
    card[value] = 11
  end

  def find_el
    if sum_arr.include?(1)
      @element = cards[sum_arr.index(1)]
    end
  end  
  
  def change_sum_arr
    sum_arr[cards.index(element)] = change_value(element)    
  end  
end
