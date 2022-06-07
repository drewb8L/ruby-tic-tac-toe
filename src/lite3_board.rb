# frozen_string_literal: true

require_relative '../src/board'
class Lite3Board < Board
  attr_accessor :board_spaces, :board_spaces_example

  def initialize(size)
    super
    super
    board = make_board
    @board_spaces = board
  end
end
