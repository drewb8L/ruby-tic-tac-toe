# frozen_string_literal: true

require_relative '../src/board'
require_relative '../modules/board_creator'
require_relative '../modules/win_conditions'
require_relative '../src/ai'

# Manages the game
class Game
  include BoardCreator
  attr_accessor :game_won, :game_over, :game_board, :players

  def initialize
    @game_won = false
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
      true
    else
      false
    end
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
    @game_over = check_win_condition || @game_board.board_full?
    if !@game_over || !@game_board.board_full?
      @game_board.board_spaces[:"#{choice}"] = @turn[@counter]
      @game_board.draw_board
    end

  end

  def cpu_turn
    if !@game_over && !@game_board.board_full?
      @counter = @counter.zero? ? 1 : 0
      puts "CPU's turn..."
      pick = Ai.pick_space(@game_board.board_spaces)
      puts " cpu picks #{pick}"
      @game_board.board_spaces[:"#{pick}"] = @turn[@counter]
      @game_board.draw_board
      puts 'cpu turn ended'
      check_win_condition || @game_board.board_full? ? @game_over = true : @counter = @counter.zero? ? 1 : 0
    end
  end

  def play_game
    # Initialize counter
    @counter = 0
    # Start main game play loop
    while !@game_over || !@game_won
      @turn = [@players[:p1], @players[:p2]]

      if !check_win_condition
        puts 'Player One'
        player_turn

      elsif @game_over
        puts "Player #{@turn[@counter]} wins!"
        break
      elsif @game_board.board_full?
        !@game_over
      end

      @game_over = cpu_turn
    end
  end

end
