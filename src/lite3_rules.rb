# frozen_string_literal: true

class Lite3Rules
  attr_accessor :board, :game_over, :game_draw

  def initialize(board)
    @board = board
    @game_over = false
    @game_draw = false
    @lite3_turn_counter = 0
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

  def lite3_rules(spaces)
    options = []
    spaces.each_pair do |key, value|
      options << key if ['X ', 'O '].include?(value)
    end
    pick = options[(Random.rand(0..options.length - 1))]
    @board.board_spaces[pick] = format('%02d', pick)
    puts "Lite3 Removes Space: #{pick}"
  end

  def cpu_turn_counter
    increment_counter
    check_counter
    puts "Lite3 counter: #{@lite3_turn_counter}"
  end

  def increment_counter
    @lite3_turn_counter += 1
  end

  def reset_counter
    @lite3_turn_counter = 0
  end

  # rubocop:disable Style/GuardClause
  def check_counter
    if @lite3_turn_counter > 3
      lite3_rules(@board.board_spaces)
      reset_counter
    end
  end
  # rubocop:enable Style/GuardClause

  def check_win_condition
    @game_over = if WinConditions.row_wins(@board, @board.rows) ||
                    WinConditions.diagonal_wins_high(@board, @board.rows) ||
                    WinConditions.diagonal_wins_low(@board, @board.rows) ||
                    WinConditions.column_wins(@board, @board.rows)
                   true
                 else
                   false
                 end
  end
end
