def all?(collection)
  collection.each { |el| return false unless yield(el) }
  true
end

p all?([1, 3, 5, 6], &:odd?) == false
p all?([1, 3, 5, 7], &:odd?) == true
p all?([2, 4, 6, 8], &:even?) == true
p all?([1, 3, 5, 7]) { |value| (value % 5).zero? } == false
p all?([1, 3, 5, 7]) { true } == true
p all?([1, 3, 5, 7]) { false } == false
p all?([]) { false } == true
p all?({ a: 1, c: 3 }) { |_, v| v.odd? } == true
