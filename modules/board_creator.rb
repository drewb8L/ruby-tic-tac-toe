# frozen_string_literal: true

module BoardCreator
  # Board Creator module
  module TicTacToeBoard
    class << self
      def create_ttt_board
        require_relative '../src/board'
        Board.new
      end
    end
  end
end
