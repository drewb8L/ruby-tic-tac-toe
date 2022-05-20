# frozen_string_literal: true

require 'rspec'
require_relative '../src/rules'
require_relative '../src/board'
require_relative '../src/game'

# Moving rule logic away from game and board classes, they don't need to know implementation details of rules
board = Board.new

describe Rules do
  subject { described_class.new(board) }
  it 'should exist' do
    expect(subject).to be_instance_of(Rules)
  end
end

context Rules do
  subject { described_class.new(board) }
  it 'should return true on board_full?' do
    subject.board.board_spaces = { '7' => 'X', '8' => 'X', '9' => 'O', '4' => 'O', '5' => 'X', '6' => 'O', '1' => 'X',
                                   '2' => 'X', '3' => 'O' }
    expect(subject.board_full?).to be_truthy
  end
end

context Rules do
  subject { described_class.new(board) }
  it 'should return false on unoccupied space' do # Broken test
    subject.board.board_spaces = { '7' => ' ', '8' => 'X', '9' => 'O', '4' => 'O', '5' => 'X', '6' => 'O', '1' => 'X',
                                   '2' => 'X', '3' => 'O' }
    puts subject.board.board_spaces
    expect(subject.valid_square_choice_input?('7')).to be_truthy
  end
  it 'should return true on occupied space' do # Broken test
    subject.board.board_spaces = { '7' => 'X', '8' => 'X', '9' => 'O', '4' => 'O', '5' => 'X', '6' => 'O', '1' => 'X',
                                   '2' => 'X', '3' => 'O' }
    puts subject.board.board_spaces
    expect(subject.valid_square_choice_input?('7')).to be_falsey
  end
  # Game win conditions
  it 'should return true once win conditions are met' do
    # Top row win X
    subject.board.board_spaces = { '7': 'X', '8': 'X', '9': 'X', '4': 'O', '5': 'X', '6': 'O', '1': 'X', '2': 'X',
                                   '3': 'O' }
    expect(subject.check_win_condition).to be_truthy

    # Middle column win O
    subject.board.board_spaces = { '7': 'X', '8': 'O', '9': 'X', '4': 'O', '5': 'O', '6': 'X', '1': 'X', '2': 'O',
                                   '3': 'O' }
    expect(subject.check_win_condition).to be_truthy

    # Non-win check
    subject.board.board_spaces = { '7': ' ', '8': 'O', '9': 'X', '4': ' ', '5': 'O', '6': 'X', '1': ' ', '2': ' ',
                                   '3': ' ' }
    expect(subject.check_win_condition).to be_falsey
  end
end
