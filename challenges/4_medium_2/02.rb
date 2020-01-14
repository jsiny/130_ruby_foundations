class WordProblem
  OPS = { 'plus' => :+, 'multiplied' => :*, 'minus' => :-, 'divided' => :/ }

  def initialize(str)
    @nums = str.scan(/-?\d+/).map(&:to_i)
    @op   = str.scan(/(plus|minus|multiplied|divided)/).map { |op| OPS[op[0]] }
    raise ArgumentError unless valid_problem?
  end

  def answer
    @nums.reduce { |result, num| result.send(@op.shift, num) }
  end

  def valid_problem?
    @nums.size >= 2 && @nums.size == @op.size + 1
  end
end
