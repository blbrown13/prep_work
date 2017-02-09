class Dictionary

  attr_accessor :entries

  def initialize
    @entries = {}
  end

  def add(entry)
    entry.is_a?(String) ?
      @entries[entry] = nil :
      (@entries.merge!(entry) if entry.is_a?(Hash))
  end


  def keywords
    key_list = []
    @entries.each_key.each_with_object(key_list){|word| key_list << word.to_s}
    key_list.sort
  end

  def include?(entry)
    @entries.has_key?(entry)
  end

  def find(search_word)
    @entries.select do |keyword|
      keyword.include?(search_word)
    end
  end

  def printable
    print_result = []
    keywords.each do |key_word|
      print_result << "[#{key_word}] \"#{@entries[key_word]}\""
    end
    print_result.join("\n")
  end

end
