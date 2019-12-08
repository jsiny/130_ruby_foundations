class Bst
  attr_reader :data, :left, :right

  def initialize(data)
    @data = data
  end

  def insert(new)
    if new > data
      @right.nil? ? @right = Bst.new(new) : @right.insert(new)
    else
      @left.nil?  ? @left = Bst.new(new)  : @left.insert(new)
    end
  end

  def each(&block)
    return to_enum unless block_given?

    left&.each(&block)
    yield(data)
    right&.each(&block)
  end
end
