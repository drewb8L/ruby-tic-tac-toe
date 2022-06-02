# frozen_string_literal: true

class PlayerDirector
  attr_accessor :builder

  def initialize(builder)
    @builder = builder
  end

  def build_human_player
    builder.build_human_vs_human_players
  end

  def build_cpu_player
    builder.build_cpu_vs_human_players
  end
end
