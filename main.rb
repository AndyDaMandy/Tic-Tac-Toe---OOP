class Board
  attr_accessor :one, :two, :three
  @one = ["1", "|", "2", "|", "3"]
  @two = ["4", "|", "5", "|", "6"]
  @three = ["7", "|", "8", "|", "9"]
  def show
    puts @one
  end
end
Board.show