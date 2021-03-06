class Scrabble
  SCORE = { 1 => %w(A E I O U L N R S T), 2 => %w(D G), 3 => %w(B C M P),
            4 => %w(F H V W Y), 5 => %w(K), 8 => %w(J X), 10 => %w(Q Z) }

  def initialize(word)
    @word = word
  end

  def score
    return 0 if @word.nil?

    @word.gsub(/[^a-z]/i, '').chars.inject(0) do |sum, char|
      SCORE.select { |_, v| v.include? char.upcase }.keys.first + sum
    end
  end

  def self.score(word)
    new(word).score
  end
end

# Done in 16 min
