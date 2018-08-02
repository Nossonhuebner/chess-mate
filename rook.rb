require_relative 'piece.rb'
require_relative 'sliding_piece.rb'

class Rook < Piece
  include Slidable

  def symbol
    self.color == :black ? '♜'.colorize(self.color) : '♖'.colorize(self.color)
  end


  def move_dirs
    [[0, 1], [0, -1], [1, 0], [-1, 0]]
  end



end
