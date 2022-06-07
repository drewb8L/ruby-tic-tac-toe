# frozen_string_literal: true

require 'rspec'
require_relative '../src/ttt_board'

describe TttBoard do
  let(:board) { described_class.new }
  it 'should initialize board with numbered spaces' do
    expect(subject.board_spaces).to eq({ 0 => '00', 1 => '01', 2 => '02', 3 => '03', 4 => '04', 5 => '05', 6 => '06',
                                         7 => '07', 8 => '08' })
  end
  let(:board) { described_class.new }
  it 'square 7 should be string with "07"' do
    expect(subject.board_spaces[7]).to eq('07')
  end

  context Board do
    let(:board) { described_class.new(5) }
    it ' when user inputs a 5, user should get a board size of 25 spaces' do
      expect(board.board_spaces.length).to be(25)
    end
  end

  context Board do
    let(:board) { described_class.new(4) }
    it ' when user inputs a 4, user should get a board size of 16 spaces' do
      expect(board.board_spaces.length).to be(16)
    end
  end
end
