# frozen_string_literal: true

class Player
  attr_accessor :mark

  def initialize(mark, player_type)
    @mark = mark
    # @player_type = player_type
  end

  def player_type(type)
    player_types = {
      '1': 'human',
      '2': 'cpu'
    }
    player_types[type]
  end

  def player
    [@mark, @player_type]
  end
end
