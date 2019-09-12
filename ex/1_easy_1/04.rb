require 'prime'

def divisors(num)
  prime_divisors = (Prime.prime_division(num).flatten.sort << num).uniq
  divisors = prime_divisors.clone

  prime_divisors[1...-1].each do |x|
    prime_divisors[1...-1].each do |y|
      z = x * y
      divisors << z if (num % z).zero?
    end
  end

  divisors.sort.uniq
end

p divisors(1) == [1]
p divisors(7) == [1, 7]
p divisors(12) == [1, 2, 3, 4, 6, 12]
p divisors(98) == [1, 2, 7, 14, 49, 98]
p divisors(99400891) == [1, 9967, 9973, 99400891]
p divisors(999962000357) == [1, 999979, 999983, 999962000357]
