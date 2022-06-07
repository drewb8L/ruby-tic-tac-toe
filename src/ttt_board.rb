# frozen_string_literal: true

require_relative '../src/board'
# TTT board
class TttBoard < Board
  attr_accessor :board_spaces, :board_spaces_example

  def initialize(size = 3)
    super
    board = make_board
    @board_spaces = board
  end
end
