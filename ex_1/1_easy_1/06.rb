def any?(collection)
  collection.each { |el| return true if yield(el) }
  false
end

p any?([1, 3, 5, 6], &:even?) == true
p any?([1, 3, 5, 7], &:even?) == false
p any?([2, 4, 6, 8], &:odd?)  == false
p any?([1, 3, 5, 7]) { |value| (value % 5).zero? } == true
p any?([1, 3, 5, 7]) { true } == true
p any?([1, 3, 5, 7]) { false } == false
p any?([]) { true } == false
p any?({ a: 1, b: 2, c: 3 }) { |_, v| v.odd? } == true
