class Timer
  attr_accessor :seconds

  def initialize(seconds=0)
    @seconds = seconds
  end

  def time_string
    s = seconds % 60
    m = ((seconds%3600)/60).floor
    h = (seconds/3600).floor

    s = "0#{s}" if s < 10
    m = "0#{m}" if m < 10
    h = "0#{h}" if h < 10

    "#{h}:#{m}:#{s}"
  end
end


# Aponiautarkiataraxia
#
# Autarkiaponiataraxia
