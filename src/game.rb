# frozen_string_literal: true

require_relative '../src/board'
require_relative '../modules/board_creator'
require_relative '../modules/win_conditions'
require_relative '../src/ai'

# Manages the game
class Game
  include BoardCreator
  attr_accessor :game_draw, :game_over, :game_board, :players

  def initialize
    @game_draw = false
    @game_over = false
    @game_board = BoardCreator::TicTacToeBoard.create_ttt_board
    @players = { p1: '', p2: '' }
  end

  def begin_game
    player_setup
    @game_board.draw_example_board
    puts "This board mirrors the input from a numpad on a keyboard.\nEnter numbers to make a @move."
    play_game
  end

  def player_square_choice
    puts 'Choose a square'
    input = gets.to_i
    # choice will return valid or invalid
    valid_square_choice_input?(input)
  end

  private

  def check_win_condition
    if WinConditions.row_wins(@game_board) ||
       WinConditions.column_wins(@game_board) ||
       WinConditions.diagonal_wins(@game_board)
      @game_over = true
    else
      false
    end
  end

  def check_draw
    @game_board.board_full? ? @game_draw = true : false
  end

  def player_mark_choice(mark)
    %w[X O].include?(mark) ? mark : false
  end

  def player_setup
    valid_mark = false
    puts 'Welcome to Tic-Tac-Toe'
    puts 'Player, please choose a mark.'
    until valid_mark
      puts 'Choose either X or O...'
      mark = gets.chomp.upcase
      valid_mark = player_mark_choice(mark)
    end
    @players[:p1] = valid_mark
    @players[:p2] = valid_mark == 'X'.chomp ? 'O' : 'X'
  end

  def valid_square_choice_input?(input)
    if @game_board.board_spaces[:"#{input}"] == ' ' && input in (1..9)
      input.to_s
    elsif @game_board.board_spaces[:"#{input}"] != ' '
      false
    end
  end

  def player_turn
    choice = player_square_choice
    if !choice && @counter.zero?
      until choice
        puts 'That square is already occupied, please choose an open square.'
        @game_board.draw_board
        choice = player_square_choice
      end
    end
    @game_board.board_spaces[:"#{choice}"] = @turn[@counter]
    @game_board.draw_board
  end

  def cpu_turn
    puts "CPU's turn..."
    pick = Ai.pick_space(@game_board.board_spaces)
    puts " cpu picks #{pick}"
    @game_board.board_spaces[:"#{pick}"] = @turn[@counter]
    @game_board.draw_board
    puts 'cpu turn ended'
  end

  def play_game
    # Initialize counter and turn
    @turn = [@players[:p1], @players[:p2]]
    @counter = 0
    # WORKS BUT NOT DRY!!!
    until @game_over || @game_draw
      player_turn unless check_draw || check_win_condition
      @counter = @counter.zero? ? 1 : 0 unless check_win_condition || check_draw
      cpu_turn unless check_win_condition || check_draw
      @counter = @counter.zero? ? 1 : 0 unless check_win_condition || check_draw
    end
    if @game_over
      puts "Game won by player #{@turn[@counter]}"
    elsif @game_draw
      puts 'The game has ended in a draw!'
    end
  end
end
