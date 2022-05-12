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
    def player_select
      puts "Select a cell to place your mark!"
    end
    def ai_select
      puts "The AI will now select a cell...."
    end
end

class Game
  include GameText
  @player = true
  def coin_flip
   rand(2)
  end
  def turn_order
    decide_turn
    player = true
    coin = coin_flip
    coin == 0 ? @player = true : @player = false
    @player == true ? player_first : computer_first
  end
  def switch_turns
    if @player == true
      @player = false
    else
      @player = true
    end
  end
  def turn
    if @player == true
      player_select
      input = gets
  end
end

#holds the cells, winning combos
class Board
      WIN_COMBO = [[1, 5, 9], [1, 2, 3], [2, 5, 8], [1, 4, 7], [3, 6, 9], [3, 5, 7], [4, 5, 6], [7, 8, 9]]  
  attr_accessor :WIN_COMBO, :initialize
   def initialize
    @cells = [1, 2, 3, 4, 5, 6, 7, 8, 9]
  end 
  def view_board
    puts "Board:\n#{@cells[0]} | #{@cells[1]} | #{@cells[2]}\n---------\n#{@cells[3]} | #{@cells[4]} | #{@cells[5]}\n---------\n#{@cells[6]} | #{@cells[7]} | #{@cells[8]}"
  end
end

#runs the game
def play
  game = Game.new
  board = Board.new
  game.start
  game.turn_order
  board.view_board
end
play