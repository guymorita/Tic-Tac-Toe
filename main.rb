#set up the grid
#set up 3 states for any space to be set by
#set up the win conditions to check after every move. player 1 gets 1 point per space. player 2 gets 4 points per space.
#set up how each player picks a space each turn

@a = {:a1 => 0, :a2 => 0, :a3 => 0}
@b = {:b1 => 0, :b2 => 0, :b3 => 0}
@c = {:c1 => 0, :c2 => 0, :c3 => 0}

@round_array = []
@turn_counter = 1
@onewin = []
@twowin = []


def sum_rows
  @round_array << (@a[:a1] + @a[:a2] + @a[:a3])
  @round_array << (@b[:b1] + @b[:b2] + @b[:b3])
  @round_array << (@c[:c1] + @c[:c2] + @c[:c3])
end

def sum_columns
  @round_array << (@a[:a1] + @b[:b1] + @c[:c1])
  @round_array << (@a[:a2] + @b[:b2] + @c[:c2])
  @round_array << (@a[:a3] + @b[:b3] + @c[:c3])
end

def sum_diagonal
  @round_array << (@a[:a1] + @b[:b2] + @c[:c3])
  @round_array << (@a[:a3] + @b[:b2] + @c[:c1])
end

def round_array
  @round_array = []
  sum_rows
  sum_columns
  sum_diagonal
end

def wincond
  @onewin = []
  @twowin = []
  round_array
  @onewin = @round_array.select { |x| x == 3}
  @twowin = @round_array.select { |x| x == 12}
  if @onewin[0] == 3
    puts "Game Over Player One Wins"
  elsif @twowin[0] == 12
    puts "Game Over Player Two Wins"
  end
  @round_array = []
end

def player_one_turn
  puts "Player 1's Turn"
  puts "Which row would you like to choose? "
  column = gets.chomp
  puts "Which column would you like to choose? "
  row = gets.chomp
  if column == "a"
    @a[(column+row).to_sym] = 1
  elsif column == "b"
    @b[(column+row).to_sym] = 1
  elsif column == "c"
    @c[(column+row).to_sym] = 1
  end
  @turn_counter += 1
  wincond
end

def player_two_turn
  puts "Player 2's Turn"
  puts "Which row would you like to choose? "
  column = gets.chomp
  puts "Which column would you like to choose? "
  row = gets.chomp
  if column == "a"
    @a[(column+row).to_sym] = 4
  elsif column == "b"
    @b[(column+row).to_sym] = 4
  elsif column == "c"
    @c[(column+row).to_sym] = 4
  end
  @turn_counter += 1
  wincond
end

puts "------------------------"
puts "Welcome to Tic-Tac-Toe"
puts "------------------------"
puts @a
puts @b
puts @c
 
while @onewin[0] != 3 && @twowin[0] != 12
  if @turn_counter.odd?
    player_one_turn
  elsif @turn_counter.even?
    player_two_turn
  end
  puts @a
  puts @b
puts @c
end
puts "------------------------"
puts "Game over"
puts "------------------------"
