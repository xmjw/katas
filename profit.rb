# The given list represents day prices for a commodity. You need to buy
# on one day, and sell on another. What is the maximum profit you can 
# make?
#
# Focus here is on efficiency. It's easy to loop through, but is there a
# better way?

prices = [10, 38, 20, 55, 11, 32, 13, 44]

def seek(prices)
  lowest = prices.first
  profit = 0

  prices.each do |price|
    profit = price - lowest if price - lowest > profit
    lowest = price if price < lowest
  end

  profit
end

puts seek(prices) == 25
puts seek([15, 20, 30, 10, 40])
puts seek([4, 4, 1, 1])
