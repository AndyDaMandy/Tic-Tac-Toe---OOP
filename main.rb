#holds game text functions to display text
module GameText
    def start
      puts "Beginning game"
    end
    def decide_turn
      puts "Flip a coin to decide who go's first. If it's heads you go first, if it's tails you go second"
    end
end

class Game
  include GameText
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
end
play