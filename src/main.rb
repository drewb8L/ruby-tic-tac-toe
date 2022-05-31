# frozen_string_literal: true

require_relative '../src/client'

def main
  client = Client.new
  client.build_player
  client.build_cpu_player
  client.classic_ttt_game
end

main
