require_relative '../sudoku'

describe "Sudoku" do
	context 'Check array structure for string input' do

	let(:test_string) { "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--" }
	let(:int_array) { [1, 0, 5, 8, 0, 2, 0, 0, 0, 0, 9, 0, 0, 7, 6, 4, 0, 5, 2, 0, 0, 4, 0, 0, 8, 1, 9, 0, 1, 9, 0, 0, 7, 3, 0, 6, 7, 6, 2, 0, 8, 3, 0, 9, 0, 0, 0, 0, 0, 6, 1, 0, 5, 0, 0, 0, 7, 6, 0, 0, 0, 3, 0, 4, 3, 0, 0, 2, 0, 5, 0, 1, 6, 0, 0, 3, 0, 8, 9, 0, 0] }
	let(:board) { [[1, 0, 5, 8, 0, 2, 0, 0, 0], [0, 9, 0, 0, 7, 6, 4, 0, 5], [2, 0, 0, 4, 0, 0, 8, 1, 9], [0, 1, 9, 0, 0, 7, 3, 0, 6], [7, 6, 2, 0, 8, 3, 0, 9, 0], [0, 0, 0, 0, 6, 1, 0, 5, 0], [0, 0, 7, 6, 0, 0, 0, 3, 0], [4, 3, 0, 0, 2, 0, 5, 0, 1], [6, 0, 0, 3, 0, 8, 9, 0, 0]] }

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
		let(:board) { [[1, 0, 5, 8, 0, 2, 0, 0, 0], [0, 9, 0, 0, 7, 6, 4, 0, 5], [2, 0, 0, 4, 0, 0, 8, 1, 9], [0, 1, 9, 0, 0, 7, 3, 0, 6], [7, 6, 2, 0, 8, 3, 0, 9, 0], [0, 0, 0, 0, 6, 1, 0, 5, 0], [0, 0, 7, 6, 0, 0, 0, 3, 0], [4, 3, 0, 0, 2, 0, 5, 0, 1], [6, 0, 0, 3, 0, 8, 9, 0, 0]] }
		let(:board_no_zero_in0) { [[1, 4, 5, 8, 9, 2, 3, 6, 7], [3, 9, 0, 0, 7, 6, 4, 0, 5], [2, 0, 0, 4, 0, 0, 8, 1, 9], [0, 1, 9, 0, 0, 7, 3, 0, 6], [7, 6, 2, 0, 8, 3, 0, 9, 0], [0, 0, 0, 0, 6, 1, 0, 5, 0], [0, 0, 7, 6, 0, 0, 0, 3, 0], [4, 3, 0, 0, 2, 0, 5, 0, 1], [6, 0, 0, 3, 0, 8, 9, 0, 0]] }

			it 'Checks for zero location and returns location' do
				expect(find_zero(board)).to eq [0, 1]
			end

			it 'Checks for zero location and returns location' do
				expect(find_zero(board_no_zero_in0)).to eq [1, 2]
			end
	end

end




