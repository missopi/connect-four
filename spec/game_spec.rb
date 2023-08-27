# frozen_string_literal: true

require_relative '../lib/game'

describe Game do
  describe '#initialize' do
  end

  describe '#create_player' do
    subject(:game_player) { described_class.new(player_one, player_two) }
    let(:player_one) { double(Player, name: 'Sophie', token: ' O ') }
    let(:player_two) { double(Player, name: 'Max', token: ' X ') }

    context 'when creating player one' do
      before do
        allow(game_player).to receive(:puts)
        allow(game_player).to receive(:gets).and_return('Sophie')
      end

      xit 'is created with correct parameters' do
        expect(player_one).to receive(:new).with('Sophie', ' O')
        game_player.create_player(1)
      end
    end

    context 'when creating player two' do
      before do
        allow(game_player).to receive(:puts)
        allow(game_player).to receive(:gets).and_return('Max')
      end

      xit 'is created with correct parameters' do
        expect(player_two).to receive(:new).with('Max', ' X')
        game_player.create_player(2)
      end
    end
  end

  describe '#play' do
  end

  describe '#player_turn' do
  end

  describe '#player_input' do
  end

  describe '#valid_move' do
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
