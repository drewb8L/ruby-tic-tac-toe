# frozen_string_literal: true

# Abstract class for game factories
class AbstractGameFactory
  attr_accessor :options

  def initialize(options)
    @options = options
  end

  def create_game
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
