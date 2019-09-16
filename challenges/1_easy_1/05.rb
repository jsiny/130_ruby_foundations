class SumOfMultiples
  attr_accessor :multiples

  def initialize(*multiples)
    @multiples = multiples.empty? ? [3, 5] : multiples
  end

  def to(max)
    (1...max).inject(0) do |acc, num|
      @multiples.any? { |mult| (num % mult).zero? } ? num + acc : acc
    end
  end

  def self.to(max)
    new.to(max)
  end
end

# Done in 20 min
