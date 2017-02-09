# A `Board` class with an underlying `grid` (a two-dimensional Array),
# where each element in a row represents a ship, open water, or a space
# that has already been attacked. I used the symbol `:s` to represent an
# undamaged ship (or ship segment), `nil` for empty space, and `:x` to
# represent a destroyed space.

class Board
  attr_reader :grid

  def initialize(grid = Board.default_grid)
    @grid = grid
  end

  def self.default_grid
    return Array.new(10) { Array.new(10) {nil} }
  end

  def [](pos)
    row, col = pos
    @grid[row][col]
  end

  def []=(pos, mark)
    row, col = pos
    @grid[row][col] = mark
  end

  def count
    # returns the number of valid targets (ships) remaining
    @grid.flatten.count(:s)
  end

  def empty?(pos = nil)
    # @grid[pos[0]][pos[1]].nil?
    pos ? self[pos].nil? : self.count == 0
  end

  def full?
    @grid.flatten.count(nil) == 0
  end

  def place_random_ship()
    random_rows = []
    @grid.each_with_index do |row, index|
      random_rows << [row,index] if row.include?(nil)
    end
    random_row = random_rows.sample

    random_cols = []
    random_row[0].each_with_index do |col, index|
      random_cols << [col,index] if col.nil?
    end
    random_col = random_cols.sample

    raise 'Board full' if self.full?
    self[[random_row[1], random_col[1]]] = :s
  end

  def populate_grid
    # to randomly distribute ships across the board
  end

  def in_range?(pos)
  end

  def won?
    self.empty?
  end

  def display
    # prints the board, with marks on any spaces that
    # have been fired upon.
    @grid
  end

end
