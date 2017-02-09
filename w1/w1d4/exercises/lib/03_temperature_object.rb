class Temperature

  attr_accessor :fahrenheit, :celsius, :temperature

  def initialize(options)
    self.fahrenheit = options[:f] if options[:f]
    self.celsius = options[:c] if options[:c]
  end

  def self.from_fahrenheit(temp)
    self.new(f: temp)
  end

  def self.from_celsius(temp)
    self.new(c: temp)
  end

  def self.ftoc(temp)
    (temp - 32) * (5.0/9.0)
  end

  def self.ctof(temp)
    (9.0/5.0 * temp) + 32
  end

  def in_fahrenheit
    self.class.ctof(@temperature)
  end

  def in_celsius
    @temperature
  end

  def fahrenheit=(temp)
    @temperature = self.class.ftoc(temp)
  end

  def celsius=(temp)
    @temperature = temp
  end
  
end


class Celsius < Temperature
  def initialize(temp)
    self.celsius = temp
  end
end


class Fahrenheit < Temperature
  def initialize(temp)
    self.fahrenheit = temp
  end
end
