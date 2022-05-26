
class Builder

  def set_player_name
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def set_player_mark
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def set_player_position
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
