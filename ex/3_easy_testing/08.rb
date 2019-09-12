require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NumericTest < Minitest::Test
  def setup
    @numeric = Numeric.new
    @int = 5
    @float = 4.45
  end

  def test_numeric_subclasses
    [@numeric, @int, @float].each { |num| assert_kind_of Numeric, num }
  end
end
