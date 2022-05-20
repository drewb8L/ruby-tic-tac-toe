require 'rspec'
require_relative '../modules/game_setup'
describe GameSetup::TicTacToeGame do
  subject { described_class.player_setup }

  it 'should return a hash of players based on user input' do
  end
end