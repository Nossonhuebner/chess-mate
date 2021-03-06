require_relative 'piece.rb'
require_relative 'stepping_piece.rb'

class King < Piece
  include Stepable
  def move_dirs
    [[0, 1], [0, -1], [1, 0], [-1, 0], [1, 1], [1, -1], [-1, -1], [-1, 1]]
  end

  def symbol
    self.color == :black ? '♚'.colorize(self.color) : '♔'.colorize(self.color)
  end

end
