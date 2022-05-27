# frozen_string_literal: true

require_relative '../src/player'

# A cpu player
class CpuPlayer < Player
  attr_accessor :name, :mark, :position

  def initialize(params)
    super
    @name = 'Computer'
  end
end
