# frozen_string_literal: true

require_relative '../src/client'
# rubocop:disable Metrics/MethodLength
def main
  @client = Client.new

  player_options = {
    human_player: proc { @client.build_player },
    cpu_player: proc { @client.build_cpu_player }
  }

  game_options = {
    classic_ttt: proc { @client.classic_ttt_game },
    lite3: proc { @client.lite3_ttt_game }
  }

  puts 'Welcome to Tic Tac toe!'
  choose_players(player_options)
  game = choose_options(game_options)
  game.call
end
# rubocop:enable Metrics/MethodLength

def choose_options(game_options)
  puts 'There are two version available classic and lite 3,
 which would you lie to play? Enter 1 for classic or 2 for lite3'
  choose_game_type(game_options)
end

def choose_game_type(options)
  input = gets.chomp
  until %w[1 2].include?(input)
    puts 'choose 1 or 2 only'
    input = gets.chomp
  end
  input == '1' ? options[:classic_ttt] : options[:lite3]
end

def choose_players(options)
  puts 'How would you like to play? Human vs human or human vs computer?'
  puts 'Select 1 for human v human or 2 for human v computer'
  input = gets.chomp
  until %w[1 2].include?(input)
    puts 'choose only 1 or 2'
    input = gets.chomp
  end
  input == '1' ? options[:human_player].call : options[:cpu_player].call
end

def player_setup(client, input)
  client.build_player if input == '1'
end

def choose_board_size(size); end

main
