# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  describe '#initialize' do
    subject(:new_board) { described_class.new }

    matcher :be_empty do
      match { |cell| cell == ' ● ' }
    end

    context 'when a new board is created' do
      xit 'is an empty board' do
        board_cells = new_board.board[0]
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

  let(:red_token) { described_class.new.red_token }
  let(:yellow_token) { described_class.new.yellow_token }

  describe '#display_board' do
    subject(:board_displayed) { described_class.new }

    context 'when displaying an empty board' do
      xit 'prints the board' do
        expect do
          board_displayed.display_board([
                                          [' ● ', ' ● ', ' ● ', ' ● '],
                                          [' ● ', ' ● ', ' ● ', ' ● '],
                                          [' ● ', ' ● ', ' ● ', ' ● ']
                                        ])
        end.to output(" ●  ●  ●  ● \n ●  ●  ●  ● \n ●  ●  ●  ● \n").to_stdout
      end
    end
  end

  describe '#update_board' do
    subject(:board_updated) { described_class.new }

    context 'when updating 1st row of 4th column with red token' do
      before do
        board_updated.update_board(1, 4, red_token)
      end

      xit 'updates the board' do
        board = board_updated.instance_variable_get(:@board)
        updated_cell = board[1][4]
        expect(updated_cell).to eq(red_token)
      end
    end

    context 'when updating 2nd row of 6th column with yellow token' do
      before do
        board_updated.update_board(2, 6, yellow_token)
      end

      xit 'updates the board' do
        board = board_updated.instance_variable_get(:@board)
        updated_cell = board[2][6]
        expect(updated_cell).to eq(yellow_token)
      end
    end
  end

  describe '#available_row' do
    subject(:board_available) { described_class.new }

    before do
      board_available.instance_variable_get(:@board)
      allow(@board).to receive(:update_board)
    end

    context 'if the first row is empty' do
      xit 'returns row' do
        column = 4
        expect(board_available.available_row(column)).to eq(5)
      end
    end

    context 'if the first two rows are full' do
      xit 'returns row three' do
        board_available.update_board(5, 4, red_token)
        board_available.update_board(4, 4, yellow_token)
        expect(board_available.available_row(4)).to eq(3)
      end
    end
  end
end

RSpec.configure do |config|
  config.mock_with :rspec do |mocks|
    mocks.allow_message_expectations_on_nil = true
  end
end
