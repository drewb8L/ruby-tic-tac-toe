class Board
  def draw_board
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
