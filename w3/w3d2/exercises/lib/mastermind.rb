
class Code
  PEGS = {
    'R'=> :red,
    'G'=> :green,
    'B'=> :blue,
    'Y'=> :yellow,
    'O'=> :orange,
    'P'=> :purple
  }

  attr_reader :pegs

  def self.parse(input_string)
    pegs = input_string.each_char.map do |char|
      raise "Input Error" unless PEGS.has_key?(char.upcase)
      PEGS[char.upcase]
    end

    Code.new(pegs)
  end

  def self.random
    pegs = Array.new(4)
    pegs << PEGS.values.sample until pegs.count == 4
    Code.new(pegs)
  end

  def initialize(pegs)
    @pegs = pegs
  end

  def [](i)
    pegs[i]
  end

  def exact_matches(other_code)
    exact_matches = 0
    pegs.each_with_index do |peg, idx|
      exact_matches += 1 if self[idx] == other_code[idx]
    end

    exact_matches
  end

  def near_matches(other_code)
    other_color_counts = other_code.color_counts

    near_matches = 0
    self.color_counts.each do |color, count|
      if other_color_counts.has_key?(color)
        near_matches += [count, other_color_counts[color]].min
      else
        next
      end
    end

    near_matches - self.exact_matches(other_code)
  end

  def ==(other_code)
    if other_code.is_a?(Code)
      self.pegs == other_code.pegs
    else
      false
    end
  end

  protected

  def color_counts
    color_counts = Hash.new(0)

    @pegs.each do |color|
      color_counts[color] += 1
    end

    color_counts
  end
end

class Game
  attr_accessor :secret_code, :guesses

  def initialize(secret_code = Code.random)
    @secret_code = secret_code
  end

  def play
    10.times do
      guess = get_guess
      if won?(guess)
        puts "You won!"
        return
      end
      display_matches(guess)
    end
    puts "You lost. The code was: #{@secret_code.pegs}"
  end

  def get_guess
    puts "Guess secret code:"
    Code.parse(gets.chomp)
  end

  def display_matches(guess)
    exact_matches = @secret_code.exact_matches(guess)
    near_matches = @secret_code.near_matches(guess)

    puts "exact matches #{exact_matches}"
    puts "near matches #{near_matches}"
  end

end

if __FILE__ == $PROGRAM_NAME
  Game.new.play
end
