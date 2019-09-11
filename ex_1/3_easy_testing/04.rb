require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class EmptyArrayTest < Minitest::Test
  def setup
    @empty_list = []
    @not_empty_list = [1, 2, 3]
  end

  def test_empty_list
    assert_empty @empty_list
  end

  def test_full_list
    refute_equal [], @not_empty_list
  end
end
