require_relative '../src/player'
class HumanPlayer < Player
  attr_accessor :name, :mark, :position

  def initialize(params)
    super
  end
end
