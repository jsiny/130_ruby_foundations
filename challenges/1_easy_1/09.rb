# rubocop:disable Layout/EmptyLineAfterGuardClause
class PerfectNumber
  def self.classify(num)
    num.positive? ? @num = num : raise(RuntimeError)
    @sum_of_divisors = sum_of_divisors
    display_classification
  end

  def self.sum_of_divisors
    (1...@num).inject(0) do |sum, element|
      (@num % element).zero? ? sum + element : sum
    end
  end

  def self.display_classification
    return 'perfect' if @sum_of_divisors == @num
    @sum_of_divisors > @num ? 'abundant' : 'deficient'
  end
end
# rubocop:enable Layout/EmptyLineAfterGuardClause
