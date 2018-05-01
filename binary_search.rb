# Implement a binary search algorithm

data = []
1000.times { |i| data << i * rand(i)  }
data = data.sort

def find(n, data)
  puts "N: #{n}, D: #{data.length} (#{data[0]}..#{data[-1]})"
  return n if data == [n]
  return nil if data.length == 1
  mid = data.length / 2
  return find(n, data.slice(mid,data.length-mid)) if data[mid] <= n
  return find(n, data.slice(0, mid))
end

puts find(data.sample, data)

