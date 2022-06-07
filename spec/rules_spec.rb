# frozen_string_literal: true

require 'rspec'
require_relative '../src/rules'
require_relative '../src/ttt_rules'
require_relative '../src/lite3_rules'
require_relative '../src/ttt_board'

# rubocop:disable Metrics/BlockLength

describe Rules do
  let(:board) { Board.new }
  subject { described_class.new(:board) }
  it 'should respond to a game_over method' do
    expect(subject.respond_to?('game_over')).to be_truthy
  end

  describe TttRules do
    subject { described_class.new(TttBoard.new) }
    it 'should return truthy when full' do
      subject.board.board_spaces[0] = 'X '
      subject.board.board_spaces[1] = 'X '
      subject.board.board_spaces[2] = 'X '
      subject.board.board_spaces[3] = 'X '
      subject.board.board_spaces[4] = 'X '
      subject.board.board_spaces[5] = 'X '
      subject.board.board_spaces[6] = 'X '
      subject.board.board_spaces[7] = 'X '
      subject.board.board_spaces[8] = 'X '
      expect(subject.board_full?).to be_truthy
    end
  end

  describe Lite3Rules do
    subject { described_class.new(TttBoard.new) }
    it 'should return falsey when a space can be occupied' do
      subject.board.board_spaces[1] = 'X '
      subject.board.board_spaces[2] = 'X '
      subject.board.board_spaces[3] = 'X '
      subject.board.board_spaces[4] = 'X '
      subject.board.board_spaces[5] = 'X '
      subject.board.board_spaces[6] = 'X '
      subject.board.board_spaces[7] = 'X '
      subject.board.board_spaces[8] = 'X '
      expect(subject.board_full?).to be_falsey
    end
  end
  # rubocop:enable Metrics/BlockLength
end
