# frozen_string_literal: true

# concrete board class and public interface
class Board
  attr_accessor :rows
  
  def initialize(rows = 3)
    @rows = rows
    @board_spaces = make_example_board

  end

  def make_board
    board = {}
    size = @rows * @rows
    size.times { |element| board.store(element, '%02d' % element) }
    board
  end

  def make_example_board
    board = {}
    size = @rows * @rows
    size.times { |element| board.store(element, '%02d' % element) }
    board
  end

  def filler(rows)
    puts ''
    rows -= 2
    filler = String.new
    rows.times { filler << '--+' }
    filler
  end

  def draw_board
    rows = @board_spaces.size / @rows
    col = @board_spaces.size / @rows
    spaces = @board_spaces.size
    until spaces.zero?
      col.times do
        rows.times do |r|
          print "#{@board_spaces.fetch(spaces - (r + 1))}"
          if r != rows - 1
            print '|'
          end
        end
        puts "--+#{filler(rows)}--"
        spaces -= rows
      end
    end
  end
  
  
end
