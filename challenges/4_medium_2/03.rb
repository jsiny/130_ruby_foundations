class Triangle
  attr_reader :rows

  def initialize(height)
    @rows = (1..height).map { next_row }
  end

  private

  def next_row
    new_row = @previous_row ? [0, *@previous_row, 0] : [0, 1]
    @previous_row = new_row.each_cons(2).map { |a, b| a + b }
  end
end

# Beautiful solution by Pete