class Clock
  attr_reader :time_in_minutes

  MIN_PER_HOUR  = 60
  MIN_PER_DAY   = 1440

  def initialize(hour, min = 0)
    @time_in_minutes = (hour * MIN_PER_HOUR + min) % MIN_PER_DAY
  end

  class << self
    alias at new
  end

  def to_s
    hour, min = time_in_minutes.divmod(MIN_PER_HOUR)
    format('%02d:%02d', hour, min)
  end

  def +(minutes)
    Clock.new(0, time_in_minutes + minutes)
  end

  def -(minutes)
    self.+(- minutes)
  end

  def ==(other)
    time_in_minutes == other.time_in_minutes
  end
end

# Done in an hour
