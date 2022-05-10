#holds game text functions to display text
module GameText
    def start
      puts "Beginning game...."
    end
    def decide_turn
      puts "A coin will be flipped to decide who go's first. If it's heads you go first, if it's tails you go second"
    end
    def player_first
      puts "It's heads! You get to go first!"
    end
    def computer_first
      puts "It's tails! The computer gets to go first!"
    end
end

class Game
  include GameText
  coin = 0
  def coin_flip
   coin = rand(1)
  end
  def turn_order
    decide_turn
    coin_flip
    player = true
    coin_flip == 1 ? player = true : player = false
    player == true ? player_first : computer_first
  end
end

#holds the cells, winning combos
class Board
      WIN_COMBO = [[1, 5, 9], [1, 2, 3], [2, 5, 8], [1, 4, 7], [3, 6, 9], [3, 5, 7], [4, 5, 6], [7, 8, 9]]  
  attr_accessor :WIN_COMBO
   def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end 
end

#runs the game
def play
  game = Game.new
  board = Board.new
  game.start
  game.turn_order
end
play