class Player
  attr_accessor :name, :mark, :position

  def initialize(params)
    @name = params[:name]
    @mark = params[:mark]
    @position = params[:position]
  end

  def player
    { name: @name, mark: @mark, position: @position }
  end
end
