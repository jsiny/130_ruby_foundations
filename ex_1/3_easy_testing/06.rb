require 'minitest/autorun'
require 'minitest/reporters'
Minitest::Reporters.use!

class NoExperienceError < StandardError; end

class Employee
  def hire
    raise(NoExperienceError)
  end
end

class EmployeeTest < Minitest::Test
  def test_experience
    assert_raises NoExperienceError do
      Employee.new.hire
    end
  end
end
