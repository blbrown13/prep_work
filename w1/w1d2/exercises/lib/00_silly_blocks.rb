def reverser(&prc)
  string = yield
  words = string.split(" ")
  words.collect do |word|
    word.reverse!
  end

  words.join(" ")
end


def adder(num=1, &prc)
  yield + num
end



def repeater(n=1, &prc)
  n.times {yield}
end
