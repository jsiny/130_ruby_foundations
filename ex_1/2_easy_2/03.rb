def map(arr)
  arr.each_with_object([]) { |n, result| result << yield(n) }
end

p map([1, 3, 6]) { |value| value**2 } == [1, 9, 36]
p map([]) { true } == []
p map(['a', 'b', 'c', 'd']) { false } == [false, false, false, false]
p map(['a', 'b', 'c', 'd'], &:upcase) == ['A', 'B', 'C', 'D']
p map([1, 3, 4]) { |value| (1..value).to_a } == [[1], [1, 2, 3], [1, 2, 3, 4]]
p map({ a: 1, b: 2, c: 3 }) { |_, v| v + 2 } == [3, 4, 5]
