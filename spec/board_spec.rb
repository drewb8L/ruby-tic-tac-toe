# frozen_string_literal: true

require 'rspec'
require_relative '../src/board'

describe Board do
  it 'should initialize board with blank spaces' do
    expect(subject.board_spaces).to eq({ "7": ' ', "8": ' ', "9": ' ', "4": ' ', "5": ' ', "6": ' ', "1": ' ',
                                         "2": ' ', "3": ' ' })
  end

  it 'square 7 should be string with space " "' do
    expect(subject.board_spaces[:'7']).to eq(' ')
  end

  it 'should return true if all squares are taken by players' do
    expect(subject.board_full?).to be_falsey
  end
end

context Board do
  it 'should return true on board_full?' do
    subject.board_spaces = { '7' => 'X', '8' => 'X', '9' => 'O', '4' => 'O', '5' => 'X', '6' => 'O', '1' => 'X',
                             '2' => 'X', '3' => 'O' }
    expect(subject.board_full?).to be_truthy
  end
end

context Board do
  it 'should return false on unoccupied space' do
    subject.board_spaces = { '7' => ' ', '8' => 'X', '9' => 'O', '4' => 'O', '5' => 'X', '6' => 'O', '1' => 'X',
                             '2' => 'X', '3' => 'O' }

    expect(subject.space_occupied?('7')).to be_falsey
  end
  it 'should return true on occupied space' do
    subject.board_spaces = { '7' => 'X', '8' => 'X', '9' => 'O', '4' => 'O', '5' => 'X', '6' => 'O', '1' => 'X',
                             '2' => 'X', '3' => 'O' }
    expect(subject.space_occupied?('7')).to be_truthy
  end
end
