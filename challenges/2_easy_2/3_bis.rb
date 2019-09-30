class BeerSong
  class ManyBottles
    def self.verse(num)
      "#{num} bottles of beer on the wall, #{num} bottles of beer.\n"\
      "Take one down and pass it around, #{num - 1} bottles of beer on "\
      "the wall.\n"
    end
  end

  class TwoBottles
    def self.verse(_)
      "2 bottles of beer on the wall, 2 bottles of beer.\n" \
      "Take one down and pass it around, 1 bottle of beer on the wall.\n"
    end
  end

  class OneBottle
    def self.verse(_)
      "1 bottle of beer on the wall, 1 bottle of beer.\n"\
      "Take it down and pass it around, no more bottles of beer on the wall.\n"
    end
  end

  class NoBottle
    def self.verse(_)
      "No more bottles of beer on the wall, no more bottles of beer.\n"\
      "Go to the store and buy some more, 99 bottles of beer on the wall.\n"
    end
  end

  edge_cases = { 0 => NoBottle, 1 => OneBottle, 2 => TwoBottles }
  BOTTLE_CLASS = Hash.new(ManyBottles).merge(edge_cases)

  def verse(num)
    BOTTLE_CLASS[num].verse(num)
  end

  def verses(max, min)
    (min..max).reverse_each.map { |n| verse(n) }.join("\n")
  end

  def lyrics
    verses(99, 0)
  end
end
