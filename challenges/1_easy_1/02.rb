class Sieve
  def initialize(max)
    @max = max
    @range = (2..@max).to_a
  end

  def primes
    @range.each do |prime|
      next unless prime
      break if (num = prime**2) > @max

      while num <= @max
        @range[num - 2] = nil
        num += prime
      end
    end

    @range.compact
  end
end
