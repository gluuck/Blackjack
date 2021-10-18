require_relative 'player'
require_relative 'dealer'
require_relative 'cards'
class Game
  include CardsMethods
  attr_accessor :player, :dealer, :card , :all_many, :bank
  def start
    @card = CardsMethods::Card.new.card
    puts "Enter name:"
    name = gets.chomp
    @player = Player.new(name)
    @dealer = Dealer.new
  end
  
  def game
      @all_many = self.player.score.score + self.dealer.score.score
      2.times {self.player.generate(self.card)} 
      p self.player.cards     
      p self.player.sum
      2.times {self.dealer.generate(self.card)}
      @bank = all_many - (self.player.score.bet + self.dealer.score.bet)
      p '*' * self.dealer.cards.size
      player_choise
  end

  def player_choise
    puts ' Enter your choise, skip, add card, open'
    choise = gets.chomp
    case choise
    when 'skip'
      dealer_choise
    when 'add card'
      1.times{self.player.generate(self.card)}
      dealer_choise
    when 'open'
      show_all_cards
    end
  end

  def dealer_choise
      if self.dealer.sum < 17       
        1.times{self.dealer.generate(self.card)}
      elsif self.dealer.sum >= 17      
        player_choise   
      end
  end

  def show_all_cards
    p self.player.show_cards
    p self.player.sum
    p self.dealer.show_cards
    p self.dealer.sum    
  end    
end
