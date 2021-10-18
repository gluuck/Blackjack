
module CardsMethods
  attr_accessor :sum_arr, :cards,:card, :element
  class Card
    attr_accessor :card
    def initialize
      @card = { '2+': 2,'2^': 2,'2<3': 2,'2<>': 2,'3+': 3,'3^': 3,'3<3': 3,'3<>': 3,
                '4+': 4,'4^': 4,'4<3': 4,'4<>': 4,'5+': 5,'5^+': 5,'5<3': 5,'5<>': 5,
                '6+': 6,'6^': 6,'6<3': 6,'6<>': 6,'7+': 7,'7^': 7,'7<3': 7,'7<>': 7,
                '8+': 8,'8^': 8,'8<3': 8,'8<>': 8,'9+': 9,'9^': 9,'9<3': 9,'9<>': 9,
                '10+': 10,'10^': 10,'10<3': 10,'10<>': 10, 
                'V+': 10,'V^': 10,'V<3': 10, 'V<>': 10, 'Q+': 10,'Q^': 10,'Q<3': 10, 'Q<>': 10,
                'K+': 10,'K^': 10,'K<3': 10, 'K<>': 10,'T+': 1,'T^': 1,'T<3': 1, 'T<>': 1 }
    end  
  end

  def generate(card)     
    cards << var = card.keys.sample
    sum_arr.push(card[var])
    card.delete(var)
  end 
       
  def sum   
    sum_arr.inject(:+)
  end
  
  def show_cards
    cards.join(', ')
  end

  def change_value(value)
    sum_arr[value] = 11
  end

  def find_el
    if sum_arr.include?(1)
      @element = sum_arr.index(1)
    end
  end  
  
  def change_sum_arr
    find_el
    sum_arr[element] = change_value(element)    
  end  
end
