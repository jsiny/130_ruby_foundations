class Prime
  @@primes = []

  def self.nth(num)
    num < 1 ? raise(ArgumentError) : number = 2

    while @@primes.size < num
      @@primes << number if prime?(number)
      number += 1
    end
    @@primes[num - 1]
  end

  def self.prime?(num)
    @@primes.none? { |prime| (num % prime).zero? }
  end
end

# Done in 18 min
