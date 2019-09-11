# rubocop:disable Lint/UselessAssignment
def count(*num)
  num.inject(0) { |acc, item| yield(item) ? acc += 1 : acc }
end
# rubocop:enable Lint/UselessAssignment

p count(1, 3, 6, &:odd?) == 2
p count(1, 3, 6, &:even?) == 1
p count(1, 3, 6) { |value| value > 6 } == 0
p count(1, 3, 6) { true } == 3
p count() { true } == 0
p count(1, 3, 6) { |value| value - 6 } == 3
