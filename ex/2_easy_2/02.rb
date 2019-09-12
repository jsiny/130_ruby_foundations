def zip(arr1, arr2)
  result = []
  arr1.size.times do |i|
    result << [arr1[i], arr2[i]]
  end
  result
end

p zip([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]

# ---- With each_with_object ----

def zipp(arr1, arr2)
  arr1.each_with_object([]).with_index do |(_, result), idx|
    result << [arr1[idx], arr2[idx]]
  end
end

p zipp([1, 2, 3], [4, 5, 6]) == [[1, 4], [2, 5], [3, 6]]
