require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class DowncaseTest < MiniTest::Test
  def setup
    @other_str = 'abc'
    @expected = 'xyz'
  end

  def test_downcase
    assert_equal(@expected, 'XYZ'.downcase)
  end

  def test_different_other_downcase_string
    refute_equal(@other_str, 'XYZ'.downcase)
  end
end
