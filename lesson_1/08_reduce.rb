array = [1, 2, 3, 4, 5]

def reduce(array, accu = array[0])
  counter = accu == array[0] ? 1 : 0

  while counter < array.size
    accu = yield(accu, array[counter])
    counter += 1
  end
  accu
end

p reduce(array) { |acc, num| acc + num }                    # => 15
p reduce(array, 10) { |acc, num| acc + num }                # => 25
# p reduce(array) { |acc, num| acc + num if num.odd? }      # => NoMethodError: undefined method `+' for nil:NilClass
p reduce(['a', 'b', 'c']) { |acc, value| acc += value }     # => 'abc'
p reduce([[1, 2], ['a', 'b']]) { |acc, value| acc + value } # => [1, 2, 'a', 'b']
