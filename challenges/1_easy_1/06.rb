class Anagram
  def initialize(anagram)
    @anagram = anagram
    @chars = refine(@anagram)
  end

  def match(words)
    words.select { |word| anagram?(word) }
  end

  def anagram?(word)
    @chars == refine(word) && word.downcase != @anagram.downcase
  end

  def refine(word)
    word.downcase.split('').sort
  end
end

# Done in 15 min
