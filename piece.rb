class Piece
  def initialize(color = :null, board = nil, pos = nil)
    @color, @board, @pos = color, board, pos
  end

  def to_s
  end

  def empty?
  end

  def valid_moves
  end

  def pos=(val)
  end

  def symbol
  end

  def move_into_check(end_pos)
  end
end




class Queen < Piece
end

class Knight < Piece
end

class King < Piece
end
