# frozen_string_literal: true

require_relative '../lib/board'

# class for creating and updating the board
describe Board do
  describe '#initialize' do
    subject(:new_board) { described_class.new }

    matcher :be_empty do
      match { |cell| cell == ' ' }
    end

    context 'when a new board is created' do
      xit 'is an empty board' do
        board_cells = new_board.board
        expect(board_cells).to all(be_empty)
      end

      xit 'has 6 rows' do
        rows = new_board.board.size
        expect(rows).to eq(6)
      end

      xit 'has 7 columns' do
        columns = new_board.board[0].size
        expect(columns).to eq(7)
      end
    end
  end

end
