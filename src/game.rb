# frozen_string_literal: true

require_relative '../src/ai'
require_relative '../src/lite3_board'

# Manages the game
class Game
  attr_accessor :players, :rules

  def initialize(params)
    @rules = params[:rules]
    @players = params[:players]
    @cpu_player = params[:cpu_opponent]
  end

  def begin_game
    @rules.board.draw_example_board
    puts "This board mirrors the input from a numpad on a keyboard.\nEnter numbers to make a move."
    play_game
  end

  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity
  def take_turns
    until @rules.game_over || @rules.game_draw
      player_one unless @rules.check_draw || @rules.check_win_condition
      @counter = @counter.zero? ? 1 : 0 unless @rules.check_win_condition || @rules.check_draw
      player_two unless @rules.check_win_condition || @rules.check_draw
      @counter = @counter.zero? ? 1 : 0 unless @rules.check_win_condition || @rules.check_draw
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  private

  def player_square_choice
    puts 'Choose a square'
    input = gets.to_i
    # choice will return valid or invalid
    @rules.valid_square_choice_input?(input)
  end

  def player_one
    if @players[:p1].instance_of?(CpuPlayer)
      cpu_turn
    else
      human_player_turn
    end
  end

  def player_two
    if @players[:p2].instance_of?(CpuPlayer)
      cpu_turn
    else
      human_player_turn
    end
  end

  def human_player_turn
    choice = player_square_choice
    if !choice && @counter.zero?
      until choice
        puts 'That square is already occupied, please choose an open square.'
        @rules.board.draw_board
        choice = player_square_choice
      end
    end
    @rules.board.board_spaces[:"#{choice}"] = @turn[@counter]
    @rules.board.draw_board
  end

  def cpu_turn
    puts "CPU's turn..."
    pick = Ai.pick_space(@rules.board.board_spaces)
    puts " cpu picks #{pick}"
    @rules.cpu_turn_counter if @rules.board.instance_of?(Lite3Board)
    @rules.board.board_spaces[:"#{pick}"] = @turn[@counter]
    @rules.board.draw_board
    puts 'cpu turn ended'
  end

  def play_game
    puts @players
    # Initialize counter and turn
    @turn = [@players[:p1].mark, @players[:p2].mark]
    @counter = 0
    take_turns
    if @rules.game_over
      puts "Game won by player #{@turn[@counter]}"
    elsif @rules.game_draw
      puts 'The game has ended in a draw!'
    end
  end
end
