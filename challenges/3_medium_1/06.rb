class School
  attr_accessor :school

  def initialize
    @school = Hash.new { |_, grade| school[grade] = [] }
  end

  def to_h
    school.keys.sort.each_with_object({}) do |num, clone|
      clone[num] = grade(num)
    end
  end

  def add(name, grade)
    @school[grade] << name
  end

  def grade(num)
    school[num].sort
  end
end

# Done in 25 min
