def each_with_index(arr)
  index = 0
  while index < arr.size
    yield(arr[index], index)
    index += 1
  end
  arr
end

result = each_with_index([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
# 0 -> 1
# 1 -> 3
# 2 -> 36
# true

# ---- Slightly shorter ----

def each_with_idx(arr)
  arr.each do |item|
    index = arr.index(item)
    yield(item, index)
  end
end

result = each_with_idx([1, 3, 6]) do |value, index|
  puts "#{index} -> #{value**index}"
end

puts result == [1, 3, 6]
# 0 -> 1
# 1 -> 3
# 2 -> 36
# true
