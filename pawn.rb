require_relative 'piece.rb'

class Pawn < Piece

  def symbol
    self.color == 'black' ? '♟' : '♙'
  end

  def at_start_row?
    if self.color == 'black'
      return true if self.pos[0] == 1
    else
      return true if self.pos[0] == 6
    end
    false
  end

  def forward_dir
    return self.color == 'black' ? 1 : -1
  end
end
