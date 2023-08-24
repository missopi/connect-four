# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  subject(:new_player) {described_class.new('Sophie', 'red')}

  context 'when a new player is created' do
    it 'it returns the player name and token' do
      player = new_player
      expect(player).to eq('Sophie', 'red')
    end
  end
end