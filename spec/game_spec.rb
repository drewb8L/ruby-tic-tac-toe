# frozen_string_literal: true

require 'rspec'
require 'stringio'
require_relative '../src/game'

describe Game do
  let(:subject) { Game.new }

  it 'should initialize game_over to false' do
    expect(subject.game_over).to be_falsey
  end

  it 'should instantiate a TttBoard object' do
    expect(subject.game_board).not_to be(nil)
  end

end
