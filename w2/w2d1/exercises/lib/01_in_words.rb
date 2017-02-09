class Fixnum
  ONES_AND_TEENS = {
    0 => "zero",
    1 => "one",
    2 => "two",
    3 => "three",
    4 => "four",
    5 => "five",
    6 => "six",
    7 => "seven",
    8 => "eight",
    9 => "nine",
    10 => "ten",
    11 => "eleven",
    12 => "twelve",
    13 => "thirteen",
    14 => "fourteen",
    15 => "fifteen",
    16 => "sixteen",
    17 => "seventeen",
    18 => "eighteen",
    19 => "nineteen"
  }

  TENS = {
    20 => "twenty",
    30 => "thirty",
    40 => "forty",
    50 => "fifty",
    60 => "sixty",
    70 => "seventy",
    80 => "eighty",
    90 => "ninety"
  }

  def in_words
    numbers_to_name(self)
  end

  def numbers_to_name(n)
    case
    when (0...20).include?(n)
      output = ONES_AND_TEENS[n]
    when (20...100).include?(n)
      output = tens(n)
    when (100...1000).include?(n)
      output = hundreds(n)
    when (1000...1_000_000).include?(n)
      output = thousands(n)
    when (1_000_000...1_000_000_000).include?(n)
      output = millions(n)
    when (1_000_000_000...1_000_000_000_000).include?(n)
      output = billions(n)
    when (1_000_000_000_000...1_000_000_000_000_000).include?(n)
      output = trillions(n)
    else
      output = 'That # is too big!'
    end

    output.strip
  end

  def tens(n)
    if n % 10 == 0
      result = TENS[n]
    elsif (10...20).include?(n)
      result = ONES_AND_TEENS[n]
    else
      ones_value = n % 10
      tens_value = n - ones_value
      result = "#{TENS[tens_value]} #{ONES_AND_TEENS[ones_value]}"
    end

    result
  end

  def hundreds(n)
    first_digit = n / 100
    result = ''

    if first_digit > 10
      result = tens(first_digit).to_s + " hundred "
    else
      result = "#{ONES_AND_TEENS[first_digit]} hundred " unless first_digit == 0
    end

    remainder = n % 100
    result += numbers_to_name(remainder).to_s if remainder != 0

    result
  end

  def thousands(n)
    first_digit = n / 1000
    
    if first_digit > 10
      result = hundreds(first_digit).to_s + " thousand "
    else
      result = "#{ONES_AND_TEENS[first_digit]} thousand "
    end

    remainder = n % 1000
    result += numbers_to_name(remainder).to_s if remainder != 0

    result
  end

  def millions(n)
    first_digit = n / 1_000_000

    if first_digit > 10
      result = hundreds(first_digit).to_s + " million "
    else
      result = "#{ONES_AND_TEENS[first_digit]} million "
    end

    remainder = n % 1_000_000
    result += numbers_to_name(remainder).to_s if remainder != 0

    result
  end

  def billions(n)
    first_digit = n / 1_000_000_000

    if first_digit > 10
      result = hundreds(first_digit).to_s + " billion "
    else
      result = "#{ONES_AND_TEENS[first_digit]} billion "
    end

    remainder = n % 1_000_000_000
    result += numbers_to_name(remainder).to_s if remainder != 0

    result
  end

  def trillions(n)
    first_digit = n / 1_000_000_000_000

    if first_digit > 10
      result = hundreds(first_digit).to_s + " trillion "
    else
      result = "#{ONES_AND_TEENS[first_digit]} trillion "
    end

    remainder = n % 1_000_000_000_000
    result += numbers_to_name(remainder).to_s if remainder != 0

    result
  end

end
