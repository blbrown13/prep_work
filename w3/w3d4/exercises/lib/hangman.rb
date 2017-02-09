class Hangman
  attr_reader :guesser, :referee, :board

  def initialize(players)
    @guesser = players[:guesser]
    @referee = players[:referee]
  end

  def play
    setup
    take_turn unless won?
  end

  def setup
    secret_length = @referee.pick_secret_word
    @guesser.register_secret_length(secret_length)
    @board = Array.new(secret_length)
  end

  def take_turn
    guess = @guesser.guess(@board)
    indices = @referee.check_guess(guess)
    @referee.check_guess(@guesser.guess)
    update_board(guess, indices)
    @guesser.handle_response(guess, indices)
  end

  def update_board(guess, indices)
    indices.each { |index| @board[index] = guess }
  end

  def won?
    @board.all?
  end
end


class HumanPlayer
  def register_secret_length(length)
    # puts length
  end

  def guess(board)
    # puts board
    # puts "Guess:"
    # gets.chomp
  end

  def check_guess(guess)
    # puts guess
  end

  def require_secret
    # puts "Choose word:"
    # gets.chomp
  end
end


class ComputerPlayer

  attr_reader :candidate_words

  def initialize(dictionary)
    @dictionary = dictionary
  end

  def pick_secret_word
    @secret_word = @dictionary.sample
    @secret_word.length
  end

  def check_guess(guess)
    # return indices if word includes letter
    index_list = []
    @secret_word.split('').each_with_index do |char,index|
      index_list << index if char == guess
    end

    index_list
  end

  def register_secret_length(secret_length)
    @candidate_words = @dictionary.select {|word| word.length == secret_length}
  end

  def guess(board)
    letter_frequency = Hash.new(0)

    @candidate_words.each do |word|
      board.each_with_index do |letter, index|
        letter_frequency[word[index]] += 1 if letter.nil?
      end
    end

    letter = letter_frequency.max_by { |letter, count| count}[0]
  end

  def handle_response(guess, response_indices)

    @candidate_words.reject! do |word|
      should_delete = false

      word.each_char.each_with_index do |letter, index|
        if (letter == guess) && (!response_indices.include?(index))
          should_delete = true
          break
        elsif (letter != guess) && (response_indices.include?(index))
          should_delete = true
          break
        end
      end

      should_delete
    end
  end

end
