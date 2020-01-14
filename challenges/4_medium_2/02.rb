class WordProblem
  @@operations = { 'plus'  => :+,   'multiplied' => :*, 
                   'minus' => :-,   'divided'    => :/ }

  def initialize(problem)
    @problem = problem
    @nums    = @problem.scan(/-?\d+/).map(&:to_i)
    @op      = @problem.scan(/(plus|minus|multiplied|divided)/).flatten
    raise ArgumentError unless valid_problem?
  end

  def answer
    @nums.reduce { |result, num| result.send(@@operations[@op.shift], num) }
  end

  def valid_problem?
    @nums.size >= 2 && @nums.size == @op.size + 1
  end
end
