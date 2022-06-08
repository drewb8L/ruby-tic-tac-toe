# frozen_string_literal: true

# Stores constant for wins ans conducts test
module WinConditions
  def self.check_win(arr1, rows)
    arr1 = arr1.flatten.join.strip.gsub(/\s+/, '')
    arr1 == x_win(rows) || arr1 == o_win(rows)
  end

  def self.x_win(rows)
    str = String.new
    rows.times do
      str.concat('X')
    end
    str
  end

  def self.o_win(rows)
    str = String.new
    rows.times do
      str.concat('O')
    end
    str
  end

  def self.row_wins(game_board, rows)
    count = game_board.board_spaces.size - rows
    wins = []
    rows.times do |i|
      rows.times do |j|
        wins.push(game_board.board_spaces.values_at(j + count))
      end
      count -= rows
    end
    wins = wins.each_slice(rows).to_a
    wins.each do
      wins = wins.keep_if { |i| check_win(i, rows) }
    end
    !wins.empty?
  end

  def self.column_wins(game_board, col)
    count = game_board.board_spaces.size - col
    wins = []
    col.times do
      col.times do |i|
        wins.push(game_board.board_spaces.values_at(count - i))
      end
      count -= col - 1
    end
    wins = wins.each_slice(col).to_a
    wins.each do
      wins = wins.keep_if { |i| check_win(i, col) }
    end
    !wins.empty?
  end

  def self.diagonal_wins_low(game_board, col)
    count = game_board.board_spaces.size - col
    wins = []
    col.times do |i|
      col.times do |j|
        wins.push(game_board.board_spaces.values_at(count + i))
        count -= col - 1
      end

    end
    wins = wins.each_slice(col).to_a
    wins.each do
      wins = wins.keep_if { |i| check_win(i, col) }
    end
    !wins.empty?
  end

  def self.diagonal_wins_high(game_board, col)
    count = game_board.board_spaces.size - 1
    wins = []
    col.times do |i|
      col.times do |j|
        wins.push(game_board.board_spaces.values_at(count + i))
        count -= col + 1
      end

    end
    wins = wins.each_slice(col).to_a
    wins.each do
      wins = wins.keep_if { |i| check_win(i, col) }
    end
    !wins.empty?
  end
end
