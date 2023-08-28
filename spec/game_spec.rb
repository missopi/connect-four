# frozen_string_literal: true

require_relative '../lib/game'

describe Game do
  describe '#play' do
  end

  describe '#player_turn' do
  end

  describe '#player_input' do
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
      it 'to be false' do
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

  describe '#final_message' do
  end
end
