# frozen_string_literal: true

module BoardCreator
  # Creates A Tic tac toe board or other future boards
  module TicTacToeBoard
    class << self
      def create_ttt_board
        require_relative '../src/board'
        Board.new
      end
    end
  end
end
