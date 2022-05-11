# frozen_string_literal: true

require_relative 'game'
require_relative 'board'

def main
  board = Board.new
  game = Game.new(board)
  game.begin_game
end

main
