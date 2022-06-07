# frozen_string_literal: true

require_relative '../src/player_director'
require_relative '../src/player_builder'
require_relative '../src/classic_ttt_game_factory'
require_relative '../src/lite3_ttt_game_factory'

# Home for the player and game builders
class Client
  attr_accessor :players, :options

  def initialize
    @options = { board: nil, players: { p1: '', p2: '' }, cpu_opponent: false, rules: nil, board_size: 3 }
  end

  def classic_ttt_game
    classic_ttt_factory = ClassicTttGameFactory.new(@options)
    game = classic_ttt_factory.create_game
    game.begin_game
  end

  def lite3_ttt_game
    lite3_factory = Lite3TttGameFactory.new(@options)
    game = lite3_factory.create_game
    game.begin_game
  end

  def build_player
    builder = PlayerBuilder.new
    director = PlayerDirector.new(builder)
    puts 'Player setup'
    director.build_human_player
    @options[:players].store(:p1, director.builder.human_player1)
    @options[:players].store(:p2, director.builder.human_player2)
    arrange_players
  end

  def build_cpu_player
    builder = PlayerBuilder.new
    director = PlayerDirector.new(builder)
    puts 'Human player details'
    director.build_cpu_player
    @options[:players].store(:p1, director.builder.human_player1)
    @options[:players].store(:p2, director.builder.cpu_player)
    arrange_players
  end

  def arrange_players
    return unless @options[:players][:p1].position == '2'

    player = @options[:players][:p1]
    @options[:players][:p1] = @options[:players][:p2]
    @options[:players][:p2] = player
  end
end
