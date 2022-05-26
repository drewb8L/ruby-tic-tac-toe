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
    director = PlayerDirector.new
    builder = PlayerBuilder.new
    director.builder = builder

    puts 'Player setup'
    # name = $stdin.gets
    # position = $stdin.gets
    # mark = $stdin.gets
    @players.store(:human_player, director.build_human_player)
    
  end

  def build_cpu_player
    director = PlayerDirector.new
    builder = PlayerBuilder.new
    director.builder = builder

    puts 'Creating cpu player'
    @players.store(:cpu_player, director.build_cpu_player)
  end
end
