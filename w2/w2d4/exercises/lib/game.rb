require_relative 'board'
require_relative 'human_player'
require_relative 'computer_player'

class Game

  attr_accessor :board, :player_one, :player_two, :current_player

  def initialize(player_one, player_two)
    @board = Board.new
    @player_one = player_one
    @player_two = player_two
    @player_one.mark = :X
    @player_two.mark = :O
    ## uncomment in order to play
    # @player_one.board = @board
    # @player_two.board = @board
    @current_player = player_one
  end

  def switch_players!
    @current_player = @current_player == player_one ?
      player_two : player_one
  end

  def play_turn
    # @board.display
    @board.place_mark(@current_player.get_move, @current_player.mark)
    switch_players!
  end

  def play
    # puts "Let's play Tic-Tac-Toe!!\n#{player_one.name} vs #{player_two.name}\n"
    play_turn until board.over?
    @board.display
    # puts "#{@board.winner} wins!"
  end

end

# creates and plays a new game
# p1 = HumanPlayer.new('Hooman')
# p2 = ComputerPlayer.new('Skynet')
# game = Game.new(p1,p2).play
