class SecretHandshake
  COMMANDS = { 1 => 'wink', 10 => 'double blink', 100 => 'close your eyes',
               1000 => 'jump', 10_000 => :reverse }

  def initialize(num)
    @binary_number = num.to_i.to_s(2).to_i
    @digits = @binary_number.digits
  end

  def commands
    result = []
    @digits.each_with_index do |n, i|
      n.zero? ? next : result << COMMANDS[n * 10**i]
    end

    result.include?(:reverse) ? result.reverse[1..-1] : result
  end
end

# Done in 35 min
