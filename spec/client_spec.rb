# frozen_string_literal: true

require 'rspec'
require 'stringio'
require_relative '../src/player_builder'
require_relative '../src/client'
require_relative '../src/lite3_ttt_game_factory'
require_relative '../src/classic_ttt_game_factory'

describe Client do

  it 'should return a human player and a cpu player' do
    subject.build_player
    subject.build_cpu_player
    expect(subject.options[:players][:p2].class).to eq(CpuPlayer)
    expect(subject.options[:players][:p1].class).to eq(HumanPlayer)
    puts subject.options[:players][:p1].position

  end
  it 'should send options to the game builder and return the correct game' do
    expect(subject.classic_ttt_game).to be_instance_of(Game)
  end


end
