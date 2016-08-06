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
  false
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



def box_identifier(location_array)
  row, column = location_array

  box_row1 = (0..2)
  box_row2 = (3..5)
  box_row3 = (6..8)

  box_column1 = (0..2)
  box_column2 = (3..5)
  box_column3 = (6..8)

  if box_row1.include?(row) && box_column1.include?(column)
    return 1
  elsif box_row1.include?(row) && box_column2.include?(column)
    return 2
  elsif box_row1.include?(row) && box_column3.include?(column)
    return 3
  elsif box_row2.include?(row) && box_column1.include?(column)
    return 4
  elsif box_row2.include?(row) && box_column2.include?(column)
    return 5
  elsif box_row2.include?(row) && box_column3.include?(column)
    return 6
  elsif box_row3.include?(row) && box_column1.include?(column)
    return 7
  elsif box_row3.include?(row) && box_column2.include?(column)
    return 8
  elsif box_row3.include?(row) && box_column3.include?(column)
    return 9
  end
end

def box_start_location(boxnum)
 case boxnum
  when 1
    return [0, 0]
  when 2
    return [0, 3]
  when 3
    return [0, 6]
  when 4
    return [3, 0]
  when 5
    return [3, 3]
  when 6
    return [3, 6]
  when 7
    return [6, 0]
  when 8
    return [6, 3]
  when 9
    return [6, 6]
  end
end

def check_row(board, row_idx, num_search)
  board[row_idx].include?(num_search)
end

def check_column(board, column_idx, num_search)
 check_row(board.transpose, column_idx, num_search)
end

def check_box(board, cell_coordinates, num_search)
  row, column = box_start_location(box_identifier(cell_coordinates))
  stop_row = row + 2
  stop_column = column + 2
  until row == stop_row && column == stop_column
    if num_search == board[row][column]
      return true
    end

    if column == stop_column
     column = 0
     row += 1
    else
      column += 1
    end
  end
    false
end

def cell_check(board, start_array, num_search)
  row_idx, column_idx = start_array
  check_r = check_row(board, row_idx, num_search)
  check_c = check_column(board, column_idx, num_search)
  check_b = check_box(board, start_array, num_search)
  if check_r || check_c || check_b
    true
  else
    false
  end
end























