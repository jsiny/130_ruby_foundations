def each(array)
  counter = 0
  while counter < array.size
    yield(counter)
    counter += 1
  end
  array
end

each([1, 2, 3, 4, 5]) do |num|
  puts num
end

p each([1, 2, 3]) { |n| puts n }.select(&:odd?)
