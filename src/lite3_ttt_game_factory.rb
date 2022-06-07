# frozen_string_literal: true

require_relative '../src/classic_ttt_game_factory'
require_relative '../src/lite3_rules'
require_relative '../src/lite3_board'
require_relative '../src/game'

class Lite3TttGameFactory < AbstractGameFactory
  def initialize(options)
    super
    @options = options
    board = Lite3Board.new(@options[:board_size])
    @options[:rules] = Lite3Rules.new(board)
  end

  def create_game
    Game.new(@options)
  end
end
