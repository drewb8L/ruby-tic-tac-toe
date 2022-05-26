require_relative './player'
class CpuPlayer < Player
  attr_accessor :name, :mark, :position

  def initialize(params)
    super
    @name = 'Computer'
  end
end
