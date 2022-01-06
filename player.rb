class Player 

  attr_accessor :name, :chances_left, :score

  def initialize(name)
    @name = name
    @score = 0
    @chances_left = 3
  end

end