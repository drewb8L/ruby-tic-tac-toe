# frozen_string_literal: true

require 'rspec'
require_relative '../src/ttt_board'

describe TttBoard do
  it 'should initialize board with blank spaces' do
    expect(subject.board_spaces).to eq({ 0 => '00', 1 => '01', 2 => '02', 3 => '03', 4 => '04', 5 => '05', 6 => '06',
                                         7 => '07', 8 => '08' })
  end

  it 'square 7 should be string with space " "' do
    expect(subject.board_spaces[7]).to eq('07')
  end

  context Board do
    let(:board) { described_class.new(5) }
    it 'should have a size of 9' do
      expect(board.board_spaces.length).to be(25)
    end
  end
end
