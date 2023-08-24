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
        board_cell = new_board.board
        expect(board_cell).to all(be_empty)
      end
    end
  end

end
