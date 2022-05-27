# frozen_string_literal: true

# Abstract game and public interface
class AbstractGame < Game
  # @abstract
  def play_game
    raise NotImplementedError, "#{self.class} is not implementing '#{__method__}'"
  end
end
