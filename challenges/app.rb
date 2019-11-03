class Clock
  attr_reader :total_minutes

  def initialize(hour, minutes = 0)
    @hour = hour
    @minutes = minutes
    @total_minutes = (@hour * 60 + @minutes) % 1440
  end

  class << self
    alias :at :new   
  end

  def to_s
    hours, minutes = hours_and_minutes(@total_minutes)
    format("%02d:%02d", hours, minutes)    
  end

  def +(minutes)
    new_minutes = @total_minutes + minutes
    hours, minutes = hours_and_minutes(new_minutes)

    Clock.at(hours, minutes)  
  end

  def -(minutes)
    self + (- minutes)
  end

  def ==(clock)
    @total_minutes == clock.total_minutes
  end

  private

  def hours_and_minutes(total_minutes)
    total_minutes.divmod(60)
  end
end

# p Clock.at(8, 20).to_s