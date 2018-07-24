require_relative 'piece.rb'

class Rook < Piece

  def initialize(color, symbol, pos)
    super
    @symbol = symbol

  end

  def move_dirs
    [[0, 1], [0, -1], [1, 0], [-1, 0]]
  end

  def at_start_row?
    if self.color == 'black'
      return true if self.pos[0] == 1
    else
      return true if self.pos[0] == 6
    end
    false
  end

end
