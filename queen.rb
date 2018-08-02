require_relative 'piece.rb'
require_relative 'sliding_piece.rb'

class Queen < Piece
  includes Slidable

  def move_dirs
    [[0, 1], [0, -1], [1, 0], [-1, 0], [1, 1], [1, -1], [-1, -1], [-1, 1]]
  end

  def symbol
    self.color == :black ? '♛' : '♕'
  end
end
