# For a given array, is there any sequence of numbers that adds up to 
# a given, desired number.
#
# This is interesting because of the number of possible breaks you can 
# user to drop out of the search. There are also some guesses you could
# make up front, but that depends on the size/range/scope/performance
# that has to be supported.

a = [1,7,5,2,4,1,5]
v = 10

def seek(source,target)
  starting_index = 0

  source.length.times do |start|
    val = 0
    (source.length - start).times do |index|
      val = val + source[start+index]
      puts "#{start} - #{index} #{(val)}"
      return source.slice(start,index+1) if val == target
      break if val > target
    end
  end
  'Nope'
end

answer = seek(a,v)
puts answer

