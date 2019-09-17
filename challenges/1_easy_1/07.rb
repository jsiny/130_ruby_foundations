# rubocop:disable Layout/EmptyLineAfterGuardClause

class DNA
  def initialize(strand)
    @strand = strand
  end

  def hamming_distance(other)
    distance = 0

    @strand.chars.each_with_index do |acid, i|
      break if other[i].nil?
      distance += 1 if acid != other[i]
    end

    distance
  end
end

# rubocop:enable Layout/EmptyLineAfterGuardClause

# Done in 8 min
