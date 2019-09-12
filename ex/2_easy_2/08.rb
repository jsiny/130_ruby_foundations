def max_by(arr)
  list = {}
  arr.each { |item| list[item] = yield(item) }
  list.key(list.values.max)
end

p max_by([1, 5, 3]) { |value| value + 2 } == 5
p max_by([1, 5, 3]) { |value| 9 - value } == 1
p max_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p max_by([[1, 2], [3, 4, 5], [6]], &:size) == [3, 4, 5]
p max_by([-7]) { |value| value * 3 } == -7
p max_by([]) { |value| value + 5 }.nil?

# ---- With inject ----

def maxx_by(arr)
  arr.inject(arr.first) { |max, item| yield(item) > yield(max) ? item : max }
end

p maxx_by([1, 5, 3]) { |value| value + 2 } == 5
p maxx_by([1, 5, 3]) { |value| 9 - value } == 1
p maxx_by([1, 5, 3]) { |value| (96 - value).chr } == 1
p maxx_by([[1, 2], [3, 4, 5], [6]], &:size) == [3, 4, 5]
p maxx_by([-7]) { |value| value * 3 } == -7
p maxx_by([]) { |value| value + 5 }.nil?
