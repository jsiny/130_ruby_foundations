class PigLatin
  def self.translate(words)
    words.split.map do |word|
      start_with_vowel?(word) ? word + 'ay' : split_for_consonants(word)
    end.join(' ')
  end

  def self.start_with_vowel?(word)
    word =~ /\b([aeiou]+|[xy])[^aeiou]/
  end

  def self.split_for_consonants(word)
    cons_split = /\b([^aeiou]*qu|[^aeiou]+)([aeiou].*)/.match(word)
    cons_split[2] + cons_split[1] + 'ay'
  end
end

# Done in 35 min (but with hint on the usage of regexes)
