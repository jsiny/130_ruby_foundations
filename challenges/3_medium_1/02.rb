class Luhn
  def initialize(num)
    @number = num
  end

  def addends
    @number.digits.map.with_index do |n, i|
      if i.odd?
        n < 5 ? n * 2 : n * 2 - 9
      else
        n
      end
    end.reverse
  end

  def checksum
    addends.sum
  end

  def valid?
    (checksum % 10).zero?
  end

  def self.create(num)
    result = num * 10
    result += 1 until Luhn.new(result).valid?
    result
  end
end

# Done in 25 min
