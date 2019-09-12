require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class IncludedArrayTest < Minitest::Test
  def setup
    @list = []
    @str = 'xyz'
  end

  def test_value_included
    @list << @str
    assert_includes @list, @str
  end
end
