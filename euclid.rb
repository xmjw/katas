# Implementation of euclids algorithm to find common factors.

def gcd(a, b)
  while b != 0 do
    remainer = a % b
    puts "A: #{a}; B: #{b}: Remainder: #{remainer}"
    a = b
    b = remainer
  end
  a
end

puts gcd(4851, 3003)
