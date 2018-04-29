# Given a 2d array of letters and a word, write an algorythm that can check to see if
# the word can be spelled 'boggle' style. Only moving to letters above, below, left or right.
# The trick to this one is to recognise that the array is a graph, and not try to treat it
# like a grid, and navigate around human-style. The computer struggles with that, as does 
# code.
#
# By only really caring about coordinates, we reduce the problem to a set of nodes, and
# suddenly we're doing maths. Maths is easy for a computer.
#
# It's a really good example of reducing a problem for the computer, and not trying to just
# codify the way you would solve the problem.

play = [['a', 'f', 'h', 't', 'u'],
        ['g', 't', 'd', 'q', 'r'],
        ['b', 'e', 'd', 'w', 'e'],
        ['y', 'o', 'w', 'm', 'f'],
        ['n', 'u', 'n', 'g', 's']]

# Entrypoint
def seek(word, game)
  letters = word.split('')
  positions = indexes_of_letter(letters.shift, game)
  return traverse_tree?(positions, letters, game) 
end

# recursively check the current position and traverse the tree looking for words.
def traverse_tree?(positions, letters, game)
  return true if letters == []
  next_positions = indexes_of_letter(letters.shift, game)
  positions.each do |position|
    neighbours = adjacent_from_array(position, next_positions)
    return traverse_tree?(neighbours, letters, game) if neighbours.any?
  end
  return false
end

# Given `target` position, are any of the positions in `set` next to it
def adjacent_from_array(target, set)
  set.select do |candidate|
    adjacent?(target, candidate)
  end
end

# are positions `a` and `b` next to each other (Only allowing cross `+` positions)
def adjacent?(a, b)
  ((a[0] - b[0]).abs + (a[1] - b[1]).abs) == 1
end

# All the coordinates for a given letter
def indexes_of_letter(letter, game)
  cells = []
  game.each_with_index do |row, y|
    row.each_with_index do |cell, x|
      cells << [x, y] if cell == letter
    end
  end
  cells
end

puts seek('feet', play)
puts seek('youngs', play)
puts seek('bed', play)

