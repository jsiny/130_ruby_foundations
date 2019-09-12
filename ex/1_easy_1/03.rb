def missing(arr)
  result = []

  arr.first.upto(arr.last) do |num|
    result << num unless arr.include? num
  end

  result
end

p missing([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missing([1, 2, 3, 4]) == []
p missing([1, 5]) == [2, 3, 4]
p missing([6]) == []

# ---- With Enumerable#each_cons ----

def missingg(arr)
  result = []

  arr.each_cons(2) do |first, second|
    result.concat(((first + 1)..(second - 1)).to_a)
  end

  result
end

p missingg([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missingg([1, 2, 3, 4]) == []
p missingg([1, 5]) == [2, 3, 4]
p missingg([6]) == []

# ---- Further Exploration ----

def missinggg(arr)
  (arr.first..arr.last).to_a - arr
end

p missinggg([-3, -2, 1, 5]) == [-1, 0, 2, 3, 4]
p missinggg([1, 2, 3, 4]) == []
p missinggg([1, 5]) == [2, 3, 4]
p missinggg([6]) == []
