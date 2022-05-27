# frozen_string_literal: true

require 'singleton'
# Computer player
class Ai
  include Singleton

  def self.pick_space(spaces)
    options = []
    spaces.each_pair do |key, value|
      options << key if value == ' '
    end
    options[(Random.rand(0..options.length - 1))]
  end

  #  TODO: smarter Ai methods

end