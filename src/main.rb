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
  choose_board_size
  game = choose_options(game_options)
  game.call
end
# rubocop:enable Metrics/MethodLength

def choose_options(game_options)
  puts 'There are two version available classic and lite 3,
which would you like to play? Enter 1 for classic or 2 for lite3'
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

def choose_board_size
  puts 'You now have the ability to choose a board size!'
  puts 'Press press Enter for the default 3X3 board or, up to 5 for a max board size of 5X5'
  input = gets.chomp
  until %w[4 5].include?(input) || (input == '')
    puts 'choose only 4, 5 or enter for default board size.'
    input = gets.chomp
  end
  input = 3 if input == ''
  @client.options[:board_size] = input.to_i
end

main
