# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  subject(:new_player) {described_class.new('Sophie', 'red')}

  context 'when a new player is created' do
    it 'returns the player name' do
      player_name = new_player.name
      expect(player_name).to eq('Sophie')
    end

    it 'returns the player token' do
      player_token = new_player.token
      expect(player_token).to eq('red')
    end
  end
end