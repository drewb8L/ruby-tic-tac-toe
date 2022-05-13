# frozen_string_literal: true

require 'rspec'
require 'stringio'
require_relative '../src/game'

describe Game do
  let(:subject) { Game.new }
  let(:input) { StringIO.new('5') }
  it 'should set initialize game_won to false' do
    expect(subject.game_won).to be_falsey
  end

  it 'should initialize game_over to false' do
    expect(subject.game_over).to be_falsey
  end

  it 'should instantiate a Board object' do
    expect(subject.game_board).not_to be(nil)
  end

  # TODO fix me
  it 'should take player space choice and return correct string or false' do
    $stdin = input
    expect(subject.player_square_choice).to output("Choose a square\n").to_stdout.and be_falsey
    $stdin = STDIN
  end

  # Game win conditions
  it 'should return true once win conditions are met' do
    # Top row win X
    subject.game_board.board_spaces = { '7': 'X', '8': 'X', '9': 'X', '4': 'O', '5': 'X', '6': 'O', '1': 'X', '2': 'X',
                                        '3': 'O' }
    expect(subject.check_win_condition).to be_truthy

    # Middle column win O
    subject.game_board.board_spaces = { '7': 'X', '8': 'O', '9': 'X', '4': 'O', '5': 'O', '6': 'X', '1': 'X', '2': 'O',
                                        '3': 'O' }
    expect(subject.check_win_condition).to be_truthy

    # Non-win check
    subject.game_board.board_spaces = { '7': ' ', '8': 'O', '9': 'X', '4': ' ', '5': 'O', '6': 'X', '1': ' ', '2': ' ',
                                        '3': ' ' }
    expect(subject.check_win_condition).to be_falsey
  end
end
