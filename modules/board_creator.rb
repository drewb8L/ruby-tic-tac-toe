# frozen_string_literal: true

module BoardCreator
  # Creates a classic Tic tac toe board
  module TicTacToeBoard
    class << self
      def create_ttt_board
        require_relative '../src/board'
        Board.new
      end

      def create_lite3_board
        require_relative '../src/lite3_board'
        Lite3Board.new
      end
    end
  end
end
