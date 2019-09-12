class Series
  def initialize(numbers)
    @numbers = numbers.split('').map(&:to_i)
  end

  def slices(count)
    raise ArgumentError if count > @numbers.size

    @numbers.each_cons(count).to_a
  end
end
