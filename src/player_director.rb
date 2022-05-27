# frozen_string_literal: true

class PlayerDirector
  attr_accessor :builder

  def initialize(builder)
    @builder = builder
  end

  def build_human_player
    builder.build_human_player
  end

  def build_cpu_player
    builder.build_cpu_player
  end
end
