require_relative 'piece.rb'
require_relative 'sliding_piece.rb'

class Bishop < Piece
  include Slidable
  def symbol
    self.color == :black ? '♝'.colorize(self.color) : '♗'.colorize(self.color)
  end

  def move_dirs
    [[1, 1], [1, -1], [-1, -1], [-1, 1]]
  end


end
