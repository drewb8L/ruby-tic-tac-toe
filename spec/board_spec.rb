# frozen_string_literal: true

require 'rspec'
require_relative '../src/board'

describe Board do
  it 'should initialize board with blank spaces' do
    expect(subject.board_spaces).to eq({ '7': ' ', '8': ' ', '9': ' ', '4': ' ', '5': ' ', '6': ' ', '1': ' ',
                                         '2': ' ', '3': ' ' })
  end

  it 'square 7 should be string with space " "' do
    expect(subject.board_spaces[:'7']).to eq(' ')
  end
end

