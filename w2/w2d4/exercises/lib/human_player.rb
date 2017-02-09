class HumanPlayer

  attr_accessor :name, :board, :mark

  def initialize(name)
    @name = name
    # @mark = :X
  end

  def get_move
    puts "Where? Enter: 'Row Col'"
    move = gets.chomp.split().map{|ele| ele.to_i }
  end

  def display(board)
    puts board.grid
  end

end
