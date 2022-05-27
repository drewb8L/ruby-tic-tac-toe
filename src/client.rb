# frozen_string_literal: true
require_relative '../src/player_director'
require_relative '../src/player_builder'
require_relative '../src/abstractGameFactory'

class Client
  attr_accessor :players

  def initialize
    @players = {}
  end
  def classic_ttt_game(game_factory)

  end

  def lite3_ttt_game(game_factory)
  end

  def build_player
    builder = PlayerBuilder.new
    director = PlayerDirector.new(builder)
    puts 'Player setup'
    @players.store(:human_player, director.build_human_player)
  end

  def build_cpu_player
    builder = PlayerBuilder.new
    director = PlayerDirector.new(builder)


    puts 'Creating cpu player'
    @players.store(:cpu_player, director.build_cpu_player)
  end
end
