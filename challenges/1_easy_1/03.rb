class Octal
  def initialize(octal)
    @octal = set_valid_octal(octal)
    @digits = @octal.digits
  end

  def valid_octal(str)
    str =~ /[^0-7]/ ? 0 : str.to_i
  end

  def to_decimal
    @digits.map.with_index { |n, i| n * 8**i }.sum
  end
end

# Done in ~20 min
