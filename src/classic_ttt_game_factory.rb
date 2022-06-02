# frozen_string_literal: true

require_relative '../src/abstract_game_factory'
require_relative '../src/ttt_rules'
require_relative '../src/ttt_board'
require_relative '../src/game'

# Creates classic TTT game instance
class ClassicTttGameFactory < AbstractGameFactory
  attr_accessor :options

  def initialize(options)
    super
    @options = options
    board = TttBoard.new
    @options[:rules] = TttRules.new(board)
    set_position
  end

  def create_game
    Game.new(@options)
  end

  def set_position
    @options[:cpu_opponent] = true if @options[:players][:p1].class || @options[:players][:p2].instance_of?(CpuPlayer)
  end
end
