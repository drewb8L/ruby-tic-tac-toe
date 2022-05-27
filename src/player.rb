class Player
  attr_accessor :name, :mark, :position

  def initialize(params)
    @name = params[:name]
    @mark = params[:mark]
    @position = params[:position]
  end

  def to_s
    "Name: #{@name}, Mark: #{@mark}, Position: #{@position}"
  end
end
