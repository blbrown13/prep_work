def is_vowel?(letter)
  vowels = %w(a e i o u)
  is_vowel = false

  if vowels.include?(letter.downcase)
    is_vowel = true
  end

  is_vowel
end


def has_vowel?(word)
  vowels = %w(a e i o u)
  has_vowel = false
  word = word.split('')

  word.each do |letter|
    if(is_vowel?(letter))
      has_vowel = true
      break
    end
  end

  has_vowel
end


def translate(string)
  words = string
  words = words.split(" ")
  pig_words = []

  words.each do |word|
    if has_vowel?(word)
      if is_vowel?(word[0])
        word = "#{word}ay"
      else
        word.each_char.with_index do |char,index|
          if is_vowel?(char)
            unless word[index-1] == 'q'
              word = "#{word[index..-1]}#{word[0...index]}ay"
              break
            else
              word = "#{word[index+1..-1]}#{word[0..index]}ay"
              break
            end
          end
        end
      end
    else
      word = "#{word}ay"
    end

    pig_words << word
  end

  pig_words.join(' ')
end




# vowel start: word + ay
# consonant start: first vowel + up to first vowel + ay
