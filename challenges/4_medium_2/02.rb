class WordProblem
  @@ops = { 'plus' => :+, 'multiplied' => :*, 'minus' => :-, 'divided' => :/ }

  def initialize(s)
    @nums = s.scan(/-?\d+/).map(&:to_i)
    @op   = s.scan(/(plus|minus|multiplied|divided)/).map { |op| @@ops[op[0]] }
    raise ArgumentError unless valid_problem?
  end

  def answer
    @nums.reduce { |result, num| result.send(@op.shift, num) }
  end

  def valid_problem?
    @nums.size >= 2 && @nums.size == @op.size + 1
  end
end
