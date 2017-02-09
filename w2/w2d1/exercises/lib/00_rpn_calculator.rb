class RPNCalculator
  OPERATORS = [:+,:-,:/,:*]

  attr_accessor :stack

  def initialize
    @stack = []
  end

  def push(num)
    @stack << num
  end

  def plus
    calculate(OPERATORS[0])
  end

  def minus
    calculate(OPERATORS[1])
  end

  def divide
    calculate(OPERATORS[2])
  end

  def times
    calculate(OPERATORS[3])
  end

  def value
    @stack.last
  end

  def evaluate(string)
    tokens(string).each do |token|
      if token.is_a?(Integer)
        push(token)
      elsif token.is_a?(Symbol)
        calculate(token)
      end
    end

    return value
  end

  def calculate(token)
    raise "calculator is empty" if @stack.count < 2

    second_num = @stack.pop
    first_num = @stack.pop

    if token == OPERATORS[0] # :+
      addition = first_num + second_num
      @stack << addition
    elsif token == OPERATORS[1] # :-
      subtract = first_num - second_num
      @stack << subtract
    elsif token == OPERATORS[2] # :/
      divide = first_num.to_f / second_num.to_f
      @stack << divide
    elsif token == OPERATORS[3] # :*
      multiply = first_num * second_num
      @stack << multiply
    else
      raise "Operator '#{token}' is invalid"
      @stack << first_num
      @stack << second_num
    end
  end

  def tokens(string)
    tokens = string.delete(' ').each_char.map do |char|
      OPERATORS.include?(char.to_sym) ?
        char.to_sym : char.to_i
    end
    tokens
  end
end
