require_relative 'sudoku'

# The sudoku puzzles that your program will solve can be found
# in the sudoku_puzzles.txt file.
#
# Currently, Line 18 defines the variable board_string to equal
# the first puzzle (i.e., the first line in the .txt file).
# After your program can solve this first puzzle, edit
# the code below, so that the program tries to solve
# all of the puzzles.
#
# Remember, the file has newline characters at the end of each line,
# so we call String#chomp to remove them.

# board_string = File.readlines('sudoku_puzzles.txt').first.chomp

# solved_board = solve(board_string)
# if solved?(solved_board)
#   puts "The board was solved!"
#   puts pretty_board(solved_board)
# else
#   puts "The board wasn't solved :("
# end

string = "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--"
array = data_to_int(string)
board = create_board(array)
p zerod_board = loop_through_zeros(board)

# zerod_board = loop_through_string(board)

# zerod_board = loop_through_zeros(zerod_board)
# zerod_board = loop_through_zeros(zerod_board)

# p zerod_board


# board = [[1, 0, 5, 8, 0, 2, 0, 0, 0],
#                  [0, 9, 0, 0, 7, 6, 4, 0, 5],
#                  [2, 0, 0, 4, 0, 0, 8, 1, 9],
#                  [0, 1, 9, 0, 0, 7, 3, 0, 6],
#                  [7, 6, 2, 0, 8, 3, 0, 9, 0],
#                  [0, 0, 0, 0, 6, 1, 0, 5, 0],
#                  [0, 0, 7, 6, 0, 0, 0, 3, 0],
#                  [4, 3, 0, 0, 2, 0, 5, 0, 1],
#                [6, 0, 0, 3, 0, 8, 9, 0, 0]]

# p loop_through_zeros(board)




















# [[1, {1=>true, 2=>true, 3=>true, 4=>false, 5=>true, 6=>true, 7=>false, 8=>true, 9=>true}, 5, 8, 3, 2, {1=>true, 2=>true, 3=>true, 4=>true, 5=>true, 6=>true, 7=>true, 8=>true, 9=>true}, {1=>true, 2=>true, 3=>true, 4=>true, 5=>true, 6=>true, 7=>true, 8=>true, 9=>true}, {1=>true, 2=>true, 3=>true, 4=>true, 5=>true, 6=>true, 7=>true, 8=>true, 9=>true}],
# [{1=>true, 2=>true, 3=>false, 4=>true, 5=>true, 6=>true, 7=>true, 8=>false, 9=>true}, 9, {1=>true, 2=>true, 3=>false, 4=>true, 5=>true, 6=>true, 7=>true, 8=>false, 9=>true}, 1, 7, 6, 4, {1=>true, 2=>true, 3=>true, 4=>true, 5=>true, 6=>true, 7=>true, 8=>true, 9=>true}, 5],
# [2, 7, {1=>true, 2=>true, 3=>false, 4=>true, 5=>true, 6=>false, 7=>true, 8=>true, 9=>true}, 4, 5, {1=>true, 2=>true, 3=>true, 4=>true, 5=>true, 6=>true, 7=>true, 8=>true, 9=>true}, 8, 1, 9],
#  [{1=>true, 2=>true, 3=>true, 4=>true, 5=>false, 6=>true, 7=>true, 8=>false, 9=>true}, 1, 9, 5, 4, 7, 3, {1=>true, 2=>true, 3=>true, 4=>true, 5=>true, 6=>true, 7=>true, 8=>true, 9=>true}, 6],
#  [7, 6, 2, {1=>true, 2=>true, 3=>true, 4=>true, 5=>true, 6=>true, 7=>true, 8=>true, 9=>true}, 8, 3, {1=>true, 2=>true, 3=>true, 4=>true, 5=>true, 6=>true, 7=>true, 8=>true, 9=>true}, 9, 4],
#  [{1=>true, 2=>true, 3=>false, 4=>true, 5=>true, 6=>true, 7=>true, 8=>false, 9=>true}, {1=>true, 2=>true, 3=>true, 4=>false, 5=>true, 6=>true, 7=>true, 8=>false, 9=>true}, {1=>true, 2=>true, 3=>false, 4=>false, 5=>true, 6=>true, 7=>true, 8=>false, 9=>true}, 9, 6, 1, {1=>true, 2=>true, 3=>true, 4=>true, 5=>true, 6=>true, 7=>true, 8=>true, 9=>true}, 5, {1=>true, 2=>true, 3=>true, 4=>true, 5=>true, 6=>true, 7=>true, 8=>true, 9=>true}],
#  [{1=>true, 2=>true, 3=>true, 4=>true, 5=>false, 6=>true, 7=>true, 8=>false, 9=>false}, {1=>true, 2=>false, 3=>true, 4=>true, 5=>false, 6=>true, 7=>true, 8=>false, 9=>true}, 7, 6, {1=>false, 2=>true, 3=>true, 4=>true, 5=>true, 6=>true, 7=>true, 8=>true, 9=>false}, {1=>true, 2=>true, 3=>true, 4=>true, 5=>false, 6=>true, 7=>true, 8=>true, 9=>false}, {1=>true, 2=>true, 3=>true, 4=>true, 5=>true, 6=>true, 7=>true, 8=>true, 9=>true}, 3, {1=>true, 2=>true, 3=>true, 4=>true, 5=>true, 6=>true, 7=>true, 8=>true, 9=>true}],
#  [4, 3, 8, 7, 2, 9, 5, {1=>true, 2=>true, 3=>true, 4=>true, 5=>true, 6=>true, 7=>true, 8=>true, 9=>true}, 1],
#  [6, {1=>true, 2=>false, 3=>true, 4=>true, 5=>false, 6=>true, 7=>true, 8=>true, 9=>true}, 1, 3, {1=>true, 2=>true, 3=>true, 4=>true, 5=>true, 6=>true, 7=>true, 8=>true, 9=>true}, 8, 9, {1=>true, 2=>true, 3=>true, 4=>true, 5=>true, 6=>true, 7=>true, 8=>true, 9=>true}, 0]]
