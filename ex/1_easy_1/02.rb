def compute
  block_given? ? yield : 'Does not compute.'
end

p compute { 5 + 3 } == 8
p compute { 'a' + 'b' } == 'ab'
p compute == 'Does not compute.'

# ---- Further Exploration ----

def kompute(arg)
  block_given? ? yield(arg) : 'Does not kompute.'
end

p kompute(1) { |x| x + 3 } == 4
p kompute('hello') { |str| str + ' world' } == 'hello world'
p kompute('damn') == 'Does not kompute.'
