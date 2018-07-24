require_relative 'piece.rb'
require_relative 'stepping_piece.rb'

class King < Piece
  includes Stepable
  def move_dirs
    [[0, 1], [0, -1], [1, 0], [-1, 0], [1, 1], [1, -1], [-1, -1], [-1, 1]]
  end

  def symbol
    self.color == 'black' ? '♚' : '♔'
  end

end
