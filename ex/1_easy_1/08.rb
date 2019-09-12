def none?(collection)
  collection.each { |el| return false if yield(el) }
  true
end

p none?([1, 3, 5, 6], &:even?) == false
p none?([1, 3, 5, 7], &:even?) == true
p none?([2, 4, 6, 8], &:odd?) == true
p none?([1, 3, 5, 7]) { |value| (value % 5).zero? } == false
p none?([1, 3, 5, 7]) { true } == false
p none?([1, 3, 5, 7]) { false } == true
p none?([]) { false } == true
p none?({ a: 1, c: 3 }) { |_, v| v.even? } == true

# ---- With any? (ex 1.6) ----

# rubocop:disable Lint/UnusedMethodArgument
def any?(collection, &block)
  collection.each { |el| return true if yield(el) }
  false
end
# rubocop:enable Lint/UnusedMethodArgument

def nonn?(collection, &block)
  !any?(collection, &block)
end

p nonn?([1, 3, 5, 6], &:even?) == false
p nonn?([1, 3, 5, 7], &:even?) == true
p nonn?([2, 4, 6, 8], &:odd?) == true
p nonn?([1, 3, 5, 7]) { |value| (value % 5).zero? } == false
p nonn?([1, 3, 5, 7]) { true } == false
p nonn?([1, 3, 5, 7]) { false } == true
p nonn?([]) { false } == true
p nonn?({ a: 1, c: 3 }) { |_, v| v.even? } == true
