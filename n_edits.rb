# Figure out if the characters are exactly 1 edit away, meaning adding, removing, or deleting a character.
# Look through the array, tolerant of exactly one change...


def seek(a, b)
  a = a.chars
  b = b.chars
  a_skip, b_skip, delta = 0, 0, 0
  max_length = [a.length, b.length].max
  max_length.times do |i|
    puts "#{i}: #{a[i + a_skip]} <=> #{b[i + b_skip]}"

    if a[i + a_skip] != b[i + b_skip]
      delta += 1
      # What we're saying is there is a variance in the longer string, so we can skip a char in that sting,
      # but we do it by pushing the shorter string back a character, so we compare the current char in the 
      # shorter string, with the longer char in the next string.
      a_skip -= 1 if b.length > a.length
      b_skip -= 1 if a.length > b.length
    end

    return false if delta > 1
  end
  true
end

puts seek("qwerty", "qwertn")
puts seek("qwert", "qwertyiop")
puts seek("pilot", "pleased")
puts seek("look", "looks")
puts seek("loiok", "look")
puts seek("loios", "look")

