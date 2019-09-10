def one?(collection)
  seen_true = false
  collection.each do |el|
    next unless yield(el)
    return false if seen_true

    seen_true = true
  end
  seen_true
end

p one?([1, 3, 5, 6], &:even?) == true
p one?([1, 3, 5, 7], &:even?) == false
p one?([2, 4, 6, 8], &:odd?) == false
p one?([1, 3, 5, 7]) { |value| (value % 5).zero? } == true
p one?([1, 3, 5, 7]) { true } == false
p one?([1, 3, 5, 7]) { false } == false
p one?([]) { false } == false
p one?({ a: 1, c: 3 }) { |_, v| v.odd? } == false
