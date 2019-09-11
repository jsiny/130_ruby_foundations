require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class OddTest < MiniTest::Test
  def setup
    @value = 4
  end

  def test_odd
    assert @value.odd?, 'value is not odd'
  end
end
