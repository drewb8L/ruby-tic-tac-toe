# frozen_string_literal: true

require_relative '../src/board'
class Lite3Board < Board
  attr_accessor :board_spaces, :board_spaces_example

  def initialize
    super
    @board_spaces =
      {  '7': ' ', '8': ' ', '9': ' ',
         '4': ' ', '5': ' ', '6': ' ',
         '1': ' ', '2': ' ', '3': ' ' }

    @board_spaces_example =
      {  '7': '7', '8': '8', '9': '9',
         '4': '4', '5': '5', '6': '6',
         '1': '1', '2': '2', '3': '3' }
  end

  def draw_board
    puts " #{@board_spaces[:'7']} |#{@board_spaces[:'8']} |#{@board_spaces[:'9']}"
    puts ' --+--+--'
    puts " #{@board_spaces[:'4']} |#{@board_spaces[:'5']} |#{@board_spaces[:'6']}"
    puts ' --+--+--'
    puts " #{@board_spaces[:'1']} |#{@board_spaces[:'2']} |#{@board_spaces[:'3']}"
  end

  def draw_example_board
    puts " #{@board_spaces_example[:'7']} |#{@board_spaces_example[:'8']} |#{@board_spaces_example[:'9']}"
    puts ' --+--+--'
    puts " #{@board_spaces_example[:'4']} |#{@board_spaces_example[:'5']} |#{@board_spaces_example[:'6']}"
    puts ' --+--+--'
    puts " #{@board_spaces_example[:'1']} |#{@board_spaces_example[:'2']} |#{@board_spaces_example[:'3']}"
  end
end
