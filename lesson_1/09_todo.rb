class Todo
  DONE_MARKER = 'X'
  UNDONE_MARKER = ' '

  attr_accessor :title, :description, :done

  def initialize(title, description='')
    @title = title
    @description = description
    @done = false
  end

  def done!
    self.done = true
  end

  def done?
    done
  end

  def undone!
    self.done = false
  end

  def to_s
    "[#{done? ? DONE_MARKER : UNDONE_MARKER}] #{title}"
  end
end

class TodoList
  attr_accessor :title

  def initialize(title)
    @title = title
    @todos = []
  end

  def add(to_do)
    raise TypeError, "Can only add Todo objects" unless to_do.instance_of? Todo
    @todos << to_do
  end
  alias_method :<<, :add

  def size
    @todos.size
  end

  def first
    @todos.first
  end

  def last
    @todos.last
  end

  def to_a
    @todos.clone
  end

  def done?
    @todos.all?(&:done?)
  end

  def item_at(index)
    @todos.fetch(index)
  end

  def mark_done_at(index)
    item_at(index).done!
  end

  def mark_undone_at(index)
    item_at(index).undone!
  end

  def done!
    @todos.map(&:done!)
  end

  def shift
    @todos.shift
  end

  def pop
    @todos.pop
  end

  def remove_at(index)
    @todos.delete(item_at(index))
  end

  def to_s
    "---- #{title} ----"
    @todos.each { |todo| puts todo }
  end

  def each
    counter = 0

    while counter < size
      yield(item_at(counter))
      counter += 1
    end

    self
  end

  def select
    result = TodoList.new(title)

    each do |to_do|
      result << to_do if yield(to_do)
    end

    result
  end
end

# given
todo1 = Todo.new("Buy milk")
todo2 = Todo.new("Clean room")
todo3 = Todo.new("Go to gym")

list = TodoList.new("Today's Todos")

list.add(todo1)
list.add(todo2)
list.add(todo3)

list.each do |todo|
  puts todo                   # calls Todo#to_s
end

todo1.done!

results = list.select { |todo| todo.done? }    # you need to implement this method

puts results.inspect
