require_relative '../src/abstractGameFactory'
require_relative '../src/ttt_rules'
require_relative '../src/TttBoard'
require_relative '../src/game'

class ClassicTttGameFactory < AbstractGameFactory
  attr_accessor :options

  def initialize(options)
    super
    @options = options
    board = TttBoard.new
    @options[:rules] = TttRules.new(board)
    set_position
  end

  def create_game
    Game.new(@options)
  end

  def set_position
    if @options[:players][:p1].class || @options[:players][:p2].instance_of?(CpuPlayer)
      @options[:cpu_opponent] = true
    end

  end
end
#{:board=>nil,
# :players=>{:p1=>#<HumanPlayer:0x0000000104dbd8c8 @name="Andrew", @mark="X", @position="1">,
# :p2=>#<CpuPlayer:0x0000000104dbce00 @name="Computer", @mark="O", @position="2">},
# :cpu_opponent=>false,
# :rules=>nil}

