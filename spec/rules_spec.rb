require 'rspec'
require_relative '../src/rules'
require_relative '../src/board'

describe Rules do
  let(:board) { Board.new }
  subject { described_class.new(:board) }
  it 'should respond to a game_over method' do
    expect(subject.respond_to?('game_over')).to be_truthy
  end
end
