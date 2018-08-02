require_relative 'piece.rb'
require_relative 'stepping_piece.rb'

class Knight < Piece
  include Stepable
  def symbol
    self.color == :black ? '♞'.colorize(self.color) : '♘'.colorize(self.color)
  end

  def move_dirs
    moves = []
    (-2..2).each do |idx1|
      next if idx1 == 0
      (-2..2).each do |idx2|
        next if idx2 == 0 || idx2.abs == idx1.abs

        moves << [idx1, idx2]
      end
    end
    moves
  end


end
