# frozen_string_literal: true

require_relative '../lib/board'

# class for creating and updating the board
describe Board do
  describe '#initialize' do
    subject(:new_board) { described_class.new }

    context 'when a new board is created' do
      it 'is an empty board' do
        board_cells = new_board.board[0]
        expect(board_cells).to all(be_nil)
      end

      it 'has 6 rows' do
        rows = new_board.board.size
        expect(rows).to eq(6)
      end

      it 'has 7 columns' do
        columns = new_board.board[0].size
        expect(columns).to eq(7)
      end
    end
  end

  let(:red_token) { described_class.new.red_token }
  let(:yellow_token) {described_class.new.yellow_token }

  describe '#update_board' do
    subject(:board_updated) { described_class.new }

    context 'when updating 1st row of 4th column with red token' do
      before do
        board_updated.update_board(0, 3, red_token)
      end

      xit 'updates the board' do
        board = board_updated.instance_variable_get(:@board)
        updated_cell = board[0][3]
        expect(updated_cell).to eq(red_token)
      end
    end

    context 'when updating 2nd row of 6th column with yellow token' do
      before do
        board_updated.update_board(1, 5, yellow_token)
      end

      xit 'updates the board' do
        board = board_updated.instance_variable_get(:@board)
        updated_cell = board[1][5]
        expect(updated_cell).to eq(yellow_token)
      end
    end
  end
end
