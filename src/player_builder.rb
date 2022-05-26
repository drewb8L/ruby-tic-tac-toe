# frozen_string_literal: true

require_relative '../src/human_player'
require_relative '../src/cpu_player'
require_relative '../src/builder'

class PlayerBuilder < Builder
  attr_accessor :human_player, :cpu_player

  def initialize
    super
    @cpu_player = nil
    @human_player = nil
  end

  def build_human_player
    @human_player = HumanPlayer.new(name: set_player_name, mark: set_player_mark, position: set_player_position)
  end

  def build_cpu_player
    @cpu_player = CpuPlayer.new(mark: set_player_mark, position: set_player_position)
  end

  def set_player_name
    puts 'Please enter a name for this player...'
    $stdin.gets.chomp!
  end

  def set_player_position
    puts 'Would you like to be player 1 or player 2, enter 1 or 2...'
    $stdin.gets.chomp!
  end

  def set_player_mark
    puts 'Would you like to be an X or an O, enter X or O...'
    $stdin.gets.chomp!
  end
end
