# frozen_string_literal: true
require_relative '../src/player_director'
require_relative '../src/player_builder'
require_relative '../src/classic_ttt_game_factory'
require_relative '../src/lite3_ttt_game_factory'

class Client
  attr_accessor :players, :options

  def initialize
    @options = { board: nil, players: { p1: '', p2: '' }, cpu_opponent: false, rules: nil }

  end

  def classic_ttt_game
    classic_ttt_factory = ClassicTttGameFactory.new(@options)
    game = classic_ttt_factory.create_game
    game.begin_game
  end

  def lite3_ttt_game
    lite3_factory = Lite3TttGameFactory.new(@options)
    lite3_factory.create_game
  end

  def build_player
    builder = PlayerBuilder.new
    director = PlayerDirector.new(builder)
    puts 'Player setup'
    @options[:players].store(:p1, director.build_human_player)
  end

  def build_cpu_player
    builder = PlayerBuilder.new
    director = PlayerDirector.new(builder)


    puts 'Creating cpu player'
    @options[:players].store(:p2, director.build_cpu_player)
  end


end

