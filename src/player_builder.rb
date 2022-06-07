# frozen_string_literal: true

require_relative '../src/human_player'
require_relative '../src/cpu_player'
require_relative '../src/builder'

class PlayerBuilder < Builder
  attr_accessor :human_player1, :human_player2, :cpu_player

  def initialize
    super
    @cpu_player = nil
    @human_player1 = nil
    @human_player2 = nil
  end

  def build_human_vs_human_players
    puts 'Please enter a name for this player...'
    @human_player1 = HumanPlayer.new(name: set_player_name, mark: set_player_mark, position: set_player_position)
    puts 'Please enter a name for the next player...'
    @human_player2 = assign_remaining_player(@human_player1)
  end

  def build_cpu_vs_human_players
    puts 'Please enter a name for this player...'
    @human_player1 = HumanPlayer.new(name: set_player_name, mark: set_player_mark, position: set_player_position)
    puts 'Creating and assigning cpu player...'
    @cpu_player = assign_cpu_player(@human_player1)
  end

  def set_player_name
    $stdin.gets.chomp!
  end

  def set_player_position
    puts 'Would you like to be player 1 or player 2, enter 1 or 2...'
    input = $stdin.gets.chomp!
    until valid_position(input)
      puts 'error'
      input = $stdin.gets.chomp!
    end
    input
  end

  def set_player_mark
    puts 'Would you like to be an X or an O, enter X or O...'
    input = $stdin.gets.chomp!.upcase!
    until valid_mark(input)
      puts 'error'
      input = $stdin.gets.chomp!.upcase!
    end
    "#{input} "
  end

  def valid_mark(mark)
    mark if %w[X O].include?(mark)
  end

  def valid_position(position)
    position if %w[1 2].include?(position)
  end

  def assign_remaining_player(player)
    assign_mark = player.mark == 'X ' ? 'O ' : 'X '
    assign_position = player.position == '1' ? '2' : '1'
    HumanPlayer.new(name: set_player_name, mark: assign_mark, position: assign_position)
  end

  def assign_cpu_player(player)
    assign_mark = player.mark == 'X ' ? 'O ' : 'X '
    assign_position = player.position == '1' ? '2' : '1'
    puts @human_player1
    puts @cpu_player
    CpuPlayer.new(mark: assign_mark, position: assign_position)
  end
end
