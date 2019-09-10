def count(arr)
  counter = 0
  arr.each { |el| counter += 1 if yield(el) }
  counter
end

p count([1, 2, 3, 4, 5], &:odd?) == 3
p count([1, 2, 3, 4, 5]) { |value| value % 3 == 1 } == 2
p count([1, 2, 3, 4, 5]) { true } == 5
p count([1, 2, 3, 4, 5]) { false } == 0
p count([], &:even?) == 0
p count(%w(Four score and seven)) { |value| value.size == 5 } == 2

# ---- Further Exploration ----

# rubocop:disable Lint/UselessAssignment
def kount(arr)
  arr.inject(0) { |count, el| yield(el) ? count += 1 : count }
end
# rubocop:enable Lint/UselessAssignment

p kount([1, 2, 3, 4, 5], &:odd?) == 3
p kount([1, 2, 3, 4, 5]) { |value| value % 3 == 1 } == 2
p kount([1, 2, 3, 4, 5]) { true } == 5
p kount([1, 2, 3, 4, 5]) { false } == 0
p kount([], &:even?) == 0
p kount(%w(Four score and seven)) { |value| value.size == 5 } == 2
