require_relative 'board'
require_relative 'player'

# BattleshipGame class to enforce rules and run the game. The game
# should keep a reference to the Player, as well as the Board.

class BattleshipGame
  attr_accessor :player, :board

  def initialize(player,board)
    @player = player
    @board = board
  end

  def play
    play_turn until game_over?
  end

  def play_turn
  # gets a guess from the player and makes an attack
    attack(@player.get_play)
  end

  def game_over?
    @board.won?
  end

  def attack(pos)
  # Marks the board at pos, destroying
  # or replacing any ship that might be there.
    @board[pos] = :x
  end

  def count
    @board.count
  end

  def display_status
  # Prints information on the current state of the game,
  # including board state and the number of ships remaining.
    @board.display
    puts "Number of ships remaining: #{count}"
  end

end
