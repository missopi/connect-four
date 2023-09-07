# frozen_string_literal: true

require_relative '../lib/game'

describe Game do
  describe '#assign_current_player' do
    subject(:current_player) { described_class.new }
    let(:player_one) { current_player.instance_variable_get(:@player_one) }
    let(:player_two) { current_player.instance_variable_get(:@player_two) }

    context 'on turn one' do
      it 'the current player is player one' do
        turn = 1
        player = current_player.assign_current_player(turn)
        expect(player).to eq(player_one)
      end
    end

    context 'on turn six' do
      it 'the current player is player two' do
        turn = 6
        player = current_player.assign_current_player(turn)
        expect(player).to eq(player_two)
      end
    end
  end

  describe '#play' do
  end

  describe '#player_turn' do
  end

  describe '#valid_move' do
    subject(:valid_game_move) { described_class.new }

    context 'when a player chooses column 5' do
      it 'returns true' do
        choice = 5
        result = valid_game_move.valid_move?(choice)
        expect(result).to be true
      end
    end

    context 'when a player chooses column 10' do
      it 'is invalid' do
        choice = 10
        result = valid_game_move.valid_move?(choice)
        expect(result).to be_falsy
      end
    end
  end

  describe '#space_available?' do
    subject(:column_space) { described_class.new }
    let(:board) { column_space.instance_variable_get(:@board) }

    context 'when column 3 is full' do
      before do
        board.board[0][3] = 'red_token'
      end

      it 'is falsy' do
        space = column_space.space_available?(3)
        expect(space).to be_falsy
      end
    end

    context 'when column 2 has space' do
      before do
        board.board[0][2] = ' ● '
      end

      it 'returns true' do
        space = column_space.space_available?(2)
        expect(space).to be true
      end
    end
  end

  describe '#board_full' do
    subject(:full_game_board) { described_class.new }

    before do
      allow(full_game_board).to receive(:puts)
    end

    context 'on turn 42' do
      it 'the board is full' do
        turn = 42
        full_board = full_game_board.board_full(turn)
        expect(full_board).to be true
      end
    end
  end

  describe '#game_over?' do
    subject(:game_win) { described_class.new }
    let(:board) { game_win.instance_variable_get(:@board) }
    let(:player) { instance_double(Player, name: 'Sophie', token: 'red_token') }

    context 'when the game is over' do
      before do
        allow(board).to receive(:win).and_return(true)
      end

      it 'congratulates winner' do
        expect(game_win).to receive(:puts).with("\nCongratulations Sophie, you won!!")
        game_win.game_over?(player)
      end
    end
  end
end
