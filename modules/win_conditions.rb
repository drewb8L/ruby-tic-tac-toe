# frozen_string_literal: true

# Stores constant for wins ans conducts test
module WinConditions

  def self.check_win(arr1)
    true if arr1.eql?(%w[X X X]) || arr1.eql?(%w[O O O])
  end

  def self.row_wins(game_board)
    wins = [
      game_board.board_spaces.values_at(:'7', :'8', :'9'),
      game_board.board_spaces.values_at(:'4', :'5', :'6'),
      game_board.board_spaces.values_at(:'1', :'2', :'3')
    ]
    wins.map { |i| check_win(i) }.join != ''
  end

  def self.column_wins(game_board)
    wins = [
      game_board.board_spaces.values_at(:'7', :'4', :'1'),
      game_board.board_spaces.values_at(:'8', :'5', :'2'),
      game_board.board_spaces.values_at(:'9', :'6', :'3')
    ]
    wins.map { |i| check_win(i) }.join != ''
  end

  def self.diagonal_wins(game_board)
    wins = [
      game_board.board_spaces.values_at(:'7', :'5', :'3'),
      game_board.board_spaces.values_at(:'1', :'5', :'9')
    ]
    wins.map { |i| check_win(i) }.join != ''
  end

end
