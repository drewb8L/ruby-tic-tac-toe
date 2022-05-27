class Lite3Rules
  attr_accessor :board, :game_over, :game_draw

  def initialize(board)
    @board = board
    @game_over = false
    @game_draw = false
    @lite3_turn_counter = 0
  end

  def valid_square_choice_input?(input)
    if @board.board_spaces[:"#{input}"] == ' ' && input in (1..9)
      increment_counter
      check_counter
      puts "Lite3 counter: #{@lite3_turn_counter}"
      input.to_s
    else
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

  def lite3_rules(spaces)
    options = []
    spaces.each_pair do |key, value|
      options << key if %w[X O].include?(value)
    end
    pick = options[(Random.rand(0..options.length - 1))]
    @board.board_spaces[:"#{pick}"] = ' '
    puts "LITE3 Removes Space: #{pick}"
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

  def check_counter
    if @lite3_turn_counter > 2
      lite3_rules(@board.board_spaces)
      reset_counter
    end

  end

  def check_win_condition
    if WinConditions.row_wins(@board) || WinConditions.column_wins(@board) || WinConditions.diagonal_wins(@board)
      @game_over = true
    else
      @game_over = false
    end
  end
end
