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
      puts "It's tails! The AI gets to go first!"
    end
    def player_select
      puts "Select a cell to place your mark!"
    end
    def ai_select
      puts "The AI will now select a cell...."
    end
    def cannot_be
      puts "Error, you must select a number from the cells available. Please select again."
    end
end

class Game
  attr_accessor :player, :player_score, :ai_score, :player_win, :ai_win, :board
  include GameText
  def initialize
  @board = Board.new
  @player = true
  @player_score = []
  @ai_score = []
  @player_win = false
  @ai_win = false
  end
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
  def turn(arr)
    if @player == true
      player_select
      input = gets
      if arr.include? input.to_i == false
        cannot_be
        player_select
        input = gets
      else
        arr[input.to_i - 1] = "X"
        player_score.push(input)
        puts "you selected #{input}"
        @board.view_board
      end
    else
      ai_select
      ai_choice = rand(9)
      while arr.include? ai_choice == false
        ai_choice = rand(9)
      end
      puts "AI selected #{ai_choice}"
      ai_score.push(ai_choice)
      arr[ai_choice - 1] = "O"
      @board.view_board
    end
end
def check_win
  win = [[1, 5, 9], [1, 2, 3], [2, 5, 8], [1, 4, 7], [3, 6, 9], [3, 5, 7], [4, 5, 6], [7, 8, 9]]
  player_check = false
  ai_check = false
  win.each do |n|
    if player_score.include? n[0] && player_score.include? n[1] && player_score.include? n[2]
      player_check = true
      player_win = true
      puts "You won!"
      break
    elsif ai_score.include? n[0] && ai_score.include? n[1] && ai_score.include? n[2]
      ai_check = true
      player_win = true
      puts "The AI won!"
      break
    end
  end
end
  def game_loop(x)
    while player_win == false && ai_win == false
      switch_turns
      check_win
      turn.x
    end
end

#holds the cells, winning combos
class Board
  attr_accessor :cells
  attr_reader :view_board 
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
  game.start
  game.turn_order
  game.board.view_board
  game.turn(game.board.cells)
  game.game_loop(game.board.cells)
  #board.view_board
  #game.turn(board.cells)
end
play