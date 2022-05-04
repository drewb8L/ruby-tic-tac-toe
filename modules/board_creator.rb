module Board_creator
  module Tic_tac_toe_board
    class << self
      def create_ttt_board
        require_relative '../src/board'
        Board.new
      end
    end
  end
end
