class Player
  attr_reader :character

  def initialize(character)
    @character = character
  end

  def get_spot(board)
    raise NotImplementedError, self
  end
end
