# Takes a board as a string in the format
# you see in the puzzle file. Returns
# something representing a board after
# your solver has tried to solve it.
# How you represent your board is up to you!

# Takes in a board in some form and
# returns a _String_ that's well formatted
# for output to the screen. No `puts` here!
# The input board will be in whatever
# form `solve` returns.
def pretty_board(board)
end

def solve(string)
board = create_board(string))
i = 0
    until solved?(board) == true
      string_board = loop_through_zeros(board)
      board = empty_to_zero(string_board)
        if i > 5
          return board
        end
      i += 1
    end
    board
end

  # takes board with strings and returns new board with 0's
  def empty_to_zero(board)
    row = 0
    column = 0
    until row == 9 && column == 0
      if board[row][column] == ''
        board[row][column] = 0
      end
      if column == 8
       column = 0
       row += 1
      else
        column += 1
      end
    end
    board
  end

  # Takes String Reutrns BOARD!
  def create_board(string)
    array = data_to_int(string)
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

        def data_to_int(mixed_string)
          mixed_string.chars.map!{ |item| item.to_i }
        end


  # Takes board and returns blank adjusted to '' and filled in solved place!!!
  def loop_through_zeros(board)
    cell_location = find_zero(board)
    row, column = cell_location
    until row == false
     # p cell_location
      hash = cell_conflicts(board, cell_location)
      if false_count(hash) <= 1
        num = hash.key(false)
        board[row][column] = num
      else
        board[row][column] = ''
      end
      cell_location = find_zero(board)
      row, column = cell_location
    end
    board
  end

       def find_zero(board)
          row = 0
          column = 0
          until row == 9 && column == 0
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

        def false_count(hash)
          conflict_collection = []
          hash.each_pair {|num, conflict| conflict_collection << conflict }
          conflict_collection.count(false)
        end

          # Returns HASH with conflicts, still need to do false count
        def cell_conflicts(board, start_location)
          z = 1
          cell = {}
          until z == 10
            conflict = cell_check(board, start_location, z)
            cell[z] = conflict
            z += 1
          end
        cell
        end

        def cell_conflicts(board, start_location)
          z = 1
          cell = {}
          until z == 10
            conflict = cell_check(board, start_location, z)
            cell[z] = conflict
            z += 1
          end
        cell
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

                    def check_row(board, row_idx, num_search)
                      board[row_idx].include?(num_search)
                    end

                    def check_column(board, column_idx, num_search)
                     check_row(board.transpose, column_idx, num_search)
                    end


                    def check_box(board, cell_coordinates, num_search)
                      row, column = box_start_location(box_identifier(cell_coordinates))
                      start_column = column
                      stop_row = row + 2
                      stop_column = column + 2
                      array = []
                      until  row == stop_row && column == stop_column
                         # array << board[row][column]
                        if num_search == board[row][column]
                          # p array
                          return true
                        end
                        if column == stop_column
                         column = start_column
                         row += 1
                        else
                          column += 1
                        end
                      end
                        # p array
                        false
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


# True, puzzle is solved.
# False puzzle not solved
def solved?(board)
  potential = []
  board.map do |item|
    potential << !item.include?('')
  end
  potential.include?(false)
end
end





























# def loop(board)
#   new_board = []
#   4.times do |board|
#     result = loop_through_zeros(board)
#   end
#   p result
# end
