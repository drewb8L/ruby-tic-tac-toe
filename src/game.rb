# frozen_string_literal: true

require_relative '../src/ai'
require_relative '../src/lite3_board'

# Manages the game
class Game
  attr_accessor :players, :rules

  def initialize(params)
    @rules = params[:rules]
    @players = params[:players]
    @players[:p1].rules = @rules
    @players[:p2].rules = @rules
  end

  def begin_game
    puts @rules.board.draw_board
    puts "The numbers displayed on the board correspond the number to enter to take the space.
To take space 05, enter 5, without the zero.
 \nEnter numbers to make a move."
    play_game
  end

  private

  # rubocop:disable Metrics/AbcSize, Metrics/CyclomaticComplexity,  Metrics/PerceivedComplexity
  def take_turns
    until @rules.game_over || @rules.game_draw
      player_one unless @rules.check_draw || @rules.check_win_condition
      @counter = @counter.zero? ? 1 : 0 unless @rules.check_win_condition || @rules.check_draw
      player_two unless @rules.check_win_condition || @rules.check_draw
      @counter = @counter.zero? ? 1 : 0 unless @rules.check_win_condition || @rules.check_draw
    end
  end
  # rubocop:enable Metrics/AbcSize, Metrics/CyclomaticComplexity, Metrics/PerceivedComplexity

  # rubocop:disable Layout/LineLength
  def player_one
    @players[:p1].instance_of?(CpuPlayer) ? @players[:p1].take_turn_cpu(@counter, @turn) : @players[:p1].take_turn_human(@counter, @turn)
  end

  def player_two
    @players[:p2].instance_of?(CpuPlayer) ? @players[:p1].take_turn_cpu(@counter, @turn) : @players[:p2].take_turn_human(@counter, @turn)
  end
  # rubocop:enable Layout/LineLength

  def play_game
    # Initialize counter and turn
    @turn = [@players[:p1].mark, @players[:p2].mark]
    player_names = [@players[:p1].name, @players[:p2].name]
    @counter = 0
    take_turns
    if @rules.game_over
      puts "Game won by #{player_names[@counter]}"
    elsif @rules.game_draw
      puts 'The game has ended in a draw!'
    end
  end
end
