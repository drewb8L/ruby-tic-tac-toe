# frozen_string_literal: true

require_relative '../modules/win_conditions'
class TttRules
  attr_accessor :board, :game_over, :game_draw

  def initialize(board)
    @board = board
    @game_over = false
    @game_draw = false
  end

  def valid_square_choice_input?(input)
    keys = @board.board_spaces.keys
    keys.include?(input) && @board.board_spaces[input] == format('%02d', input) ? input : false
  end

  def check_draw
    board_full? ? @game_draw = true : false
  end

  def board_full?
    square = 0
    @board.board_spaces.each_value do |v|
      square += 1 if ['X ', 'O '].include?(v)
    end
    square == @board.board_spaces.size
  end

  def check_win_condition
    puts "Game Over? #{@game_over}"
    puts WinConditions.row_wins(@board, @board.rows) ? true : false
    WinConditions.row_wins(@board, @board.rows) ? @game_over = true : @game_over = false
    WinConditions.diagonal_wins_high(@board, @board.rows) ? @game_over = true : @game_over = false
    WinConditions.diagonal_wins_low(@board, @board.rows) ? @game_over = true : @game_over = false
  end
end
