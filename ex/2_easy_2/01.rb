def step(first, last, step)
  current = first
  while current <= last
    yield(current)
    current += step
  end
  nil
end

step(1, 10, 3) { |value| puts "value = #{value}" }
