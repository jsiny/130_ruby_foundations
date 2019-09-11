items = ['apples', 'corn', 'cabbage', 'wheat']

def gather(items)
  puts "Let's start gathering food."
  yield(items)
  puts "We've finished gathering!"
end

gather(items) do |*produce, wheat|
  puts produce.join(', ')
  puts wheat
end

gather(items) do |apple, *produce, wheat |
  puts apple
  puts produce.join(', ')
  puts wheat
end

gather(items) do |apple, *produce|
  puts apple
  puts produce.join(', ')
end

gather(items) do |apple, corn, cabbage, wheat|
  puts "#{apple}, #{corn}, #{cabbage} and #{wheat}"
end
