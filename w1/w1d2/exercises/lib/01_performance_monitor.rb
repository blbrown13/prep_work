def measure(n=1,&prc)

  total_time = 0

  n.times do
    start = Time.now
    prc.call
    total_time += (Time.now - start)
  end

  total_time / n
end
