require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NumericTest < Minitest::Test
  def setup
    @value = Numeric.new
  end

  def test_numeric
    assert_instance_of Numeric, @value
  end
end
