require_relative 'piece.rb'
require_relative 'sliding_piece.rb'

class Queen < Piece
  include Slidable

  def move_dirs
    [[0, 1], [0, -1], [1, 0], [-1, 0], [1, 1], [1, -1], [-1, -1], [-1, 1]]
  end

  def symbol
    self.color == :black ? '♛'.colorize(self.color) : '♕'.colorize(self.color)
  end
end
