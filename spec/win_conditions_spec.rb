require 'rspec'
require_relative '../modules/win_conditions'
require_relative '../src/board'


describe WinConditions do
  let(:board) { Board.new 3 }
  it 'Should return false given an empty board' do
    expect(subject.row_wins(board, board.rows)).to be_falsey
  end

  it 'Should return true with a row win condition' do
    board.board_spaces[0] = 'X '
    board.board_spaces[1] = 'X '
    board.board_spaces[2] = 'X '
    puts board.board_spaces
    expect(subject.row_wins(board, board.rows)).to be_truthy
  end

  it 'Should return true with a diagonal win condition' do
    board.board_spaces[6] = 'X '
    board.board_spaces[4] = 'X '
    board.board_spaces[2] = 'X '
    puts board.board_spaces
    expect(subject.diagonal_wins_low(board, board.rows)).to be_truthy
  end

  it 'Should return true with a diagonal win condition' do
    board.board_spaces[8] = 'X '
    board.board_spaces[4] = 'X '
    board.board_spaces[0] = 'X '
    puts board.board_spaces
    expect(subject.diagonal_wins_high(board, board.rows)).to be_truthy
  end

end
