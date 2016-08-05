require_relative '../sudoku'

describe "Sudoku" do
	context 'Check array structure for string input' do

	let(:test_string) { "1-58-2----9--764-52--4--819-19--73-6762-83-9-----61-5---76---3-43--2-5-16--3-89--" }
	
	it 'is an array of integers' do
		expect(data_to_int).to eq 


	it 'is an array with 9 elements' do
		expect(create_rows(test_string).length).to eq 9
		end
	# it 'is an array with 9 columns'
	# 	expect()

	end
end




