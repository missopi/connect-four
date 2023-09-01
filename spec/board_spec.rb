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
    let(:board) { board_available.instance_variable_get(:@board) }

    context 'when updating 1st row of 4th column with red token' do
      before do
        board_updated.update_board(1, 4, red_token)
      end

      xit 'updates the board' do
        updated_cell = board[1][4]
        expect(updated_cell).to eq(red_token)
      end
    end

    context 'when updating 2nd row of 6th column with yellow token' do
      before do
        board_updated.update_board(2, 6, yellow_token)
      end

      xit 'updates the board' do
        updated_cell = board[2][6]
        expect(updated_cell).to eq(yellow_token)
      end
    end
  end

  describe '#available_row' do
    subject(:board_available) { described_class.new }
    let(:board) { board_available.instance_variable_get(:@board) }

    context 'if the first row is empty' do
      it 'returns row' do
        column = 4
        expect(board_available.available_row(column)).to eq(5)
      end
    end

    context 'if the first two rows are full' do
      before do
        board[4][5] = red_token
        board[5][5] = red_token
      end

      it 'returns row three' do
        expect(board_available.available_row(5)).to eq(3)
      end
    end
  end

  describe '#win_horizontal' do
    subject(:board_horizontal) { described_class.new }
    let(:board) { board_horizontal.instance_variable_get(:@board) }

    context 'when player has a horizontal line of 4' do
      before do
        board[2][1] = red_token
        board[2][2] = red_token
        board[2][3] = red_token
        board[2][4] = red_token
      end

      xit 'returns true' do
        win = board_horizontal.win_horizontal(2, 1, red_token)
        expect(win).to be true
      end
    end

    context 'when player has a horizontal line of 2' do
      before do
        board[2][1] = red_token
        board[2][2] = red_token
      end

      xit 'returns falsy' do
        win = board_horizontal.win_horizontal(2, 1, red_token)
        expect(win).to be_falsy
      end
    end
  end

  describe '#win_vertical' do
    subject(:board_vertical) { described_class.new }
    let(:board) { board_vertical.instance_variable_get(:@board) }

    before do
      board[2][5] = red_token
      board[3][5] = red_token
      board[4][5] = red_token
      board[5][5] = red_token
    end

    context 'when player has a vertical line of 4' do
      xit 'returns true' do
        win = board_vertical.win_vertical(2, 5, red_token)
        expect(win).to be true
      end
    end
  end

  
end


