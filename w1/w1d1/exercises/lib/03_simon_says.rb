def echo(word)
  word
end

def shout(word)
  word.upcase
end

def repeat(word,n=2)
  words = []
  n.times {words << word}
  words.join(" ")
end

def start_of_word(word, n)
  word[0...n]
end


def first_word(words)
  words.split(" ").first
end


def titleize(string)
  lowercase_words = %w(the and over in of)

  words = string.split(" ")
  words.each {|word|
    word.capitalize! unless lowercase_words.include?(word)
  }
  words.first.capitalize!

  words.join(" ")
end
