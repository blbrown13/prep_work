class Board
  attr_reader :grid

  def initialize(grid = default_board)
    @grid = grid
  end

  def default_board
    default_board = Array.new(3) { Array.new(3) }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

  def place_mark(pos, mark)
    self[pos] = mark if empty?(pos)
    # refactor for unsuccessful moves
  end

  def empty?(pos)
    self[pos].nil?
  end

  def over?
    winner ? true : tied?
  end

  def winner
    # create big array using concat
    # transform columns into rows using transpose,
    # create both diagonals array
    winner_check = @grid +
                   @grid.transpose +
                   # adds both diagonals
                   [(0...@grid.length).collect {|i| @grid[i][i] }] +
                   [(0...@grid.length).collect {|i| @grid[i][@grid.length-1-i] }]

    # then check all rows, columns, and diagonals using each
    winner_check.each do |row|
      if row.uniq.length == 1 && !row.uniq[0].nil?
        return row.uniq[0]
      end
    end

    return nil
  end

  def tied?
    !@grid.flatten.include?(nil)
  end

  def display
    puts @grid
    # system('clear')
    # puts "BOARD"
    # @grid.each {|r| p r}
    # puts
  end


end
