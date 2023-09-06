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
        current_player = turn.odd? ? player_one : player_two
        expect(current_player).to eq(player_one)
      end
    end

    context 'on turn six' do
      it 'the current player is player two' do
        turn = 6
        current_player = turn.odd? ? player_one : player_two
        expect(current_player).to eq(player_two)
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
      it 'to be invalid' do
        choice = 10
        result = valid_game_move.valid_move?(choice)
        expect(result).to be_falsy
      end
    end
  end

  describe 'game_over?' do
  end

  describe 'wim' do
  end

  describe 'draw' do
  end
end
