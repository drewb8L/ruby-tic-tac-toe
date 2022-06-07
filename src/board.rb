# frozen_string_literal: true

# concrete board class and public interface
class Board
  attr_accessor :rows, :board_spaces, :example_board

  def initialize(rows = 3)
    @rows = rows
    @board_spaces = make_board
    @example_board = make_example_board
  end

  def make_board
    board = {}
    size = @rows * @rows
    size.times { |element| board.store(element, format('%02d', element)) }
    board
  end

  def make_example_board
    board = {}
    size = @rows * @rows
    size.times { |element| board.store(element, format('%02d', element)) }
    board
  end

  def filler(rows)
    puts ''
    rows -= 2
    filler = String.new
    rows.times { filler << '--+' }
    filler
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def draw_board
    rows = @board_spaces.size / @rows
    col = @board_spaces.size / @rows
    spaces = @board_spaces.size
    until spaces.zero?
      col.times do |c|
        rows.times do |r|
          print @board_spaces.fetch(spaces - (r + 1)).to_s
          print '|' if r != rows - 1
        end
        puts "--+#{filler(rows)}--"
        spaces -= rows
      end
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength
end
