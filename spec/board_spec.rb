# frozen_string_literal: true

require_relative '../lib/board'

describe Board do
  describe '#initialize' do
    subject(:new_board) { described_class.new }

    matcher :be_empty do
      match { |cell| cell == [' ● ', ' ● ', ' ● ', ' ● ', ' ● ', ' ● ', ' ● '] }
    end

    context 'when a new board is created' do
      it 'is an empty board' do
        board_rows = new_board.board
        expect(board_rows).to all(be_empty)
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
    let(:board) { board_displayed.instance_variable_get(:@board) }

    context 'when displaying an empty board' do
      it 'prints the board' do
        expect { board_displayed.display_board }.to output("\n ●  ●  ●  ●  ●  ●  ● \n ●  ●  ●  ●  ●  ●  ● \n ●  ●  ●  ●  ●  ●  ● \n ●  ●  ●  ●  ●  ●  ● \n ●  ●  ●  ●  ●  ●  ● \n ●  ●  ●  ●  ●  ●  ● \n\n 1  2  3  4  5  6  7 \n").to_stdout
      end
    end
  end

  describe '#update_board' do
    subject(:board_updated) { described_class.new }
    let(:board) { board_updated.instance_variable_get(:@board) }

    context 'when updating 1st row of 4th column with red token' do
      before do
        board[1][4] = red_token
      end

      it 'updates the board' do
        updated_cell = board[1][4]
        expect(updated_cell).to eq(red_token)
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

      it 'returns true' do
        win = board_horizontal.win_horizontal(2, 1, red_token)
        expect(win).to be true
      end
    end

    context 'when player has a horizontal line of 2' do
      before do
        board[2][1] = red_token
        board[2][2] = red_token
      end

      it 'returns falsy' do
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
      it 'returns true' do
        win = board_vertical.win_vertical(2, 5, red_token)
        expect(win).to be true
      end
    end
  end

  describe '#win_left_diagonal' do
    subject(:board_left) { described_class.new }
    let(:board) { board_left.instance_variable_get(:@board) }

    before do
      board[2][2] = red_token
      board[3][3] = red_token
      board[4][4] = red_token
      board[5][5] = red_token
    end

    context 'when player has a left diagonal line of 4' do
      it 'returns true' do
        win = board_left.win_diagonal_left(2, 2, red_token)
        expect(win).to be true
      end
    end
  end

  describe '#win_right_diagonal' do
    subject(:board_right) { described_class.new }
    let(:board) { board_right.instance_variable_get(:@board) }

    before do
      board[2][5] = red_token
      board[3][4] = red_token
      board[4][3] = red_token
      board[5][2] = red_token
    end

    context 'when player has a left diagonal line of 4' do
      it 'returns true' do
        win = board_right.win_diagonal_right(2, 5, red_token)
        expect(win).to be true
      end
    end
  end
end
