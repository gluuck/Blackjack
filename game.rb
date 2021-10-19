require_relative 'player'
require_relative 'dealer'
require_relative 'cards'
class Game
  attr_accessor :player, :dealer, :card , :all_many, :bank

  def start
    @card = CardsMethods::Card.new.card
    puts "Enter name:"
    name = gets.chomp
    @player = Player.new(name)
    @dealer = Dealer.new
    game
  end

  def open_game
    loop do
      puts "Enter your choise, start or exit"
      input = gets.chomp.downcase
      case input
      when 'start'
        start
      when 'exit'
        break
      end
    end
  end
  
  def game
      @all_many = player.score.score + dealer.score.score
      2.times {player.generate(self.card)} 
      p player.cards     
      p player.sum
      2.times {dealer.generate(self.card)}
      @bank = all_many - (player.score.bet + dealer.score.bet)
      p '*' * dealer.cards.size
      change_self_value
      player_choise
  end

  def player_choise
    puts ' Enter your choise, skip, add card, open'
    choise = gets.chomp
    case choise
    when 'skip'
      dealer_choise
    when 'add card'
      player.generate(self.card) if player.cards.size < 3
      dealer_choise
    when 'open'
      show_all_cards
    end
  end

  def dealer_choise
    if dealer.sum < 17       
      dealer.generate(self.card) if dealer.cards.size < 3
    elsif dealer.sum >= 17      
      player_choise 
    end
    show_all_cards if dealer.cards.size == 3
  end

  def change_self_value
    if player.sum_arr.include?(1) && player.sum <= 11
      player.change_sum_arr
    elsif dealer.sum_arr.include?(1) && dealer.sum <= 11
      dealer.change_sum_arr
    end
  end  

  def show_all_cards
    p "Player cards: #{player.show_cards}"
    p "Player sum: #{player.sum}"
    p "Dealer cards: #{dealer.show_cards}"
    p "Dealer sum: #{dealer.sum}"  
    winner  
  end  
  
  def winner
    if player.sum == 21 
      player.score.score_up(bank)
      p player_show = "The winner #{player.name}, score: #{player.score.score}"
    elsif dealer.sum == 21
      dealer.score.score_up(bank)
      p dealer_show = "The winner #{dealer.name}, score: #{dealer.score.score}"  
    elsif  player.sum == dealer.sum
      player.score.score_up(10)
      dealer.score.score_up(10)
      p "Draw - player score: #{player.score.score}, dealer score: #{dealer.score.score}"      
    end
  end
end
