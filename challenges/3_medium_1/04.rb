class Translation
  # rubocop:disable Layout/AlignHash
  PROTEINS = {
    'Methionine'    => ['AUG'],
    'Phenylalanine' => ['UUU', 'UUC'],
    'Leucine'       => ['UUA', 'UUG'],
    'Serine'        => ['UCU', 'UCC', 'UCA', 'UCG'],
    'Tyrosine'      => ['UAU', 'UAC'],
    'Cysteine'      => ['UGU', 'UGC'],
    'Tryptophan'    => ['UGG'],
    'STOP'          => ['UAA', 'UAG', 'UGA']
  }
  # rubocop:enable Layout/AlignHash

  def self.of_codon(codon)
    PROTEINS.each do |protein, codons|
      return protein if codons.include?(codon)
    end
    raise InvalidCodonError
  end

  def self.of_rna(strand)
    strand.scan(/.../).each_with_object([]) do |codon, rna|
      return rna if of_codon(codon) == 'STOP'

      rna << of_codon(codon)
    end
  end
end

class InvalidCodonError < StandardError; end

# Done in approx. an hour
