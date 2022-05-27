# frozen_string_literal: true

class Rules
  attr_accessor :game_over, :board

  def initialize(board)
    @game_over = false
    @board = board
  end
end
