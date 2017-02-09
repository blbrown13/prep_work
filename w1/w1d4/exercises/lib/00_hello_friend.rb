class Friend
  # TODO: your code goes here!
  def greeting(someone = nil)
    if someone == nil
      "Hello!"
    else
      "Hello, #{someone}!"
    end
  end
end
