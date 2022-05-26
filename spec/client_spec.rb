require 'rspec'
require 'stringio'
require_relative '../src/player_builder'
require_relative '../src/client'

describe PlayerBuilder do
  context Client do
    it 'should return a human player' do
      allow(subject).to receive(:gets).and_return('Max', 'X', 'p1')
      expect(subject.build_player.class).to eq(HumanPlayer)
      expect(subject.build_cpu_player.class).to eq(CpuPlayer)
      puts subject.players[:human_player].name
      puts subject.players[:cpu_player].name
    end
  end
end
