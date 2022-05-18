# frozen_string_literal: true

require_relative '../modules/win_conditions'
# Game rules for TTT
class Rules
  attr_accessor :board, :game_over, :game_draw

  def initialize(board)
    @board = board
    @game_over = false
    @game_draw = false
  end
  # Was Not being used at all!
  # def space_occupied?(choice)
  #   if @board.board_spaces.fetch(choice) == ' '
  #     false
  #   else
  #     puts "Space #{choice} taken! Please choose again."
  #     true
  #   end
  # end

  def valid_square_choice_input?(input)
    if @board.board_spaces[:"#{input}"] == ' ' && input in (1..9)
      input.to_s
    elsif @board.board_spaces[:"#{input}"] != ' '
      false
    end
  end

  def check_draw
    board_full? ? @game_draw = true : false
  end

  def board_full?
    square = 0
    @board.board_spaces.each_value do |v|
      square += 1 if v != ' '
    end
    square == 9
  end

  def check_win_condition
    if WinConditions.row_wins(@board) || WinConditions.column_wins(@board) || WinConditions.diagonal_wins(@board)
      @game_over = true
    else
      @game_over = false
    end
  end
end
