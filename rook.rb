require_relative 'piece.rb'
require_relative 'sliding_piece.rb'

class Rook < Piece
  includes Slidable
  def initialize(color, symbol, pos)
    super
    @symbol = symbol
  end

  def symbol
    self.color == 'black' ? '♜' : '♖'
  end


  def move_dirs
    [[0, 1], [0, -1], [1, 0], [-1, 0]]
  end



end
