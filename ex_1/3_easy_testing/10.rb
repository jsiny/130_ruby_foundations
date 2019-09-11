require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class ListTest < Minitest::Test
  def setup
    @list = []
    @value = 'xyz'
  end

  def test_refute_inclusion
    refute_includes @list, @value
  end
end
