class Book
  # TODO: your code goes here!

  attr_reader :title

  def title=(title)
    lowercase_words = %w(the and in of a an)

    words = title.split(" ")
    words.map do |word|
      word.capitalize! unless lowercase_words.include?(word)
    end
    words.first.capitalize!

    @title = words.join(" ")
  end

end
