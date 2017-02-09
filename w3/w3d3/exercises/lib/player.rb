# responsible for translating user input into
# positions of the form `[x, y]`

class HumanPlayer
  attr_reader :name

  def initialize(name)
    @name = name
  end

  def get_play
    puts "Attack: 'Row, Col'"
    gets.chomp.split().map{|ele| ele.to_i }
  end

end
