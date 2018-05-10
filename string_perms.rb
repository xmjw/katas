# Find all perumtations of string s, inside string b.
# For example, given s = 'abc' and b = 'abcbcacba'


# build a suffix index to hunt through data...
def suffix_table(big, key_size)
  keys = big.length - key_size
  array = (0..keys)
  array.sort { |a,b| big[a,a+key_size].chars.sort <=> big[b,b+key_size].chars.sort }
end
puts suffix_table('fedcba', 2) == [ 4, 3, 2, 1, 0 ]

# Use a binary search to find a match... but not very smart...
def search_seek(small, big)
  size = small.length
  index = suffix_table(big, size)
  sorted_target = small.chars.sort
  index.bsearch { |v| puts big[v, size] ; big[v,size].chars.sort <=> sorted_target }
end

require 'byebug'

# build a dictionary
def dictionary(big,size)
  big_chars = big.chars
  segments = {}
  (big.length-(size-1)).times do |i|
    token = big_chars[i,size].sort.join('')
    if segments.key?(token)
      segments[token] << i 
    else
      segments[token] = [i]
    end
  end
  segments
end

def seek(small, big)
  small = small.chars.sort.join('')
  dict = dictionary(big, small.size)
  dict[small]
end

small = ' '
big = "The UK government has apologised to a Libyan dissident and his wife after its actions contributed to their detention, transfer to Libya and his torture by Colonel Gaddafi's forces in 2004."

puts seek(small, big)
