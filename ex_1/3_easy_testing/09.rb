require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class List
  def process
    # some things happen
    self
  end
end

class ListProcessTest < Minitest::Test
  def setup
    @list = List.new
  end

  def test_list_process
    assert_same @list, @list.process
  end
end
