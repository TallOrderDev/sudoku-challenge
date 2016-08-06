require_relative '../sudoku'

describe "Sudoku" do
	context 'Check array structure for string input' do

	let(:test_string) { "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--" }
	let(:int_array) { [1, 0, 5, 8, 0, 2, 0, 0, 0, 0, 9, 0, 0, 7, 6, 4, 0, 5, 2, 0, 0, 4, 0, 0, 8, 1, 9, 0, 1, 9, 0, 0, 7, 3, 0, 6, 7, 6, 2, 0, 8, 3, 0, 9, 0, 0, 0, 0, 0, 6, 1, 0, 5, 0, 0, 0, 7, 6, 0, 0, 0, 3, 0, 4, 3, 0, 0, 2, 0, 5, 0, 1, 6, 0, 0, 3, 0, 8, 9, 0, 0] }
	let(:board) { [[1, 0, 5, 8, 0, 2, 0, 0, 0],
								 [0, 9, 0, 0, 7, 6, 4, 0, 5],
								 [2, 0, 0, 4, 0, 0, 8, 1, 9],
								 [0, 1, 9, 0, 0, 7, 3, 0, 6],
								 [7, 6, 2, 0, 8, 3, 0, 9, 0],
								 [0, 0, 0, 0, 6, 1, 0, 5, 0],
								 [0, 0, 7, 6, 0, 0, 0, 3, 0],
								 [4, 3, 0, 0, 2, 0, 5, 0, 1],
								 [6, 0, 0, 3, 0, 8, 9, 0, 0]] }

	it 'is an array of integers' do
		expect(data_to_int(test_string)).to eq int_array
	end


	it 'is an array with 9 elements' do
		expect(create_board(test_string).length).to eq 9
		end

		# 	it 'is an array with 9 elements' do
		# expect(create_rows(int_array).length).to eq 9
		# end

		it 'is an array in final board condition' do
		expect(create_board(int_array)).to eq board
		end
	# it 'is an array with 9 columns'
	# 	expect()

	end

	context "check board for zero return location" do
		let(:board) { [[1, 0, 5, 8, 0, 2, 0, 0, 0],
									 [0, 9, 0, 0, 7, 6, 4, 0, 5],
									 [2, 0, 0, 4, 0, 0, 8, 1, 9],
									 [0, 1, 9, 0, 0, 7, 3, 0, 6],
									 [7, 6, 2, 0, 8, 3, 0, 9, 0],
									 [0, 0, 0, 0, 6, 1, 0, 5, 0],
									 [0, 0, 7, 6, 0, 0, 0, 3, 0],
									 [4, 3, 0, 0, 2, 0, 5, 0, 1],
									 [6, 0, 0, 3, 0, 8, 9, 0, 0]] }
		let(:board_no_zero_in0) { [[1, 4, 5, 8, 9, 2, 3, 6, 7],
															 [3, 9, 0, 0, 7, 6, 4, 0, 5],
															 [2, 0, 0, 4, 0, 0, 8, 1, 9],
															 [0, 1, 9, 0, 0, 7, 3, 0, 6],
															 [7, 6, 2, 0, 8, 3, 0, 9, 0],
															 [0, 0, 0, 0, 6, 1, 0, 5, 0],
															 [0, 0, 7, 6, 0, 0, 0, 3, 0],
															 [4, 3, 0, 0, 2, 0, 5, 0, 1],
															 [6, 0, 0, 3, 0, 8, 9, 0, 0]] }

			it 'Checks for zero location and returns location' do
				expect(find_zero(board)).to eq [0, 1]
			end

			it 'Checks for zero location and returns location' do
				expect(find_zero(board_no_zero_in0)).to eq [1, 2]
			end
	end
	context 'Checks board for specific number' do
	let(:board) {  [[1, 0, 5, 8, 0, 2, 0, 0, 0],
									[0, 9, 0, 0, 7, 6, 4, 0, 5],
									[2, 0, 0, 4, 0, 0, 8, 1, 9],
									[0, 1, 9, 0, 0, 7, 3, 0, 6],
									[7, 6, 2, 0, 8, 3, 0, 9, 0],
									[0, 0, 0, 0, 6, 1, 0, 5, 0],
									[0, 0, 7, 6, 0, 0, 0, 3, 0],
									[4, 3, 0, 0, 2, 0, 5, 0, 1],
									[6, 0, 0, 3, 0, 8, 9, 0, 0]] }

		it 'returns true if row contains number' do
			expect(check_row(board, 0, 5)).to eq true
		end

		it 'returns false if row does not contain number' do
			expect(check_row(board, 3, 8)).to eq false
		end

		it 'returns true if column contains number' do
			expect(check_column(board, 0, 7)).to eq true
		end

		it 'returns false if column does not contains number' do
			expect(check_column(board, 3, 1)).to eq false
		end

		it 'returns box number for cell coordinates' do
			expect(box_identifier([0,0])).to eq 1
		end

		it 'returns box number for cell coordinates' do
			expect(box_identifier([4,7])).to eq 6
		end

		it 'returns box start cords for box num' do
			expect(box_start_location(5)).to eq [3, 3]
		end

		it 'returns box start cords for cell location' do
			expect(box_start_location(box_identifier([4,7]))).to eq [3, 6]
		end


		it 'returns true if box contains number' do
			expect(check_box(board, [0,1], 1)).to eq true
		end

		it 'returns true if box contains number' do
			expect(check_box(board, [0,4], 6)).to eq true
		end

		it 'returns false if box contains number' do
			expect(check_box(board, [0,4], 1)).to eq false
		end

		context 'Testing row/column/number for conflic true/false' do
			it 'returns true if row/column/box contains number' do
				expect(cell_check(board, [0,1], 9	)).to eq true
			end

			it 'returns false if row/column/box n/contains number' do
				expect(cell_check(board, [0,1], 7	)).to eq false
			end
		end

		context 'building hash T/F for conflict of each #' do
			let(:hash_more1) { {1=>true, 2=>true, 3=>true, 4=>false, 5=>true, 6=>true, 7=>false, 8=>true, 9=>true} }
			let(:hash1) { {1=>false, 2=>true, 3=>true, 4=>true, 5=>true, 6=>true, 7=>true, 8=>true, 9=>true} }
			let(:hash30) { {1=>true, 2=>true, 3=>true, 4=>true, 5=>false, 6=>true, 7=>true, 8=>false, 9=>true} }
			it 'hash for cell with t/f for all nums' do
				expect(cell_conflicts(board, [0,1])).to eq hash_more1
			end

			it 'hash for cell (1,3) with t/f for all nums FOR SURE FALSE ON 1' do
				expect(cell_conflicts(board, [1,3])).to eq hash1
			end

			it 'hash for cell(3,0) with t/f for all nums  FOR SURE FALSE ON 5, 8' do
				expect(cell_conflicts(board, [3,0])).to eq hash30
			end

		end



	end
end




