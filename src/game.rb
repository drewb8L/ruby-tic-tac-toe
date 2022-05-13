# frozen_string_literal: true

require_relative '../src/board'
require_relative '../modules/board_creator'
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
    puts "This board mirrors the input from a numpad on a keyboard.\nEnter numbers to make a move."
    play_game
  end

  def player_square_choice
    puts 'Choose a square'
    input = gets.to_i
    # choice will return valid or invalid
    valid_square_choice_input?(input)
  end

  def check_win(arr1)
    true if arr1.eql?(%w[X X X]) || arr1.eql?(%w[O O O])
  end

  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength
  def check_win_condition
    top_row_win = @game_board.board_spaces.values_at(:'7', :'8', :'9')
    middle_row_win = @game_board.board_spaces.values_at(:'4', :'5', :'6')
    bottom_row_win = @game_board.board_spaces.values_at(:'1', :'2', :'3')

    left_column_win = @game_board.board_spaces.values_at(:'7', :'4', :'1')
    middle_column_win = @game_board.board_spaces.values_at(:'8', :'5', :'2')
    right_column_win = @game_board.board_spaces.values_at(:'9', :'6', :'3')

    diagonal_win = @game_board.board_spaces.values_at(:'7', :'5', :'3')
    diagonal_win_other = @game_board.board_spaces.values_at(:'1', :'5', :'9')

    wins = [top_row_win, middle_row_win, bottom_row_win,
            left_column_win, middle_column_win, right_column_win,
            diagonal_win, diagonal_win_other]

    if wins.map { |i| check_win(i) }.join == ''
      false
    else
      @game_won = true
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength

  private

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

  # TODO: DRY up game loop
  # rubocop:disable Metrics/AbcSize, Metrics/MethodLength, Metrics/CyclomaticComplexity,  Metrics/PerceivedComplexity
  def play_game
    # Initialize counter
    counter = 0

    # Start main game play loop
    while !@game_over || !@game_won

      move = [@players[:p1], @players[:p2]]
      puts 'Player One'
      choice = player_square_choice

      # Logic for the human player
      if !choice && counter.zero?
        until choice
          puts 'That square is already occupied, please choose an open square.'
          @game_board.draw_board
          choice = player_square_choice
        end
      end
      @game_board.board_spaces[:"#{choice}"] = move[counter]
      puts counter
      @game_board.draw_board

      # If board isn't full, CPU can play
      if @game_board.board_full?
        @game_over = true
        break
      end

      if check_win_condition
        puts "Player #{move[counter]} wins!"
        @game_over = true
        break
      else
        # Player turn ends, flip counter
        counter = counter.zero? ? 1 : 0
      end

      next unless counter == 1 && !@game_over

      puts "CPU's turn..."
      pick = Ai.pick_space(@game_board.board_spaces)
      puts " cpu picks #{pick}"
      @game_board.board_spaces[:"#{pick}"] = move[counter]
      puts counter
      @game_board.draw_board
      puts 'cpu turn ended'
      if check_win_condition
        puts "Player #{move[counter]} wins!"
        @game_over = true
        break
      else
        counter = counter.zero? ? 1 : 0
      end
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/MethodLength, Metrics/CyclomaticComplexity,  Metrics/PerceivedComplexity
end
