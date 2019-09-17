class CircularBuffer
  attr_accessor :queue

  def initialize(size)
    @size = size
    @queue = []
  end

  def read
    queue.shift || raise(BufferEmptyException)
  end

  def write(element)
    add(element) { raise BufferFullException }
  end

  def write!(element)
    add(element) { queue.shift }
  end

  def clear
    self.queue = []
  end

  # rubocop:disable Layout/EmptyLineAfterGuardClause
  def add(element)
    return if element.nil?
    yield if queue.size == @size
    queue << element
  end
  # rubocop:enable Layout/EmptyLineAfterGuardClause

  class BufferEmptyException < StandardError; end
  class BufferFullException < StandardError; end
end

# Done in 50 min
