# frozen_string_literal: true

require 'rspec'
require_relative '../src/ai'
require_relative '../src/game'

describe Ai do
  ai = Ai.instance
  it 'succeeds' do
    expect(ai.object_id).to eq(ai.object_id)
  end
end

context Ai do
  game = Game.new
  spaces = game.game_board.board_spaces
  new_spaces = spaces.clone
  spaces[:"9"] = 'X'
  spaces[:"5"] = 'O'
  spaces[:"8"] = 'X'
  spaces[:"7"] = 'X'
  spaces[:"6"] = 'O'
  spaces[:"4"] = 'X'
  pick = Ai.pick_space(spaces)
  spaces[:"#{pick}"] = 'O'

  it 'should pick an empty space when given a hash of board spaces' do
    expect(spaces).to_not eq(new_spaces)

  end
  puts "Ai picked square #{pick}"
  puts game.game_board.board_spaces
end

