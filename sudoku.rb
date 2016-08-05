# Takes a board as a string in the format
# you see in the puzzle file. Returns
# something representing a board after
# your solver has tried to solve it.
# How you represent your board is up to you!
def solve(board_string)
end

# Returns a boolean indicating whether
# or not the provided board is solved.
# The input board will be in whatever
# form `solve` returns.
def solved?(board)
end

# Takes in a board in some form and
# returns a _String_ that's well formatted
# for output to the screen. No `puts` here!
# The input board will be in whatever
# form `solve` returns.
def pretty_board(board)
end

def find_zero(board)
  row = 0
  column = 0
  until row == 8 && column == 8
    if board[row][column] == 0
      return [row, column]
    end

    if column == 8
     column = 0
     row += 1
    else
      column += 1
    end
  end
end


def data_to_int(mixed_string)
	mixed_string.chars.map!{ |item| item.to_i }
end

def create_board(array)
	begin_idx = 0
	end_idx = 8
	board_array = []
	until end_idx > 80
	board_array << array[begin_idx..end_idx]
	begin_idx += 9
	end_idx += 9
	end
	board_array
end
