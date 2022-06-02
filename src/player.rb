# frozen_string_literal: true

class Player
  attr_accessor :name, :mark, :position, :rules

  def initialize(params)
    @name = params[:name]
    @mark = params[:mark]
    @position = params[:position]
    @rules = params[:rules]
  end

  def to_s
    "Name: #{@name}, Mark: #{@mark}, Position: #{@position}"
  end

  def take_turn_cpu(counter, turn)
    puts "CPU's turn..."
    pick = Ai.pick_space(@rules.board.board_spaces)
    puts " cpu picks #{pick}"
    @rules.cpu_turn_counter if @rules.board.instance_of?(Lite3Board)
    @rules.board.board_spaces[:"#{pick}"] = turn[counter]
    @rules.board.draw_board
    puts 'cpu turn ended'
  end

  def take_turn_human(counter, turn)
    choice = player_square_choice
    if !choice && counter.zero?
      until choice
        puts 'That square is already occupied, please choose an open square.'
        rules.board.draw_board
        choice = player_square_choice
      end
    end
    @rules.board.board_spaces[:"#{choice}"] = turn[counter]
    @rules.board.draw_board
  end

  def player_square_choice
    puts 'Choose a square'
    input = gets.to_i
    # choice will return valid or invalid
    @rules.valid_square_choice_input?(input)
  end

end
