# frozen_string_literal: true

require_relative './board_creator'
require_relative '../src/board'
require_relative '../src/rules'
require_relative '../src/game'
module GameSetup
  # Sets up TTT or lite3 game
  module TicTacToeGame
    @options = { board: nil, players: { p1: '', p2: '' }, cpu_opponent: false, rules: nil }
    @player_mark = ''
    @choices = %w[X O]

    def player_mark_choice
      mark = ''
      mark = gets.to_s
      unless %w[X O].include?(mark)
        puts 'Select only X or O'
        mark = gets..chomp.upcase
      end
      @player_mark = mark
    end

    def self.ttt_classic
      @options[:board] = BoardCreator::TicTacToeBoard.create_ttt_board
      puts @options[:rules]
      puts 'Playing classic game'
      @options[:rules] = Rules.new(@options[:board])
      puts @options[:rules]
      true
    end

    def self.lite3
      @options[:board] = BoardCreator::TicTacToeBoard.create_lite3_board
      puts 'Playing Lite3 game'
      @options[:rules] = Rules.new(@options[:board])
      true
    end

    def self.select_board
      puts 'There are two versions of the game available, Classic and Lite3,
            Which would you like to play?'
      puts 'Select 1 for classic or 2 for Lite3'
      input = gets.chomp
      unless %w[1 2].include?(input)
        puts 'select only 1 or 2 for options'
        input = gets.chomp
      end
      input == '1' ? ttt_classic : lite3
    end

    def self.chose_mark
      mark = gets.chomp
      unless %w[0 1].include?(mark)
        puts 'Please select only from options provided'
        mark = gets.chomp
      end
      mark
    end

    def self.select_turn_order_and_mark
      position = choose_starting_position
      puts 'Would you like to be X or O? Select 0 for X or 1 for O:'
      mark = chose_mark
      assign_players(position, mark)
    end

    def self.choose_starting_position
      puts 'Would you like to go first or second? Select 1 for first or 2 for second:'
      input = gets.chomp
      until %w[1 2].include?(input)
        puts 'select only 1 or 2 for options'
        input = gets.chomp
      end
      input
    end

    def self.select_opponent
      puts 'Would you like to play against a human or a computer opponent?'
      puts 'Select 1 for human or 2 for CPU'
      input = gets.chomp
      until %w[1 2].include?(input)
        puts 'select only 1 or 2 for options'
        input = gets.chomp
      end
      if input == '1'
        @options[:cpu_opponent] = false
        true
      else
        @options[:cpu_opponent] = true
      end
    end

    def self.assign_players(position, mark)
      # Setup so that the human giving input is set to human automatically and the other player is set to cpu or human
      # based on choices
      human_player1 = { type: 'human', mark: '' }
      human_player2 = { type: 'human', mark: '' }
      cpu_player = { type: 'cpu', mark: '' }

      if position == '1' && @options[:cpu_opponent] == false
        @options[:players][:p1] = human_player1
        @options[:players][:p2] = human_player2
        @options[:players][:p1][:mark] = @choices[mark.to_i]
      elsif position == '2' && @options[:cpu_opponent] == false
        @options[:players][:p2] = human_player2
        @options[:players][:p1] = human_player1
        @options[:players][:p2][:mark] = @choices[mark.to_i]
      end

      if position == '1' && @options[:cpu_opponent] == true
        @options[:players][:p1] = human_player1
        @options[:players][:p2] = cpu_player
        @options[:players][:p1][:mark] = @choices[mark.to_i]
      elsif position == '2' && @options[:cpu_opponent] == true
        @options[:players][:p2] = human_player2
        @options[:players][:p1] = cpu_player
        @options[:players][:p2][:mark] = @choices[mark.to_i]
      end

      if @options[:players][:p1][:mark] == ''
        @options[:players][:p1][:mark] = @options[:players][:p2][:mark] == 'X' ? 'O' : 'X'
      elsif @options[:players][:p2][:mark] == ''
        @options[:players][:p2][:mark] = @options[:players][:p1][:mark] == 'X' ? 'O' : 'X'
      end
    end

    def self.player_setup
      puts 'Welcome to Tic Tac Toe!'
      select_board
      select_opponent
      select_turn_order_and_mark
      puts @options
      # Display formatted game options to the player
      game = Game.new(@options)
      game.begin_game
    end
  end
end
