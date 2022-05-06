# frozen_string_literal: true

require 'singleton'
class Ai
  include Singleton

  def self.pick_space(spaces)
    options = []
    spaces.each_pair do |key, value|
      options << key if value == ' '
    end
    pick = options[(Random.rand(0..options.length - 1))]
  end
end
