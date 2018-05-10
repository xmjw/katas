# print a spiral of integers for the given size...
# The trick here is to use a vector to describe the moves,
# and array of those offers us a simple compas. So we just 
# check for the next position to move to, if it looks wrong
# (already has a value, or off the grid) then we change 
# to the next vector, and go round in these directions. 
#
# > V < ^
#


@map = [
  {x: 1, y: 0},
  {x: 0, y: 1},
  {x: -1, y: 0},
  {x: 0, y: -1},
]

# What's in this position?
def peek(position, board)
  board[position[0]][position[1]]
end
puts peek([0,0],[[4]]) == 4
puts peek([2,1],[[0,1],[0,2],[0,3]]) == 3

# Valid position?
def out_of_bounds?(position, width)
  position[0] >= width || position[1] >= width
end
puts out_of_bounds?([3,2], 2) == true
puts out_of_bounds?([1,2], 3) == false

# Move the position...
def move_position(position, direction)
  [position[0] + @map[direction][:x],
   position[1] + @map[direction][:y]]
end
puts move_position([0,1],1) == [0,2]
puts move_position([3,5],3) == [3,4]

# Loop round directions in a controlled way
def change_direction(direction)
  direction += 1
  direction = 0 if direction >= 4
  direction
end
puts change_direction(2) == 3
puts change_direction(3) == 0


# Print the board...
def print_board(board)
  board.length.times do |y|
    board.first.length.times do |x|
      print "\t#{board[x][y]}\t"
    end
    print "\n"
  end
end

def valid_position?(position, width, board)
  return false if out_of_bounds?(position, width)
  return false if peek(position, board) != -1
  true
end

def spiral(width)
  board = Array.new(width) { Array.new(width, -1) }
  direction = 0
  position = [0,0]

  print_board(board)

  (width*width).times do |i|
    print "#{i} #{position.join(':')}@#{direction}"
    board[position[0]][position[1]] = i
    new_position = move_position(position, direction)
    puts "\t -> #{new_position.join(':')}@#{direction}"
  
    print_board(board)
  
    if valid_position?(new_position, width, board) == false 
      direction = change_direction(direction)
      new_position = move_position(position, direction)
    end

    position = new_position
  end
end

spiral(1)




