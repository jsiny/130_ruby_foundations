class Trinary
  def initialize(number)
    @trinary = valid_trinary(number)
    @digits = @trinary.digits
  end

  def valid_trinary(number)
    number =~ /[^0-2]/ ? 0 : number.to_i
  end

  def to_decimal
    @digits.map.with_index { |n, i| n * 3**i }.sum
  end
end

# Done in 6 min (but very similar to previous exercise)
