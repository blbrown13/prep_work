def add(n1, n2)
  n1 + n2
end

def subtract(n1, n2)
  n1 - n2
end

def sum(arr)
  return arr.length == 0 ? 0 : arr.inject(:+)
end

def multiply(*nums)
  nums.reduce(&:*)
end
