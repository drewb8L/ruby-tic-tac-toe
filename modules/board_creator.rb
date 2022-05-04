# frozen_string_literal: true

module BoardCreator
  module Tic_tac_toe_board
    class << self
      def create_ttt_board
        require_relative '../src/board'
        Board.new
      end
    end
  end
end
