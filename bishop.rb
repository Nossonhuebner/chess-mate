require_relative 'piece.rb'
require_relative 'sliding_piece.rb'

class Bishop < Piece
  includes Slidable
  def symbol
    self.color == 'black' ? '♝' : '♗'
  end

  def move_dirs
    [[1, 1], [1, -1], [-1, -1], [-1, 1]]
  end


end
