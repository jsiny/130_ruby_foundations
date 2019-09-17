require 'date'

class Meetup
  attr_accessor :date

  START_DAY = { first: 1, second: 8, teenth: 13,
                third: 15, fourth: 22, last: -7 }

  def initialize(month, year)
    @month = month
    @year = year
  end

  def day(weekday, schedule)
    @day = START_DAY[schedule]
    @date = Date.new(@year, @month, @day)
    find_weekday(weekday)
    date
  end

  def find_weekday(day)
    weekday = (day.to_s + '?').to_sym
    self.date += 1 until date.send weekday
  end
end

# Done in 45 min
