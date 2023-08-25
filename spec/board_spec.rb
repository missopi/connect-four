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
  let(:yellow_token) { described_class.new.yellow_token }

  describe '#display_board' do
    subject(:board_displayed) { described_class.new }

    context 'when displaying an empty board' do
      it 'prints the board' do
        expect do
          board_displayed.display_board([
                                          [' _ ', ' _ ', ' _ ', ' _ '],
                                          [' _ ', ' _ ', ' _ ', ' _ '],
                                          [' _ ', ' _ ', ' _ ', ' _ ']
                                        ])
        end.to output(" _  _  _  _ \n _  _  _  _ \n _  _  _  _ \n").to_stdout
      end
    end
  end

  describe '#update_board' do
    subject(:board_updated) { described_class.new }

    context 'when updating 1st row of 4th column with red token' do
      before do
        board_updated.update_board(1, 4, red_token)
      end

      it 'updates the board' do
        board = board_updated.instance_variable_get(:@board)
        updated_cell = board[1][4]
        expect(updated_cell).to eq(red_token)
      end
    end

    context 'when updating 2nd row of 6th column with yellow token' do
      before do
        board_updated.update_board(2, 6, yellow_token)
      end

      it 'updates the board' do
        board = board_updated.instance_variable_get(:@board)
        updated_cell = board[2][6]
        expect(updated_cell).to eq(yellow_token)
      end
    end
  end
end
