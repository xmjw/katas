# Look and Say numbers:
# 1 = one 1 => 11
# 11 = two 1s => 21
# 21 = one 2, one 1 => 1211
# 1211 = one 1, one 2, two 1s => 111221
# And so on... Trivial, but tricky to get right.
#
# And enhancement on the below is to add a better data structure and go from there.
# For example, a hash of { ordinal: '1', count: 3 }, so it's a little easier to do things to,
# but takes up more memory. That said, in many languages appedning to string is memory intensive.

s = "1"

10.times do 
  chars = s.chars
  current = chars.shift
  counter = 1
  new_s = ''
  chars.each do |char|
    if char == current
      counter += 1
    else
      new_s << "#{counter}#{current}"
      counter = 1
      current = char
    end
  end
  new_s << "#{counter}#{current}"
  puts "#{new_s}\n"
  s = new_s
end


