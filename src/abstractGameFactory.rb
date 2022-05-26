
class AbstractGameFactory

  def create_ttt_classic
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end

  def create_lite3_ttt
    raise NotImplementedError, "#{self.class} has not implemented method '#{__method__}'"
  end
end
