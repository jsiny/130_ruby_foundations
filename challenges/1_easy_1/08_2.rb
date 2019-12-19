class Phrase
  def initialize(sentence)
    @sentence = sentence
  end

  def word_count
    words = @sentence.downcase.gsub(/\W[']?\W/, ' ').gsub(/[.,]/, ' ').split
    
    count = Hash.new(0)

    words.each do |word|
      count[word.downcase] += 1
    end

    count
  end


end

phrase = Phrase.new("First: don't laugh. Then: don't cry.")
p phrase.word_count

# - split the sentence into words accounting for diff situations
# - remove any symbol that are not within the word
# - count the occurrences
# - return a hash