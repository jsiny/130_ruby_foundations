def drop_while(arr)
  toggle = 0

  arr.each_with_object([]) do |el, result|
    toggle += 1 unless yield(el)
    result << el unless toggle.zero?
  end
end

p drop_while([1, 3, 5, 6], &:odd?) == [6]
p drop_while([1, 3, 5, 6], &:even?) == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { true } == []
p drop_while([1, 3, 5, 6]) { false } == [1, 3, 5, 6]
p drop_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p drop_while([]) { true } == []

# ---- Returning the same array ----

def dropp_while(arr)
  arr.each_with_index do |el, i|
    return arr[i..-1] unless yield(el)
  end
  []
end

p dropp_while([1, 3, 5, 6], &:odd?) == [6]
p dropp_while([1, 3, 5, 6], &:even?) == [1, 3, 5, 6]
p dropp_while([1, 3, 5, 6]) { true } == []
p dropp_while([1, 3, 5, 6]) { false } == [1, 3, 5, 6]
p dropp_while([1, 3, 5, 6]) { |value| value < 5 } == [5, 6]
p dropp_while([]) { true } == []
