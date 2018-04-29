# First attempt at the boggle problem. (See boggle_2 for a more elegant solution).
#
# This is based on trying to examine the grig just like a human. It's a terrible 
# approach, becuase we're doing string comparisons to navigate a tree and getting 
# values based on position. It's easier to get positions based on values, and then
# do maths on the positions.
# 
# Again, see boggle_2

play = [['a', 'f', 'h', 't', 'u'],
        ['g', 't', 'd', 'q', 'r'],
        ['b', 'e', 'd', 'w', 'e'],
        ['y', 'o', 'w', 'm', 'f'],
        ['n', 'u', 'n', 'g', 's']]

def seek(word, game)
  letters = word.split('')
  return 'nope' unless letters.collect { |s| game.flatten.include?(s) }.uniq == [true]

  starts = find_letter(letters.first)

  starts.each do |position|
    letters.each do |l|

    end
  end
end

def find_letter(l, game)
  s = []
  game.each_with_index do |el, y|
    x = game[y].find_index(l)
    next if x.nil?
    s << [x, y]
  end
  s
end

def get_siblings(x, y, game)
  n = {} 
  n[get_safe(y,x-1, game)] = [y, x-1]
  n[get_safe(y,x+1, game)] = [y, x+1]
  n[get_safe(y-1,x, game)] = [y-1, x]
  n[get_safe(y+1,x, game)] = [y+1, x]
  n.reject { |k,_| k.nil? }
  n
end

def get_safe(y, x, game)
  return nil if y >= game.length
  return nil if x >= game[y].length
  game[y][x]
end

# puts seek('bed', play)

puts find_letter('w', play)

