class ComputerPlayer
  attr_accessor :name, :board, :mark

  def initialize(name)
    @name = name
    # @mark = :O
  end

  def display(board)
    @board = board
  end

  def get_move
    winning_move = get_winning_move
    return winning_move ? winning_move : get_random_move
  end

  def winning_combo(combo)
    has_winning_move = combo.count(nil) == 1 && combo.count(@mark) == combo.length - 1
    return has_winning_move ? combo.index(nil) : nil
  end

  def get_winning_move
    grid = @board.grid
    # for a winning move, there are 2 conditions:
    # 1. combo exactly one nil
    #  2. all other elements in combo have mark belonging to computer player

    # find -- combos
    #     @board.grid.each_with_index do |row, index|
    #       has_winning_move = row.count(nil) == 1 && row.count(@mark) == row.length - 1
    #       return [index, row.index(nil)] if has_winning_move
    #     end
    grid.each_with_index do |row, index|
      row_win_index = winning_combo(row)
      return [index, row_win_index] if row_win_index
    end

    # find | combos
    #     grid.transpose.each_with_index do |col, index|
    #       has_winning_move = col.count(nil) == 1 && col.count(@mark) == col.length - 1
    #       return [col.index(nil), index] if has_winning_move
    #     end
    grid.transpose.each_with_index do |col, index|
      col_win_index = winning_combo(col)
      return [col_win_index, index] if col_win_index
    end

    # find \ combos
    diag = [(0...grid.length).collect {|i| grid[i][i] }]
    diag_win_index = winning_combo(diag)
    return [diag_win_index, diag_win_index] if diag_win_index

    # find / combos
    anti_diag = [(0...grid.length).collect {|i| grid[i][grid.length - 1 - i] }]
    anti_diag_win_index = winning_combo(anti_diag)
    return [anti_diag.length - 1 - anti_diag_win_index, anti_diag_win_index] if anti_diag_win_index

    false
  end

  def get_random_move
    random_rows = []
    @board.grid.each_with_index do |row, index|
      random_rows << [row,index] if row.include?(nil)
    end
    random_row = random_rows[rand(0...random_rows.length)]

    random_cols = []
    random_row[0].each_with_index do |col, index|
      random_cols << [col,index] if col.nil?
    end
    random_col = random_cols[rand(0...random_cols.length)]

    [random_row[1], random_col[1]]
  end

end
