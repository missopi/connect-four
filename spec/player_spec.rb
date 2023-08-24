# frozen_string_literal: true

require_relative '../lib/player'

describe Player do
  let(:get_token) { double('token', value: 'red')}
  subject(:player) {described_class.new('Sophie', get_token)}

  context 'when a new player is created' do
    xit 'it is assigned a token' do
      assigned_token = player.token
      expect(assigned_token).to eq('red')
    end
  end
end